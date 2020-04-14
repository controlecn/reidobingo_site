--
-- acompanha as rodadas
-- usar [F5] para atualizar o resultado da query
--

-- soma da lucratividade e premiação dentro de um período
select COUNT(*) as Rodadas, SUM(total_bet) as Apostas, SUM(total_prize) as Pagamentos,  SUM(total_bet)-SUM(total_prize) as Lucratividade from [ResultsBingo]
where confirmation_date between '2000-01-01' and '2020-12-31'

-- últimos 10 vencedores no bingo
select top 10 rb.id, rb.date, rb.turn_type, rb.winner_num_balls, rb.total_bet, rb.total_prize,
              rbw.user_id, u.nick, rbw.prize
from [ResultsBingo] rb
inner join [ResultsBingoWinners] rbw on rbw.bingo_id = rb.id
inner join [User] u on u.id = rbw.user_id
order by rb.confirmation_date desc

-- acompanha também o log do sistema
select top 150 * from [Log] order by id desc

-- e o chat
select top 50 * from [Log_Chat] order by date desc

select top 32 * from [ResultsBingo] order by id desc
select nick, credits, bonus, prize from [user]
select * from [ResultsBingo]


-- Relatório partidas Bingo
-- Exibe histórico das partidas (INICIADAS) com os dados:
-- "Data/Hora, ID, Tipo normal ou mega,  Total jogadores, Total aposta, Premio, Vencedores"  
declare @initialRow int = 1
declare @finalRow int = 10
declare @date datetime = '2010-12-01';
select
TotalRows, ID, DATA, TIPO, BOLAS, total_bet as 'TOTAL APOSTAS', total_prize as 'TOTAL PRÊMIO', nick as 'NOME', prize as 'PRÊMIO'
from
(
select 
TotalRows = COUNT(*) over()
, rb.id as ID, rb.date as DATA, case when rb.turn_type = 0 then 'mega' else 'normal' end as TIPO
, rb.winner_num_balls as BOLAS, rb.total_bet, rb.total_prize
, u.nick, rbw.prize
, (select COUNT(distinct user_id) from [ReservedTicketsBingo] where bingo_id=rb.id) as JOGADORES
, ROW_NUMBER() over (order by nick) as RowNum, rb.confirmation_date as DATA_CONF

from [ResultsBingo] rb
inner join [ResultsBingoWinners] rbw on rbw.bingo_id = rb.id
inner join [User] u on u.id = rbw.user_id
) as T
where T.RowNum BETWEEN @initialRow AND @finalRow
and T.DATA <= @date
order by T.DATA_CONF desc
