/****** Object:  Table [dbo].[st_HowFound]    Script Date: 06/07/2010 18:33:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[st_HowFound](
	[id] [tinyint] NOT NULL,
	[description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_st_HowFound] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SiteNews]    Script Date: 06/07/2010 18:33:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SiteNews](
	[date] [datetime] NOT NULL,
	[title] [varchar](128) NOT NULL,
	[description] [varchar](4096) NOT NULL,
 CONSTRAINT [PK_SiteNews] PRIMARY KEY CLUSTERED 
(
	[date] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ResultsBingoWinners]    Script Date: 06/07/2010 18:33:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResultsBingoWinners](
	[bingo_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[prize] [numeric](12, 2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResultsBingo]    Script Date: 06/07/2010 18:33:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResultsBingo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NOT NULL,
	[turn_type] [bit] NOT NULL,
	[pattern_idx] [tinyint] NOT NULL,
	[ticket_value] [numeric](12, 2) NOT NULL,
	[winner_num_balls] [int] NULL,
	[total_bet] [numeric](12, 2) NULL,
	[total_prize] [numeric](12, 2) NULL,
	[confirmation_date] [datetime] NULL,
	[cancellation_date] [datetime] NULL,
 CONSTRAINT [PK_ResultsBingo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservedTicketsBingo]    Script Date: 06/07/2010 18:33:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservedTicketsBingo](
	[bingo_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[tickets] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[confirmation_date] [datetime] NULL,
	[cancellation_date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log_Chat]    Script Date: 06/07/2010 18:33:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Log_Chat](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[message] [varchar](512) NOT NULL,
 CONSTRAINT [PK_Log_Chat] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Log]    Script Date: 06/07/2010 18:33:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[log_type] [tinyint] NOT NULL,
	[date] [datetime] NOT NULL,
	[description] [varchar](100) NOT NULL,
	[value] [numeric](12, 2) NOT NULL,
 CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Confirm]    Script Date: 06/07/2010 18:33:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Confirm](
	[user_id] [int] NOT NULL,
	[guid] [varchar](36) NOT NULL,
	[registered] [datetime] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BonusRangesOnBuy]    Script Date: 06/07/2010 18:33:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BonusRangesOnBuy](
	[credits] [numeric](12, 2) NOT NULL,
	[bonus_percentage] [numeric](5, 2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MiscConfigurations]    Script Date: 06/07/2010 18:33:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MiscConfigurations](
	[bingo_mega_freq_days] [smallint] NOT NULL,
	[bingo_mega_freq_minutes] [int] NOT NULL,
	[bingo_normal_freq_days] [smallint] NOT NULL,
	[bingo_normal_freq_minutes] [int] NOT NULL,
	[friend_credits] [numeric](12, 2) NOT NULL,
	[friend_friend_credits] [numeric](12, 2) NOT NULL,
	[friend_friend_friend_credits] [numeric](12, 2) NOT NULL,
	[bingo_accum] [numeric](12, 2) NOT NULL,
	[bingo_percent_prize] [numeric](5, 2) NOT NULL,
	[bingo_percent_accum] [numeric](5, 2) NOT NULL,
	[bingo_price_mega] [numeric](12, 2) NOT NULL,
	[jackpot_percent_prize] [numeric](5, 2) NOT NULL,
	[jackpot_initial_accum] [numeric](12, 2) NOT NULL,
	[jackpot_chance_accum] [numeric](5, 2) NOT NULL,
	[jackpot_min_bet] [numeric](12, 2) NOT NULL,
	[jackpot_max_bet] [numeric](12, 2) NOT NULL,
	[poker_percent_prize] [numeric](5, 2) NOT NULL,
	[poker_initial_accum] [numeric](12, 2) NOT NULL,
	[poker_chance_accum] [numeric](5, 2) NOT NULL,
	[poker_min_bet] [numeric](12, 2) NOT NULL,
	[poker_max_bet] [numeric](12, 2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[p_InsertLogChat]    Script Date: 06/07/2010 18:33:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 
-- Create date: 28/02/2010
-- Description:	Insere uma nova mensagem no log de chat
-- @id : automático
-- @user_id: usuário que gerou o log
-- @message: mensagem digitada pelo usuário
-- =============================================
CREATE PROCEDURE [dbo].[p_InsertLogChat]
	@user_id int,
	@message varchar(512)
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [Log_Chat]
	([user_id], [date], message)
	VALUES (@user_id, GETDATE(), @message)
END
GO
/****** Object:  StoredProcedure [dbo].[p_InsertLog]    Script Date: 06/07/2010 18:33:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 
-- Create date: 28/02/2010
-- Description:	Insere uma nova entrada de log
-- @id : automático
-- @user_id: usuário que gerou o log
-- @log_type:
--	01-misc,
--	02-requisição de compra de créditos,
--	03-cancelamento de compra de créditos,
--	04-confirmação de compra de créditos,
--	05-requisição de saque,
--	06-confirmação de recebimento de saque,
--	07-cancelamento de saque,
--	08-indicação de usuário (confirmado)
--	09-aposta bingo,
--	10-prêmio bingo,
--	11-aposta caça-níquel,
--	12-prêmio caça-níquel
-- @description: descrição do log
-- @value: no caso do tipo de log ter valor envolvido
-- =============================================
CREATE PROCEDURE [dbo].[p_InsertLog]
	@user_id int,
	@log_type tinyint,
	@description varchar(60),
	@value numeric(10,2)
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [Log]
	([user_id], log_type, [date], description, value)
	VALUES (@user_id, @log_type, GETDATE(), @description, @value)
END
GO
/****** Object:  StoredProcedure [dbo].[p_InsertConfirm]    Script Date: 06/07/2010 18:33:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 
-- Create date: 22/02/2010
-- Description:	Insere um novo código de confirmação de cadastro
-- =============================================
CREATE PROCEDURE [dbo].[p_InsertConfirm]
	@user_id [int],
	@guid [varchar](36),
	@log_type tinyint
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [Confirm]
	(
	[user_id]
	,[guid]
	,[registered]
	)
	VALUES
	(
	@user_id
	,@guid
	,GETDATE()
	);

--	exec p_InsertLog @user_id, @log_type, 'Gerado ticket de confirmação de cadastro', 0

END
GO
/****** Object:  StoredProcedure [dbo].[p_InsertBingoWinner]    Script Date: 06/07/2010 18:33:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 
-- Create date: 27/04/2010
-- Description:	Insere um vencedor para uma rodada de bingo
-- =============================================
CREATE PROCEDURE [dbo].[p_InsertBingoWinner]
@bingo_id int
,@user_id int
,@prize numeric(12,2)
AS
BEGIN TRANSACTION
	SET NOCOUNT ON;

	INSERT INTO [ResultsBingoWinners]
	(bingo_id, user_id, prize)
	VALUES
	(@bingo_id, @user_id, @prize)

	IF @@ERROR <> 0
	BEGIN
		ROLLBACK
		RETURN 0
	END

	SELECT 1
COMMIT
GO
/****** Object:  Table [dbo].[User]    Script Date: 06/07/2010 18:33:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[p_UpdateResultsBingo]    Script Date: 06/07/2010 18:33:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 
-- Create date: 07/04/2010
-- Description:	Atualiza uma rodada de bingo (usado para fechar a rodada)
-- =============================================
CREATE PROCEDURE [dbo].[p_UpdateResultsBingo]
@bingo_id datetime,
@winner_num_balls int,
@total_bet numeric(12,2),
@total_prize numeric(12,2),
@log_type tinyint
AS
BEGIN TRANSACTION
	SET NOCOUNT ON;

	DECLARE @date DATETIME = GETDATE()

	UPDATE [ResultsBingo]
	SET
	winner_num_balls = @winner_num_balls
	, total_bet = @total_bet
	, total_prize = @total_prize
	, confirmation_date = @date
	WHERE id = @bingo_id

	IF @@ERROR <> 0
	BEGIN
		ROLLBACK
		RETURN 0
	END

	--
	-- confirma uso das cartelas reservadas pelos usuários que apostaram na rodada...
	--

	UPDATE [ReservedTicketsBingo]
	SET confirmation_date = @date
	WHERE bingo_id = @bingo_id

	IF @@ERROR <> 0
	BEGIN
		ROLLBACK
		RETURN 0
	END

	-- gera entrada de log
--	exec p_InsertLog @USER_ID, @log_type, 'Novo cadastro de usuário', 0

	SELECT 1
COMMIT
GO
/****** Object:  StoredProcedure [dbo].[p_UpdateMiscConfigurations]    Script Date: 06/07/2010 18:33:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 
-- Create date: 10/04/2010
-- Description:	Atualiza as configurações
-- =============================================
CREATE PROCEDURE [dbo].[p_UpdateMiscConfigurations]
@bingo_mega_freq_days int
, @bingo_mega_freq_minutes int
, @bingo_normal_freq_days int
, @bingo_normal_freq_minutes int
, @friend_credits numeric(12,2)
, @friend_friend_credits numeric(12,2)
, @friend_friend_friend_credits numeric(12,2)
, @bingo_accum numeric(12,2)
, @bingo_percent_prize numeric(5,2)
, @bingo_percent_accum numeric(5,2)
, @bingo_room_size int
, @bingo_initial_accum numeric(12,2)
, @bingo_chance_accum numeric(5,2)
, @bingo_chance_1winner numeric(5,2)
, @bingo_chance_2winner numeric(5,2)
, @bingo_chance_3winner numeric(5,2)
, @bingo_price_normal numeric(12,2)
, @bingo_price_mega numeric(12,2)
, @jackpot_percent_prize numeric(5,2)
, @jackpot_initial_accum numeric(12,2)
, @jackpot_chance_accum numeric(5,2)
, @jackpot_min_bet numeric(12,2)
, @jackpot_max_bet numeric(12,2)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @COUNT int = (SELECT COUNT(*) FROM [MiscConfigurations])

	IF (@COUNT < 1)
	BEGIN
		-- insere
		INSERT INTO [MiscConfigurations]
		(
			bingo_mega_freq_days, bingo_mega_freq_minutes, bingo_normal_freq_days, bingo_normal_freq_minutes
			, friend_credits, friend_friend_credits, friend_friend_friend_credits
			, bingo_accum, bingo_percent_prize, bingo_percent_accum, bingo_room_size
			, bingo_initial_accum, bingo_chance_accum
			, bingo_chance_1winner, bingo_chance_2winner, bingo_chance_3winner
			, bingo_price_normal, bingo_price_mega
			, jackpot_percent_prize, jackpot_initial_accum
			, jackpot_chance_accum, jackpot_min_bet, jackpot_max_bet
		)
		VALUES
		(
			@bingo_mega_freq_days, @bingo_mega_freq_minutes, @bingo_normal_freq_days, @bingo_normal_freq_minutes
			, @friend_credits, @friend_friend_credits, @friend_friend_friend_credits
			, @bingo_accum, @bingo_percent_prize, @bingo_percent_accum, @bingo_room_size
			, @bingo_initial_accum, @bingo_chance_accum
			, @bingo_chance_1winner, @bingo_chance_2winner, @bingo_chance_3winner
			, @bingo_price_normal, @bingo_price_mega
			, @jackpot_percent_prize, @jackpot_initial_accum
			, @jackpot_chance_accum, @jackpot_min_bet, @jackpot_max_bet
		)
	END	ELSE BEGIN
		-- atualiza
		UPDATE [MiscConfigurations]
		SET
			bingo_mega_freq_days = @bingo_mega_freq_days
			, bingo_mega_freq_minutes = @bingo_mega_freq_minutes
			, bingo_normal_freq_days = @bingo_normal_freq_days
			, bingo_normal_freq_minutes = @bingo_normal_freq_minutes
			, friend_credits = @friend_credits
			, friend_friend_credits = @friend_friend_credits
			, friend_friend_friend_credits = @friend_friend_friend_credits
			, bingo_accum = @bingo_accum
			, bingo_percent_prize = @bingo_percent_prize
			, bingo_percent_accum = @bingo_percent_accum
			, bingo_room_size = @bingo_room_size
			, bingo_initial_accum = @bingo_initial_accum
			, bingo_chance_accum = @bingo_chance_accum
			, bingo_chance_1winner = @bingo_chance_1winner
			, bingo_chance_2winner = @bingo_chance_2winner
			, bingo_chance_3winner = @bingo_chance_3winner
			, bingo_price_normal = @bingo_price_normal
			, bingo_price_mega = @bingo_price_mega
			, jackpot_percent_prize = @jackpot_percent_prize
			, jackpot_initial_accum = @jackpot_initial_accum
			, jackpot_chance_accum = @jackpot_chance_accum
			, jackpot_min_bet = @jackpot_min_bet
			, jackpot_max_bet = @jackpot_max_bet
	END
END
GO
/****** Object:  StoredProcedure [dbo].[p_InsertResultsBingo]    Script Date: 06/07/2010 18:33:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 
-- Create date: 07/04/2010
-- Description:	Insere uma nova rodada de bingo em aberto (a ser fechada posteriormente)
-- =============================================
CREATE PROCEDURE [dbo].[p_InsertResultsBingo]
@date datetime,
@turn_type bit,
@pattern_idx tinyint,
@ticket_value numeric(12,2),
@log_type tinyint
AS
BEGIN TRANSACTION
	SET NOCOUNT ON;

	INSERT INTO [ResultsBingo]
	([date], turn_type, pattern_idx, ticket_value, winner_num_balls, total_bet, total_prize, confirmation_date, cancellation_date)
	VALUES
	(@date, @turn_type, @pattern_idx, @ticket_value, null, null, null, null, null)

	IF @@ERROR <> 0
	BEGIN
		ROLLBACK
		RETURN 0
	END

	DECLARE @BINGO_ID INT = SCOPE_IDENTITY()
	SELECT @BINGO_ID
COMMIT
GO
/****** Object:  StoredProcedure [dbo].[p_CancelResultsBingo]    Script Date: 06/07/2010 18:33:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 
-- Create date: 07/04/2010
-- Description:	Cancela uma rodada do bingo e devolve os créditos dos jogadores que tiverem reservado cartelas
-- =============================================
CREATE PROCEDURE [dbo].[p_CancelResultsBingo]
@bingo_id int,
@log_type tinyint
AS
BEGIN TRANSACTION
	SET NOCOUNT ON;

	DECLARE @date DATETIME = GETDATE()

	--
	-- cancela a rodada
	--

	UPDATE [ResultsBingo] SET cancellation_date = @date WHERE id = @bingo_id

	IF @@ERROR <> 0
	BEGIN
		ROLLBACK
		RETURN 0
	END

	--
	-- devolve os créditos dos usuários que apostaram na rodada, em forma de bônus
	--

	DECLARE @user_id int;
	DECLARE @tickets int;
	DECLARE @ticket_value numeric(12,2);

	DECLARE cur CURSOR FOR
		SELECT rt.user_id, rt.tickets, rb.ticket_value
		FROM [ReservedTicketsBingo] rt
		INNER JOIN [ResultsBingo] rb ON rb.id = @bingo_id
		WHERE bingo_id = @bingo_id;

	OPEN cur;
	FETCH NEXT FROM cur INTO @user_id, @tickets, @ticket_value;

	WHILE (@@fetch_status = 0 )
	BEGIN
		DECLARE @devol_value numeric(12,2) = (@tickets * @ticket_value);
	
		UPDATE [User]
		SET bonus = bonus + @devol_value
		WHERE id = @user_id;

		IF @@ERROR <> 0
		BEGIN
			ROLLBACK
			RETURN 0
		END

		-- gera entrada de log
		declare @msg_dev varchar(100) = 'Devolução aposta rodada ' + CONVERT(varchar(10), @bingo_id)
		exec p_InsertLog @user_id, @log_type, @msg_dev, @devol_value

		FETCH NEXT FROM cur INTO @user_id, @tickets, @ticket_value;
	END

	CLOSE cur;
	DEALLOCATE cur;

	--
	-- cancela as cartelas reservadas
	--

	UPDATE [ReservedTicketsBingo]
	SET cancellation_date = @date
	WHERE bingo_id = @bingo_id

	IF @@ERROR <> 0
	BEGIN
		ROLLBACK
		RETURN 0
	END

	-- gera entrada de log
	declare @msg varchar(100) = 'Rodada cancelada: ' + CONVERT(varchar(10), @bingo_id)
	exec p_InsertLog 0, @log_type, @msg , 0

	SELECT 1
COMMIT
GO
/****** Object:  StoredProcedure [dbo].[p_InsertReservedTicketsBingo]    Script Date: 06/07/2010 18:33:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 
-- Create date: 07/04/2010
-- Description:	Insere uma nova reserva de tickets para um determinado bingo_id/user_id
-- =============================================
CREATE PROCEDURE [dbo].[p_InsertReservedTicketsBingo]
@user_id int,
@bingo_id int,
@tickets int,
@credits numeric(12,2),
@bonus numeric(12,2),
@log_type tinyint
AS
BEGIN TRANSACTION

	INSERT INTO [ReservedTicketsBingo]
	([date], user_id, bingo_id, tickets)
	values
	(getdate(), @user_id, @bingo_id, @tickets)

	IF @@ERROR <> 0
	BEGIN
		ROLLBACK
		RETURN 0
	END

	-- desconta nos créditos/bônus do usuário
	UPDATE [User] SET credits = credits - @credits, bonus = bonus - @bonus WHERE id = @user_id

	IF @@ERROR <> 0
	BEGIN
		ROLLBACK
		RETURN 0
	END

	declare @msg varchar(100)

	if (@credits > 0)
	begin
		set @msg = 'Compra cartelas rodada ' + CONVERT(varchar(10), @bingo_id)
		exec p_InsertLog @user_id, @log_type, @msg, @credits
	end
	else begin
		set @msg = 'Compra cartelas c/ bônus rodada ' + CONVERT(varchar(10), @bingo_id)
		exec p_InsertLog @user_id, @log_type, @msg, @bonus
	end

	SELECT 1
COMMIT
GO
/****** Object:  Table [dbo].[Message]    Script Date: 06/07/2010 18:33:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Message](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sent_date] [datetime] NOT NULL,
	[from_user_id] [int] NOT NULL,
	[to_user_id] [int] NOT NULL,
	[subject] [varchar](128) NOT NULL,
	[message] [varchar](4096) NOT NULL,
	[read_date] [datetime] NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BankAccount]    Script Date: 06/07/2010 18:33:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BankAccount](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[agency] [varchar](15) NOT NULL,
	[account_number] [varchar](20) NOT NULL,
	[titular] [varchar](50) NOT NULL,
	[cpf] [varchar](14) NOT NULL,
	[account_type] [bit] NOT NULL,
 CONSTRAINT [PK_BankAccount] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'tipo conta - 0:corrente, 1:poupança' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BankAccount', @level2type=N'COLUMN',@level2name=N'account_type'
GO
/****** Object:  View [dbo].[v_Confirm_User]    Script Date: 06/07/2010 18:33:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_Confirm_User]
as
select c.user_id, c.guid, c.registered, u.name, u.nick, u.email
from [confirm] c
inner join [user] u
on u.id = c.user_id
GO
/****** Object:  Table [dbo].[ResultsPoker]    Script Date: 06/07/2010 18:33:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResultsPoker](
	[id] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[value] [numeric](12, 2) NOT NULL,
	[user_id] [int] NOT NULL,
 CONSTRAINT [PK_ResultsPoker] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResultsJackPot]    Script Date: 06/07/2010 18:33:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResultsJackPot](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NOT NULL,
	[value] [numeric](12, 2) NOT NULL,
	[user_id] [int] NOT NULL,
 CONSTRAINT [PK_ResultsJackPot] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[p_ValidateUser]    Script Date: 06/07/2010 18:33:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[p_ValidateUser]
	@user_id int,
	@log_type tinyint
AS
BEGIN TRANSACTION
	update [User] set validated=1 where id = @user_id
	IF @@ERROR <> 0
	BEGIN
		ROLLBACK
		RETURN
	END

	delete from [Confirm] where user_id = @user_id
	IF @@ERROR <> 0
	BEGIN
		ROLLBACK
		RETURN
	END
	
--	exec p_InsertLog @user_id, @log_type, 'Cadastro de usuário confirmado', 0
	
COMMIT
GO
/****** Object:  StoredProcedure [dbo].[p_UpdateUser]    Script Date: 06/07/2010 18:33:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 
-- Create date: 18/02/2010
-- Description:	Atualiza um usuário no sistema
-- =============================================
CREATE PROCEDURE [dbo].[p_UpdateUser]
	@id int,
	@name [varchar](50),
	@nick [varchar](25),
	@email [varchar](50),
	@birthday [datetime],
	@gender [char](1),
	@avatar_url [varchar](128),
	@how_found [tinyint],
	@newsletters [bit],
	@credits [numeric](12,2),
	@bonus [numeric](12,2),
	@prize [numeric](12,2),
	@access_level [smallint],
	@indication_user_id [int],
	@indication_user_bonus [numeric](12,2),
	@registered [datetime],
	@last_login [datetime],
	@validated [bit],
	@active [bit],
	@log_type tinyint
AS
BEGIN TRANSACTION
	SET NOCOUNT ON;

	UPDATE [User]
	SET
		name = @name
		,nick = @nick
		,email = @email
		,birthday = @birthday
		,gender = @gender
		,avatar_url = @avatar_url
		,how_found = @how_found
		,newsletters = @newsletters
		,credits = @credits
		,bonus = @bonus
		,prize = @prize
		,access_level = @access_level
		,indication_user_id = @indication_user_id
		,indication_user_bonus = @indication_user_bonus
		,registered = @registered
		,last_login = @last_login
		,validated = @validated
		,active = @active
	WHERE
		id = @id

	IF @@ERROR <> 0
	BEGIN
		ROLLBACK
		RETURN 0
	END

	-- gera entrada de log
	-- exec p_InsertLog @ID, @log_type, 'Usuário atualizado', 0

	SELECT 1
COMMIT
GO
/****** Object:  StoredProcedure [dbo].[p_InsertUser]    Script Date: 06/07/2010 18:33:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 
-- Create date: 18/02/2010
-- Description:	Insere um novo usuário no sistema
-- =============================================
CREATE PROCEDURE [dbo].[p_InsertUser]
	@name [varchar](50),
	@nick [varchar](25),
	@password [varchar](16),
	@email [varchar](50),
	@birthday [datetime],
	@gender [char](1),
	@avatar_url [varchar](128),
	@how_found [tinyint],
	@newsletters [bit],
	@credits [numeric](12,2),
	@bonus [numeric](12,2),
	@prize [numeric](12,2),
	@access_level [smallint],
	@indication_user_id [int],
	@indication_user_bonus [numeric](12,2),
	@registered [datetime],
	@last_login [datetime],
	@validated [bit],
	@active [bit],
	@log_type tinyint
AS
BEGIN TRANSACTION
	SET NOCOUNT ON;

	INSERT INTO [User]
	(
	[name]
	,[nick]
	,[password]
	,[email]
	,[birthday]
	,[gender]
	,[avatar_url]
	,[how_found]
	,[newsletters]
	,[credits]
	,[bonus]
	,[prize]
	,[access_level]
	,[indication_user_id]
	,[indication_user_bonus]
	,[registered]
	,[last_login]
	,[validated]
	,[active])
	VALUES
	(
	@name
	,@nick
	,pwdencrypt(@password)
	,@email
	,@birthday
	,@gender
	,@avatar_url
	,@how_found
	,@newsletters
	,@credits
	,@bonus
	,@prize
	,@access_level
	,@indication_user_id
	,@indication_user_bonus
	,@registered
	,@last_login
	,@validated
	,@active
	)

	IF @@ERROR <> 0
	BEGIN
		ROLLBACK
		RETURN 0
	END

	DECLARE @USER_ID INT = SCOPE_IDENTITY()

	-- gera entrada de log
	exec p_InsertLog @USER_ID, @log_type, 'Novo cadastro de usuário', 0

	SELECT @USER_ID
COMMIT
GO
/****** Object:  StoredProcedure [dbo].[p_InsertMessage]    Script Date: 06/07/2010 18:33:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[p_InsertMessage]
@sent_date datetime,
@from_user_id int,
@to_user_id int,
@subject varchar(128),
@message varchar(4096),
@read_date datetime = null
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO Message
	(sent_date, from_user_id, to_user_id, subject, message, read_date)
	values
	(@sent_date, @from_user_id, @to_user_id, @subject, @message, @read_date)
END
GO
/****** Object:  Table [dbo].[CreditBuyRequest]    Script Date: 06/07/2010 18:33:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CreditBuyRequest](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[request_date] [datetime] NOT NULL,
	[credits] [numeric](12, 2) NOT NULL,
	[user_id] [int] NOT NULL,
	[bank_id] [int] NOT NULL,
	[confirmation_date] [datetime] NULL,
	[cancellation_date] [datetime] NULL,
	[adm_user_id] [int] NULL,
 CONSTRAINT [PK_CreditBuyRequest] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[p_InsertBankAccount]    Script Date: 06/07/2010 18:33:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 
-- Create date: 08/03/2010
-- Description:	Insere uma nova conta de banco associada a um usuário do sistema
-- =============================================
CREATE PROCEDURE [dbo].[p_InsertBankAccount]
@user_id int,
@name varchar(50),
@agency varchar(15),
@account_number varchar(20),
@titular varchar(50),
@cpf varchar(14),
@account_type bit,
@log_type tinyint
AS
BEGIN
	SET NOCOUNT ON;

	insert into [BankAccount]
	(user_id, name, agency, account_number, titular, cpf, account_type)
	values
	(@user_id, @name, @agency, @account_number, @titular, @cpf, @account_type)

	DECLARE @BANK_ID INT = SCOPE_IDENTITY()

	declare @str varchar(100)
	set @str = 'Nova conta banco - ' + @name

	exec p_InsertLog @user_id, @log_type, @str, 0

	SELECT @BANK_ID
END
GO
/****** Object:  StoredProcedure [dbo].[p_DeleteMessage]    Script Date: 06/07/2010 18:33:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 
-- Create date: 07/03/2010
-- Description:	Deleta uma mensagem pelo ID
-- =============================================
CREATE PROCEDURE [dbo].[p_DeleteMessage]
@id int
AS
BEGIN
	SET NOCOUNT ON;

	delete from [Message] where id = @id
END
GO
/****** Object:  Table [dbo].[PrizeRescueRequest]    Script Date: 06/07/2010 18:33:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrizeRescueRequest](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[request_date] [datetime] NOT NULL,
	[prize_to_transfer] [numeric](12, 2) NOT NULL,
	[prize_to_credit] [numeric](12, 2) NOT NULL,
	[user_id] [int] NOT NULL,
	[bank_id] [int] NOT NULL,
	[confirmation_date] [datetime] NULL,
	[cancellation_date] [datetime] NULL,
	[adm_user_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[p_UpdateBankAccount]    Script Date: 06/07/2010 18:33:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 
-- Create date: 08/03/2010
-- Description:	Atualiza uma conta de banco associada a um usuário do sistema
-- =============================================
CREATE PROCEDURE [dbo].[p_UpdateBankAccount]
@id int,
@user_id int,
@name varchar(50),
@agency varchar(15),
@account_number varchar(20),
@titular varchar(50),
@cpf varchar(14),
@account_type bit,
@log_type tinyint
AS
BEGIN
	SET NOCOUNT ON;

	update [BankAccount]
	set user_id = @user_id,
	name = @name,
	agency = @agency, 
	account_number = @account_number, 
	titular = @titular, 
	cpf = @cpf, 
	account_type = @account_type
	where id = @id

	declare @str varchar(100)
	set @str = 'Banco atualizado - ' + @name

	exec p_InsertLog @user_id, @log_type, @str, 0
END
GO
/****** Object:  StoredProcedure [dbo].[p_SetMessageRead]    Script Date: 06/07/2010 18:33:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 
-- Create date: 07/03/2010
-- Description:	Altera a flag de lida de uma mensagem
-- =============================================
CREATE PROCEDURE [dbo].[p_SetMessageRead]
@id int,
@read bit
AS
BEGIN
	SET NOCOUNT ON;

	if (@read > 0)
	begin
		update [Message] set read_date = GETDATE() where id=@id
	end
	else
	begin
		update [Message] set read_date = null where id=@id
	end
END
GO
/****** Object:  StoredProcedure [dbo].[p_InsertPrizeRescueRequest]    Script Date: 06/07/2010 18:33:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 
-- Create date: 08/03/2010
-- Description:	Insere nova requisição de resgate de prêmio
-- =============================================
CREATE PROCEDURE [dbo].[p_InsertPrizeRescueRequest]
@request_date datetime,
@prize_to_transfer numeric(12,2),
@prize_to_credit numeric(12,2),
@user_id int,
@bank_id int,
@confirmation_date datetime = null,
@cancellation_date datetime = null,
@adm_user_id int = null,
@log_type tinyint
AS
BEGIN TRANSACTION
	SET NOCOUNT ON;

	insert into [PrizeRescueRequest]
	(request_date, prize_to_transfer, prize_to_credit, user_id, bank_id, confirmation_date, cancellation_date, adm_user_id)
	values
	(@request_date, @prize_to_transfer, @prize_to_credit, @user_id, @bank_id, @confirmation_date, @cancellation_date, @adm_user_id)

	IF @@ERROR <> 0
	BEGIN
		ROLLBACK
		RETURN 0
	END

	DECLARE @RESCUE_ID INT = SCOPE_IDENTITY()

	-- retira créditos do usuário (conversão)
	if (@prize_to_credit > 0)
	begin
		UPDATE [User] SET prize = prize - @prize_to_credit, credits = credits + @prize_to_credit WHERE id = @user_id
		IF @@ERROR <> 0
		BEGIN
			ROLLBACK
			RETURN 0
		END
	end

	-- retira créditos do usuário (tranferência)
	if (@prize_to_transfer > 0)
	begin
		UPDATE [User] SET prize = prize - @prize_to_transfer WHERE id = @user_id
		IF @@ERROR <> 0
		BEGIN
			ROLLBACK
			RETURN 0
		END
	end

	IF @@ERROR <> 0
	BEGIN
		ROLLBACK
		RETURN 0
	END

	-- gera entradas de log
	declare @msg varchar(100)

	if (@prize_to_transfer > 0)
	begin
		set @msg = 'Requisição de prêmio ' + CONVERT(varchar(10), @RESCUE_ID)
		exec p_InsertLog @user_id, @log_type, @msg, @prize_to_transfer
		IF @@ERROR <> 0
		BEGIN
			ROLLBACK
			RETURN 0
		END
	end

	if (@prize_to_credit > 0)
	begin
		set @msg = 'Conversão de prêmio ' + CONVERT(varchar(10), @RESCUE_ID)
		exec p_InsertLog @user_id, @log_type, @msg, @prize_to_credit
		IF @@ERROR <> 0
		BEGIN
			ROLLBACK
			RETURN 0
		END
	end

	SELECT @RESCUE_ID
COMMIT
GO
/****** Object:  StoredProcedure [dbo].[p_CancelPrizeRescueRequest]    Script Date: 06/07/2010 18:33:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 
-- Create date: 08/03/2010
-- Description:	Cancela uma requisição de resgate de prêmio
-- =============================================
CREATE PROCEDURE [dbo].[p_CancelPrizeRescueRequest]
	@id int,
	@log_type tinyint
AS
BEGIN TRANSACTION

	UPDATE [PrizeRescueRequest] SET cancellation_date = GETDATE() WHERE id = @id

	IF @@ERROR <> 0
	BEGIN
		ROLLBACK
		RETURN 0
	END

	declare @user_id int
	declare @credits numeric(12,2)
	select @user_id = [user_id], @credits = [prize_to_transfer] from [PrizeRescueRequest] WHERE id = @id
	UPDATE [User] SET prize = prize + @credits WHERE id = @user_id

	IF @@ERROR <> 0
	BEGIN
		ROLLBACK
		RETURN 0
	END

	declare @msg varchar(100) = 'Requisição resgate ' + CONVERT(varchar(10), @id) + ' cancelada'
	exec p_InsertLog @user_id, @log_type, @msg, 0

	IF @@ERROR <> 0
	BEGIN
		ROLLBACK
		RETURN 0
	END

COMMIT
GO
/****** Object:  StoredProcedure [dbo].[p_CancelBuyRequest]    Script Date: 06/07/2010 18:33:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 
-- Create date: 28/02/2010
-- Description:	Insere uma nova requisição de compra de créditos
-- =============================================
CREATE PROCEDURE [dbo].[p_InsertBuyRequest]
	-- Add the parameters for the stored procedure here
	@request_date datetime,
	@credits [numeric](12,2),
	@user_id int,
	@bank_id int,
	@confirmation_date datetime = null,
	@cancellation_date datetime = null,
	@adm_user_id int = null,
	@log_type tinyint
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO CreditBuyRequest
	(request_date, credits, user_id, bank_id, confirmation_date, cancellation_date, adm_user_id)
	VALUES
	(@request_date, @credits, @user_id, @bank_id, @confirmation_date, @cancellation_date, @adm_user_id)

	DECLARE @req_id int = SCOPE_IDENTITY()
	declare @msg varchar(100) = 'Requisição de compra ' + CONVERT(varchar(10), @req_id)
	exec p_InsertLog @user_id, @log_type, @msg, @credits
END
GO
/****** Object:  StoredProcedure [dbo].[p_ConfirmPrizeRescueRequest]    Script Date: 06/07/2010 18:33:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 
-- Create date: 08/03/2010
-- Description:	Confirma uma requisição de resgate de prêmio
-- =============================================
CREATE PROCEDURE [dbo].[p_ConfirmPrizeRescueRequest]
	@id int,
	@log_type tinyint
AS
BEGIN TRANSACTION
	UPDATE [PrizeRescueRequest] SET confirmation_date = GETDATE() WHERE id = @id

	IF @@ERROR <> 0
	BEGIN
		ROLLBACK
		RETURN 0
	END

	declare @credits numeric(12,2) = (select [prize_to_transfer] from [PrizeRescueRequest] where id = @id)
	declare @user_id int = (select [user_id] from [PrizeRescueRequest] where id = @id)
	declare @msg varchar(100) = 'Requisição de resgate ' + CONVERT(varchar(10), @id) + ' confirmada'
	exec p_InsertLog @user_id, @log_type, @msg, @credits

	IF @@ERROR <> 0
	BEGIN
		ROLLBACK
		RETURN 0
	END
	
COMMIT
GO
/****** Object:  StoredProcedure [dbo].[p_ConfirmBuyRequest]    Script Date: 06/07/2010 18:33:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		 
-- Create date: 28/02/2010
-- Description:	Confirma uma requisição de compra de créditos
-- =============================================
CREATE PROCEDURE [dbo].[p_ConfirmBuyRequest]
	@id int,
	@log_type tinyint,
	@log_type_indication tinyint
AS
BEGIN TRANSACTION
	-- dá baixa na compra
	UPDATE [CreditBuyRequest] SET confirmation_date = GETDATE() WHERE id = @id

	IF @@ERROR <> 0
	BEGIN
		ROLLBACK
		RETURN 0
	END


	-- paga bônus ao usuário que indicou esse usuário
	declare @nick varchar(30)
	declare @indicator int
	select @indicator = indication_user_id, @nick = nick from [User] where id = @user_id
	if (@indicator > 0)
	begin
		declare @bonus_friend numeric(12,2) = (select top 1 friend_credits from [MiscConfigurations])
		-- paga
		update [User] set bonus = bonus + @bonus_friend where id = @indicator
		-- tira a indicação, para não pagar de novo na próxima compra desse usuário
		update [User] set indication_user_id = 0 where id = @user_id

		IF @@ERROR <> 0
		BEGIN
			ROLLBACK
			RETURN 0
		END

		-- insere o pagamento de bônus no extrato do outro usuário que recebeu
		declare @msg3 varchar(100) = 'Pagamento por indicação de ' + @nick
		exec p_InsertLog @indicator, @log_type_indication, @msg3, @bonus_friend

		IF @@ERROR <> 0
		BEGIN
			ROLLBACK
			RETURN 0
		END
		
	end

	-- calcula os bônus de acordo com a faixa de compra
	declare @bonus numeric(12,2)
	select top 1 @bonus = @credits*(bonus_percentage/100) from [BonusRangesOnBuy] where @credits <= credits order by credits

	-- atualiza os créditos e os bônus ganhos com a compra
	UPDATE [User]
	SET credits = credits + @credits, bonus = bonus + @bonus
	WHERE id = @user_id;

	IF @@ERROR <> 0
	BEGIN
		ROLLBACK
		RETURN 0
	END

	-- loga a compra
	declare @msg2 varchar(100) = 'Requisição de compra ' + CONVERT(varchar(10), @id) + ' confirmada'
	exec p_InsertLog @user_id, @log_type, @msg2, @credits

	IF @@ERROR <> 0
	BEGIN
		ROLLBACK
		RETURN 0
	END

	-- loga o bônus pela compra
	if (@bonus > 0)
	begin
		declare @msg1 varchar(100) = 'Bônus de compra ' + CONVERT(varchar(10), @id)
		exec p_InsertLog @user_id, @log_type, @msg1, @bonus
	end

	IF @@ERROR <> 0
	BEGIN
		ROLLBACK
		RETURN 0
	END

COMMIT
GO
/****** Object:  ForeignKey [FK_BankAccount_User]    Script Date: 06/07/2010 18:33:41 ******/
ALTER TABLE [dbo].[BankAccount]  WITH CHECK ADD  CONSTRAINT [FK_BankAccount_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[BankAccount] CHECK CONSTRAINT [FK_BankAccount_User]
GO
/****** Object:  ForeignKey [FK_CreditBuyRequest_BankAccount]    Script Date: 06/07/2010 18:33:41 ******/
ALTER TABLE [dbo].[CreditBuyRequest]  WITH CHECK ADD  CONSTRAINT [FK_CreditBuyRequest_BankAccount] FOREIGN KEY([bank_id])
REFERENCES [dbo].[BankAccount] ([id])
GO
ALTER TABLE [dbo].[PrizeRescueRequest] NOCHECK CONSTRAINT [FK_PrizeRescueRequest_BankAccount]
GO
/****** Object:  ForeignKey [FK_PrizeRescueRequest_User]    Script Date: 06/07/2010 18:33:41 ******/
ALTER TABLE [dbo].[PrizeRescueRequest]  WITH CHECK ADD  CONSTRAINT [FK_PrizeRescueRequest_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[PrizeRescueRequest] CHECK CONSTRAINT [FK_PrizeRescueRequest_User]
GO
/****** Object:  ForeignKey [FK_PrizeRescueRequest_User1]    Script Date: 06/07/2010 18:33:41 ******/
ALTER TABLE [dbo].[PrizeRescueRequest]  WITH CHECK ADD  CONSTRAINT [FK_PrizeRescueRequest_User1] FOREIGN KEY([adm_user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[PrizeRescueRequest] CHECK CONSTRAINT [FK_PrizeRescueRequest_User1]
GO
/****** Object:  ForeignKey [FK_ResultsJackPot_User]    Script Date: 06/07/2010 18:33:41 ******/
ALTER TABLE [dbo].[ResultsJackPot]  WITH CHECK ADD  CONSTRAINT [FK_ResultsJackPot_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[ResultsJackPot] CHECK CONSTRAINT [FK_ResultsJackPot_User]
GO
/****** Object:  ForeignKey [FK_ResultsPoker_User]    Script Date: 06/07/2010 18:33:41 ******/
ALTER TABLE [dbo].[ResultsPoker]  WITH CHECK ADD  CONSTRAINT [FK_ResultsPoker_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[ResultsPoker] CHECK CONSTRAINT [FK_ResultsPoker_User]
GO
/****** Object:  ForeignKey [FK_User_st_HowFound]    Script Date: 06/07/2010 18:33:41 ******/
ALTER TABLE [dbo].[User]  WITH NOCHECK ADD  CONSTRAINT [FK_User_st_HowFound] FOREIGN KEY([how_found])
REFERENCES [dbo].[st_HowFound] ([id])
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[User] NOCHECK CONSTRAINT [FK_User_st_HowFound]
GO
/****** Object:  ForeignKey [FK_User_User]    Script Date: 06/07/2010 18:33:41 ******/
ALTER TABLE [dbo].[User]  WITH NOCHECK ADD  CONSTRAINT [FK_User_User] FOREIGN KEY([indication_user_id])
REFERENCES [dbo].[User] ([id])
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[User] NOCHECK CONSTRAINT [FK_User_User]
GO
