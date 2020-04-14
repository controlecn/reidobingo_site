using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
using System.Drawing;
using LuckPrize.Common.Data;
using System.Timers;

namespace LuckPrize.GameBingo
{
    // tipo de rodada
    public enum BingoGameType { none, normal, mega };

    // usado em testes de tempo de resposta do servidor -- n�o tem fun��o real no jogo em si.
    public class TestDelayTO
    {
        public int count;
        public List<int> dummy;
    }

    // gerado a cada nova rodada
    // guarda os jogadores que apostaram na rodada corrente e suas cartelas
    public class BingoTurnPlayer
    {
        public int user_id;                                             // usu�rio que est� participando da rodada
        public List<BingoTicket> tickets = new List<BingoTicket>();     // lista de cartelas do usu�rio
    }

    // usado no retorno do chat
    // para dizer quais os jogadores que participam da rodada,
    // se est�o online e quais seus access_levels
    public class BingoTurnChatPlayer
    {
        public bool online;
        public int user_id;
        public string nick;
        public Access_Level access_level;
    }

    // info chat - retornado a cada atualiza��o do chat no flash
    // diz quem est� jogando e as novas linhas de chat desde a �ltima atualiza��o
    public class BingoChatInfoTO
    {
        public List<BingoTurnChatPlayer> loggedNicks = new List<BingoTurnChatPlayer>();
        public List<string> lines = new List<string>();
    }

    // defini��o de uma cartela
    public class BingoTicket
    {
        public List<byte> numbers = new List<byte>();
        public byte patternWinBall;
    }

    // defini��o de um padr�o de cartela
    public class BingoPattern
    {
        public string name;
        public UInt16[] lines = new UInt16[5];
        public BingoPattern() { }
        public BingoPattern(string name, byte line1, byte line2, byte line3, byte line4, byte line5)
        {
            this.name = name;
            this.lines[0] = line1;
            this.lines[1] = line2;
            this.lines[2] = line3;
            this.lines[3] = line4;
            this.lines[4] = line5;
        }
    }

    // info da rodada atual e pr�ximas N rodadas
    // sempre que um jogador entra no bingo, e no in�cio de cada rodada,
    // o flash vai solicitar essa informa��o a respeito da rodada corrente
    public class BingoInfoTO
    {
        public ResultsBingoTO currentGame = new ResultsBingoTO();
        public BetInfoTO currentGameTotals = new BetInfoTO();
        public UInt16[] currentGamePattern;

        public List<ResultsBingoTO> nextGames = new List<ResultsBingoTO>();
        public List<BetInfoTO> nextGamesTotals = new List<BetInfoTO>();

        public UInt32 timeToNext;
        public UInt32 serverTime;

        public float turn_prize;
        public float turn_accum;
        public int user_id;
        public short user_access_level;
        public string user_nick;
        public float user_credits;
        public float user_bonus;
        public float user_prize;
        public List<BingoTicket> user_tickets = new List<BingoTicket>();
        public List<int> user_nextTicketsCount = new List<int>();

        public List<byte> serverBalls = new List<byte>();
        public byte currentBallIdx;
    }

    // info da pr�xima rodada - o flash solicita essa info periodicamente
    // para saber qual o padr�o da pr�xima rodada, o pr�mio, quantos apostadores, etc
    public class BingoNextInfoTO
    {
        public BingoGameType turn_type;
        public UInt16[] gamePattern;
        public int id;
        public int user_ticketsCount;
        public int totalPlayers;
        public int totalTickets;
        public float ticketValue;
        public float user_credits;
        public float user_bonus;
        public float user_prize;
        public float prize;
    }

    /// <summary>
    /// A classe principal do Bingo
    /// </summary>
    public class Bingo
    {
        const int TOP_BOLA = 45;
        static Bingo instance = null;
        static readonly object singletonSync = new object();


        // ---
        private ResultsBingoTO currentGame = new ResultsBingoTO();
        private BetInfoTO currentGameTotals = new BetInfoTO();
        private List<BingoTurnPlayer> currentPlayers = new List<BingoTurnPlayer>(); // lista dos jogadores da rodada e suas cartelas
        private List<ResultsBingoTO> nextGames;
        private List<BetInfoTO> nextGamesTotals = new List<BetInfoTO>();

        private int currentGamePatternIdx = 0;

        private byte currentBallIdx = 0;
        private List<byte> serverBalls = new List<byte>();
        // ---


        public static Bingo Instance
        {
            get
            {
                lock (singletonSync)
                {
                    if (instance == null)
                    {
                        instance = new Bingo();
                    }
                    return instance;
                }
            }

            set
            {
                instance.bingoTimer.Enabled = false;
                instance = value;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        public Bingo()
        {
            ResultsBingo.CancelAllOld();

            Reset();

            bingoTimer = new Timer(2000);
            bingoTimer.Elapsed += new ElapsedEventHandler(bingoTimer_Elapsed);
            bingoTimer.Enabled = true;

            timeoutDate = DateTime.Now.AddMinutes(70);
        }

        void bingoTimer_Elapsed(object sender, ElapsedEventArgs e)
        {
            try
            {
                Bingo.Instance.Tick();
            }
            catch (Exception ex)
            {
                Common.Data.Log.Insert(Common.Data.Log_Type.Error, ex.Message);
            }

            try
            {
                Global.DoBingoTimeouts();
            }
            catch (Exception ex)
            {
                Common.Data.Log.Insert(Common.Data.Log_Type.Error, ex.Message);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="bin"></param>
        /// <returns></returns>
        private byte BinToByte(string bin)
        {
            byte b = 0;
            for (int i = 4; i >= 0; i--)
            {
                b += (byte)((bin[i] - 48) * Math.Pow(2, 4 - i));
            }
            return b;
        }

        /// <summary>
        /// Gera alguns padr�es de fechamento de cartelas
        /// </summary>
        private void GenPatterns()
        {
            Global.patterns.Clear();

            Global.patterns.Add(new BingoPattern("Black", BinToByte("11111"), BinToByte("11111"), BinToByte("11111"), BinToByte("11111"), BinToByte("11111")));
            Global.patterns.Add(new BingoPattern("Xis", BinToByte("10001"), BinToByte("01010"), BinToByte("01110"), BinToByte("01010"), BinToByte("10001")));
            Global.patterns.Add(new BingoPattern("Cruz", BinToByte("00100"), BinToByte("00100"), BinToByte("11111"), BinToByte("00100"), BinToByte("00100")));
            Global.patterns.Add(new BingoPattern("Zero", BinToByte("01110"), BinToByte("10001"), BinToByte("10001"), BinToByte("10001"), BinToByte("01110")));
            Global.patterns.Add(new BingoPattern("Velha", BinToByte("01010"), BinToByte("11111"), BinToByte("01010"), BinToByte("11111"), BinToByte("01010")));
            Global.patterns.Add(new BingoPattern("T", BinToByte("11111"), BinToByte("00100"), BinToByte("00100"), BinToByte("00100"), BinToByte("00100")));
            Global.patterns.Add(new BingoPattern("<>", BinToByte("00100"), BinToByte("01010"), BinToByte("10001"), BinToByte("01010"), BinToByte("00100")));

            // + 4 padr�es na vertical
            // + 4 padr�es na horizontal
            for (int i = 0; i < 4; i++)
            {
                byte vert = (byte)(3 << i);
                Global.patterns.Add(new BingoPattern("Vertical", vert, vert, vert, vert, vert));
            }

        }

        /// <summary>
        /// Gera N cartelas �nicas
        /// </summary>
        /// <param name="numTickets"></param>
        private void GenTickets(int numTickets, UInt16[] pattern)
        {
            allTickets.Clear();

            for (int t = 0; t < numTickets; t++)
            {
                BingoTicket newTicket = new BingoTicket();
                byte patWinBall;         // n�mero de bolas da rodada para fechar o padr�o corrente

                while (true)
                {
                    newTicket.numbers.Clear();
                    patWinBall = 0;
                    for (int col = 0; col < 5; col++)
                    {
                        for (int b = 0; b < 5; b++)
                        {
                            byte num;
                            if (col == 2 && b == 2)
                            {
                                num = 0;
                            }
                            else
                            {
                                do
                                {
                                    num = (byte)(1 + (col * 15) + Global.rnd.Next(15));
                                } while (newTicket.numbers.Contains(num));

                                // verifica em qual bola da rodada esse n�mero se encontra
                                int ballPos = serverBalls.IndexOf(num);

                                // atualiza a bola exata em que o padr�o fechar� por completo
                                // b = linha dentro do padr�o
                                // col = bit dentro do padr�o
                                int pattidx = b;
                                int pattbit = 4 - col;

                                if ((pattern[pattidx] & (int)Math.Pow(2, pattbit)) > 0)
                                {
                                    // acertou em um item do padr�o
                                    if (ballPos > patWinBall) patWinBall = (byte)ballPos;
                                }

                            }
                            newTicket.numbers.Add(num);
                        }
                    }

                    // varre todas as cartelas e se tiver alguma com muitos n�meros iguais aos da nova, rejeita
                    bool found = false;
                    if (allTickets.Count > 0)
                    {
                        foreach (BingoTicket aTicket in allTickets)
                        {
                            int existing = 0;
                            foreach (byte num in newTicket.numbers)
                            {
                                if (aTicket.numbers.Contains(num))
                                {
                                    existing++;
                                }
                                else
                                {
                                    break;
                                }
                            }
                            if (existing >= 12)      // limita o n�mero de n�meros repetidos em quaisquer cartelas
                            {
                                found = true;
                                break;
                            }
                        }
                    }
                    if (!found) break;
                }

                // patWinBall e blkWinBall t�m os valores das bolas exatas em que
                // essa cartela fecha dentro do padr�o e tamb�m por completo.
                newTicket.patternWinBall = patWinBall;

                // adiciona � lista de cartelas da rodada
                allTickets.Add(newTicket);
            }

            // varre todas as cartelas e determina as vencedoras
            winnerTickets.Clear();
            currentGame.winner_num_balls = 75;
            for (int t = 0; t < allTickets.Count; t++)
            {
                if (allTickets[t].patternWinBall == currentGame.winner_num_balls)
                {
                    // adiciona essa cartela � lista de vencedoras
                    winnerTickets.Add(t);
                }

                if (allTickets[t].patternWinBall < currentGame.winner_num_balls)
                {
                    // atualiza a bola vencedora
                    currentGame.winner_num_balls = allTickets[t].patternWinBall;

                    // remove quaisquer potenciais vencedores anotados anteriormente
                    winnerTickets.Clear();

                    // adiciona a cartela atual
                    winnerTickets.Add(t);
                }
            }

            // ### DEBUG ###
            Common.Data.Log.Insert(Common.Data.Log_Type.Debug, allTickets.Count + " cartelas geradas");
            // ### DEBUG ###
        }

        private int FindBingoTurnPlayerIdx(int user_id)
        {
            for (int i = 0; i < currentPlayers.Count; i++)
            {
                if (currentPlayers[i].user_id == user_id)
                {
                    return i;
                }
            }
            return -1;
        }

        /// <summary>
        /// Sorteia as 75 bolas do servidor
        /// </summary>
        private void ScrambleBalls(int times)
        {
            for (int i = 0; i < times; i++)
            {
                byte ball1 = (byte)Global.rnd.Next(75);
                byte ball2 = (byte)Global.rnd.Next(75);
                byte ballTmp = serverBalls[ball1];
                serverBalls[ball1] = serverBalls[ball2];
                serverBalls[ball2] = ballTmp;
            }
        }

        /// <summary>
        /// Rel� configura��es e reinicia contagem de tempo dos jogos
        /// </summary>
        public void Reset()
        {
            // ### DEBUG ###
            Common.Data.Log.Insert(Common.Data.Log_Type.Debug, "RESET");
            // ### DEBUG ###

            cfg = Common.Data.MiscConfigurations.GetConfigurations();

            // cria as bolas
            serverBalls.Clear();
            for (int b = 1; b < 76; b++) serverBalls.Add((byte)b);

            // n�o h� jogo inicialmente em andamento...
            ClearCurrentGame();
            GenPatterns();

            // determina as datas dos pr�ximos jogos
            nextGames = ResultsBingo.GetNextResults(false, false);
            nextGamesTotals.Clear();
            foreach (ResultsBingoTO res in nextGames)
            {
                nextGamesTotals.Add(ReservedTicketsBingo.GetBetInfo(res.id));
            }
        }

        /// <summary>
        /// Limpa os dados do jogo corrente
        /// </summary>
        private void ClearCurrentGame()
        {
            // ### DEBUG ###
            Common.Data.Log.Insert(Common.Data.Log_Type.Debug, "Finalizado: " + currentGame.id);
            // ### DEBUG ###

            // calcula o pr�mio (divide pelo n�mero de vencedores)
            float prize = currentGameTotals.total_bet * (cfg.bingo_percent_prize / 100.0f);

            if (currentGame.turn_type == BingoGameType.mega)
            {
                // se a bola vencedora for at� a TOP_BOLA�, d� o acumulado tamb�m
                // nota: aqui a bola 1 � o �ndice 0
                if (currentGame.winner_num_balls < TOP_BOLA)
                {
                    // ### DEBUG ###
                    Common.Data.Log.Insert(Common.Data.Log_Type.Debug, "Pago acumulado N� " + currentGame.id + ": " + Common.Util.Misc.FormatReal(cfg.bingo_accum));
                    // ### DEBUG ###

                    prize += cfg.bingo_accum;
                    cfg.bingo_accum = cfg.bingo_initial_accum;
                    Common.Data.MiscConfigurations.Update(cfg);
                }
            }

            // atualiza o pr�mio do jogo que ser� gravado no banco
            currentGame.total_bet = currentGameTotals.total_bet;
            currentGame.total_prize = prize;

            // distribui o pr�mio entre os vencedores
            float distr_prize = prize / currentGame.extras.winner_users_ids.Count;
            for (int i=0; i<currentGame.extras.winner_users_ids.Count; i++)
            {
                currentGame.extras.winner_users_prizes[i] = distr_prize;
                Common.Data.UserTO userTO = Common.Data.User.GetUserById(currentGame.extras.winner_users_ids[i]);
                userTO.prize += distr_prize;
                Common.Data.User.Update(userTO);

                // insere no log o registro de pagamento do usu�rio
                Common.Data.LogTO log = new Common.Data.LogTO();
                log.user_id = currentGame.extras.winner_users_ids[i];
                log.log_type = Common.Data.Log_Type.BingoPrize;
                log.description = "Pr�mio bingo rodada N� " + currentGame.id;
                log.value = distr_prize;
                Common.Data.Log.Insert(log);
            }

            // confirma a rodada
            currentGame.confirmation_date = DateTime.Now;
            if (currentGame.winner_num_balls > 0)
            {
                ResultsBingo.Confirm(currentGame);
            }
            else
            {
                // exce��o: n�o tem ganhador!
                // essa rodada n�o ocorreu de verdade, ent�o cancela e devolve as apostas
                ResultsBingo.Cancel(currentGame.id);
            }

            currentGame.turn_type = BingoGameType.none;
            currentGame.id = 0;
            currentGame.ticket_value = 0;
            currentGame.winner_num_balls = 0;

            currentGameTotals.total_bet = 0;
            currentGameTotals.total_players = 0;
            currentGameTotals.total_tickets = 0;
        }

        /// <summary>
        /// Come�a um novo jogo
        /// </summary>
        private void StartGame()
        {
            // inicia a rodada
            currentGame = nextGames[0];
            currentGamePatternIdx = nextGames[0].pattern_idx;

            // ### DEBUG ###
            //Common.Data.Log.Insert(Common.Data.Log_Type.Debug, "StartGame: " + currentGame.id);
            // ### DEBUG ###

            // pega o total de apostas mais atualizado do banco
            currentGameTotals = ReservedTicketsBingo.GetBetInfo(currentGame.id);

            // atualiza as datas dos pr�ximos jogos
            nextGames = ResultsBingo.GetNextResults(true, false);

            // ### DEBUG ###
            //Common.Data.Log.Insert(Common.Data.Log_Type.Debug, "New Nextgame: " + nextGames[0].date.ToString());
            // ### DEBUG ###

            nextGamesTotals.Clear();
            foreach (ResultsBingoTO res in nextGames)
            {
                nextGamesTotals.Add(ReservedTicketsBingo.GetBetInfo(res.id));
            }

            ScrambleBalls(750);
            currentBallIdx = 0;
            startGameDelay = 5;

            float win1 = cfg.bingo_chance_1winner * (float)Global.rnd.NextDouble();
            float win2 = cfg.bingo_chance_2winner * (float)Global.rnd.NextDouble();
            float win3 = cfg.bingo_chance_3winner * (float)Global.rnd.NextDouble();

            // 00 05 10 15 20
            // 01 06 11 16 21
            // 02 07 12 17 22
            // 03 08 13 18 23
            // 04 09 14 19 24

            // se tiver n�mero suficiente de jogadores, ...
            // ... e a rodada n�o tiver sido cancelada anteriormente por alguma raz�o ...
            // ... gera todas as cartelas �nicas da rodada
            if (currentGameTotals.total_players > 1 && currentGame.cancellation_date == DateTime.MinValue)
            {
                // atualiza o pr�mio acumulado
                cfg = Common.Data.MiscConfigurations.GetConfigurations();
                cfg.bingo_accum += currentGameTotals.total_bet * (cfg.bingo_percent_accum / 100.0f);
                Common.Data.MiscConfigurations.Update(cfg);

                GenTickets(currentGameTotals.total_tickets, Global.patterns[currentGamePatternIdx].lines.ToArray());

                // cria os jogadores da rodada
                currentPlayers.Clear();


                // distribui as cartelas geradas entre os jogadores
                int ticketIdx = 0;
                currentGame.extras.winner_users_ids.Clear();
                currentGame.extras.winner_users_nicks.Clear();
                currentGame.extras.winner_users_prizes.Clear();
                foreach (ReservedTicketsBingoTO reservedTO in reservedListTO)
                {
                    BingoTurnPlayer player = new BingoTurnPlayer();
                    player.user_id = reservedTO.user_id;
                    for (int i = 0; i < reservedTO.tickets; i++)
                    {
                        if (winnerTickets.Contains(ticketIdx))
                        {
                            // esse usu�rio tem uma cartela vencedora
                            currentGame.extras.winner_users_ids.Add(player.user_id);
                            currentGame.extras.winner_users_nicks.Add(Common.Data.User.ExistsById(player.user_id));
                            currentGame.extras.winner_users_prizes.Add(0);  // pr�mio ser� atualizado no fim da rodada
                        }
                        player.tickets.Add(allTickets[ticketIdx++]);
                    }
                    currentPlayers.Add(player);
                }

                // ### DEBUG ###
                Common.Data.Log.Insert(Common.Data.Log_Type.Debug, "Iniciada N� " + currentGame.id);
                // ### DEBUG ###

            }
            else
            {
                // jogada cancelada por falta de jogadores
                // ou porque tinha sido cancelada por alguma outra raz�o
                allTickets.Clear();
                winnerTickets.Clear();
                currentPlayers.Clear();
                currentGame.winner_num_balls = 0;
                if (currentGame.cancellation_date == DateTime.MinValue)
                {
                    // ainda n�o tinha sido cancelada, ent�o ser� por falta de jogadores...
                    ResultsBingo.Cancel(currentGame.id);
                }
                currentGame.turn_type = BingoGameType.none;

                // ### DEBUG ###
                //Common.Data.Log.Insert(Common.Data.Log_Type.Debug, "Cancelada N� " + currentGame.id);
                // ### DEBUG ###

            }

            GC.Collect();
        }

        /// <summary>
        /// 
        /// </summary>
        public void Tick()
        {
            DateTime now = DateTime.Now;

            if (currentGame.turn_type == BingoGameType.none)
            {
                // verifica timeout sem atividade
                if (now > timeoutDate)
                {
                    // ### DEBUG ###
                    Common.Data.Log.Insert(Common.Data.Log_Type.Debug, "ENCERRADO POR INATIVIDADE");
                    // ### DEBUG ###

                    Bingo.Instance = null;
                    GC.Collect();
                    return;
                }

                // verifica in�cio da pr�xima rodada
                if (now > nextGames[0].date)
                {
                    // come�a pr�ximo jogo
                    StartGame();
                }
            }
            else
            {
                if (now > nextGames[0].date)
                {
                    // ocorreu uma sobreposi��o de hor�rios
                    // cancela pr�ximo jogo
                    if (nextGames[0].cancellation_date == DateTime.MinValue)
                    {
                        nextGames[0].cancellation_date = now;
                        ResultsBingo.Cancel(nextGames[0].id);
                    }
                }

                if (startGameDelay > 0)
                {
                    startGameDelay--;
                }
                else
                {
                    currentBallIdx++;
                    if (currentBallIdx >= currentGame.winner_num_balls)
                    {
                        // terminou a rodada corrente
                        ClearCurrentGame();
                    }
                }
            }
        }

        /// <summary>
        /// Tempo que falta para o pr�ximo jogo, em segundos
        /// </summary>
        /// <returns></returns>
        public UInt32 SecondsToDate(DateTime date)
        {
            TimeSpan span = date - DateTime.Now;
            return (UInt32)span.TotalSeconds;
        }

        /// <summary>
        /// Usu�rio entrou no bingo ou pediu atualiza��o das informa��es
        /// </summary>
        public BingoInfoTO EnterAndGetInformation(string session)
        {
            DateTime currentTime = DateTime.Now;

            // atualiza o timeout
            timeoutDate = currentTime.AddMinutes(70);

            WebLoggedUser webUser = Global.GetRegisteredBySession(session);
            if (webUser == null) return null;

            Common.Data.UserTO userTO = Global.GetUserTOBySession(session);

            if (webUser.bingo == null)
            {
                Global.EnterBingo(session, this);
                Global.ChatAddLine(null, "<b>" + userTO.nick + "</b> entrou.");
            }

            BingoInfoTO info = new BingoInfoTO();

            info.currentGame = currentGame;
            info.currentGameTotals = currentGameTotals;
            info.currentGamePattern = Global.patterns[currentGamePatternIdx].lines.ToArray();

            // determina as datas dos pr�ximos jogos
            info.nextGames = ResultsBingo.GetNextResults(false, true);
            info.nextGamesTotals.Clear();
            foreach (ResultsBingoTO res in info.nextGames)
            {
                info.nextGamesTotals.Add(ReservedTicketsBingo.GetBetInfo(res.id));
            }

            // v�rias informa��es da rodada
            info.timeToNext = SecondsToDate(info.nextGames[0].date);
            DateTime serverNow = currentTime;
            info.serverTime = (UInt32)serverNow.TimeOfDay.TotalSeconds;
            info.turn_prize = currentGameTotals.total_bet * (cfg.bingo_percent_prize / 100.0f);
            info.turn_accum = cfg.bingo_accum;
            info.user_id = userTO.id;
            info.user_access_level = (short)userTO.access_level;
            info.user_nick = userTO.nick;
            info.user_credits = userTO.credits;
            info.user_bonus = userTO.bonus;
            info.user_prize = userTO.prize;

            // localiza as cartelas do jogador nessa rodada
            int idx = FindBingoTurnPlayerIdx(userTO.id);
            if (currentGame.turn_type == BingoGameType.none || idx == -1)
            {
                info.user_tickets = null;
            }
            else
            {
                info.user_tickets = currentPlayers[idx].tickets;
            }

            // determina quantas cartelas o jogador tem em cada uma das pr�ximas rodadas
            for (int i = 0; i < info.nextGames.Count; i++)
            {
                List<ReservedTicketsBingoTO> user_reservedListTO = ReservedTicketsBingo.GetTicketsList(info.nextGames[i].id, userTO.id, true);
                if (user_reservedListTO != null && user_reservedListTO.Count > 0)
                {
                    info.user_nextTicketsCount.Add(user_reservedListTO[0].tickets);
                }
                else
                {
                    info.user_nextTicketsCount.Add(0);
                }
            }

            // retorna as bolas da rodada e o �ndice da �ltima bola j� sorteada
            info.serverBalls = serverBalls;
            info.currentBallIdx = currentBallIdx;

            GC.Collect();

            return info;
        }

        public BingoNextInfoTO NextInfo(string session)
        {
            WebLoggedUser webUser = Global.GetRegisteredBySession(session);
            if (webUser == null) return null;

            Common.Data.UserTO userTO = Global.GetUserTOBySession(session);

            BingoNextInfoTO to = new BingoNextInfoTO();

            List<ResultsBingoTO> nextGames = new List<ResultsBingoTO>();
            nextGames = ResultsBingo.GetNextResults(false, true);

            to.id = nextGames[0].id;
            to.ticketValue = nextGames[0].ticket_value;
            BetInfoTO betInfo = ReservedTicketsBingo.GetBetInfo(to.id);
            to.totalPlayers = betInfo.total_players;
            to.totalTickets = betInfo.total_tickets;
            to.turn_type = nextGames[0].turn_type;
            to.gamePattern = Global.patterns[nextGames[0].pattern_idx].lines.ToArray();
            to.user_credits = userTO.credits;
            to.user_bonus = userTO.bonus;
            to.user_prize = userTO.prize;

            BetInfoTO bet = ReservedTicketsBingo.GetBetInfo(nextGames[0].id);
            to.prize = bet.total_bet * (cfg.bingo_percent_prize / 100.0f);

            List <ReservedTicketsBingoTO> user_reservedListTO = ReservedTicketsBingo.GetTicketsList(nextGames[0].id, userTO.id, true);
            if (user_reservedListTO != null && user_reservedListTO.Count > 0)
            {
                to.user_ticketsCount = user_reservedListTO[0].tickets;
            }
            else
            {
                to.user_ticketsCount = 0;
            }

            return to;
        }

        /// <summary>
        /// Usu�rio saiu do bingo
        /// </summary>
        /// <param name="session"></param>
        public void Leave(string session)
        {
            Global.ChatAddLine(null, "<b>" + Global.GetRegisteredBySession(session).nick + "</b> saiu.");
            Global.LeaveBingo(session);
        }

        /// <summary>
        /// jogador pede linhas de chat (o cliente informa qtas linhas j� recebeu)
        /// </summary>
        /// <param name="session"></param>
        /// <param name="linesCount"></param>
        /// <returns></returns>
        public BingoChatInfoTO ChatGetLines(string session)
        {
            // localiza o registro do usu�rio
            WebLoggedUser user = Global.GetRegisteredBySession(session);

            // come�a a montar a resposta
            BingoChatInfoTO to = new BingoChatInfoTO();

            // adiciona os usu�rios que est�o atualmente online,
            // independente de terem cartelas na rodada ou n�o
            List<WebLoggedUser> loggedList = Global.GetNicksOnBingo(user.bingo);
            foreach (WebLoggedUser logged in loggedList)
            {
                BingoTurnChatPlayer chatPlayer = new BingoTurnChatPlayer();
                chatPlayer.access_level = logged.access_level;
                chatPlayer.nick = logged.nick;
                chatPlayer.online = true;
                chatPlayer.user_id = logged.id;
                to.loggedNicks.Add(chatPlayer);
            }

            /*
            // ### PRECISA REVER ISSO AQUI! ###
            // buscar no banco seria MUITO LENTO, pois toda hora tem essa chamada.
             * 
            // adiciona tamb�m os usu�rios que est�o offline
            // mas que t�m cartelas na rodada
            foreach (BingoTurnPlayer player in currentPlayers)
            {
                BingoTurnChatPlayer chatPlayer = new BingoTurnChatPlayer();
                UserTO usr = Common.Data.User.GetUserById(player.user_id);
                chatPlayer.access_level = usr.access_level;
                chatPlayer.nick = usr.nick;
                chatPlayer.online = false;
                chatPlayer.user_id = usr.id;
                to.loggedNicks.Add(chatPlayer);
            }
            */

            to.lines.Clear();
            to.lines.AddRange(user.newChatLines);

            user.newChatLines.Clear();

            return to;
        }


    }
}
