<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

        <html xmlns="http://www.w3.org/1999/xhtml" >
        <head id="Head1" runat="server">
        <title>LuckPrize.com - Jogos de Bingo, Caça Níquel e Poker na Internet</title>
        <META NAME="description" CONTENT="LuckPrize.com - Venha jogar Bingo na Internet em um divertido e amigável ambiente seguro, batendo papo através do chat e conhecendo pessoas de todo o mundo, além de muitas chances de ganhar prêmios fantásticos!">
	<META NAME="keywords" CONTENT="bingo 75, video bingo, bingo online, bingo game, play bingo, site bingo, caça niquel, slots, cartas, baralho, roleta, blackjack, vídeo poker, bacará, keno, roulette, free, gratis, prêmios, prize, apostas, bet, jogos, games, dinheiro, money, internet, downloads, las vegas, loterias, cassino, casino, sorte, lucky, Gambling, halloween, nineballs, pachinko, show ball, texas holden, turbo 90, turbo mania, buraco, canastra, cacheta, pif paf, truco, pontinho, roba monte, sinuca, dominó">
	<META NAME="DC.title" content="LuckPrize.com - Jogos de Bingo, Caça Níquel, Cassino e Poker na Internet">	
        <META NAME="expires" CONTENT="never">
	<META NAME="language" CONTENT="português">
	<META NAME="charset" CONTENT="UTF-8">
	<META NAME="distribution" CONTENT="Global">
        <META NAME="robots" content="index,follow,all"> 
        <META NAME="Classification" content="general"> 
        <META NAME="revisit-after" content="7 days"> 
	<META NAME="publisher" CONTENT="www.luckprize.com">
	<META NAME="copyright" CONTENT="2010, LuckPrize.com">
        <link rel="STYLESHEET" href='css.css' />
	<link rel="shortcut icon" href="favicon.ico" />
        </head>
        <body>

<%
    LuckPrize.Common.Data.UserTO userTO = (LuckPrize.Common.Data.UserTO)Session["user"];
    if (userTO != null)
    {
        userTO = LuckPrize.Common.Data.User.GetUserById(userTO.id);
        Session["user"] = userTO;

        if (userTO.access_level == LuckPrize.Common.Data.Access_Level.Admin)
        {
            users_on.Text  = "<table border='0' width='120'><tr><td align='right'>Online:</td><td>" + Application["UsersOn"] + "</td></tr>";
            users_on.Text += "<tr><td align='right'>Logados:</td><td>" + LuckPrize.Global.GetRegisteredCount().ToString() + "</td></tr>";
            users_on.Text += "<tr><td align='right'>Bingo:</td><td>" + LuckPrize.Global.GetBingoCount().ToString() + "</td></tr></table>";
            users_on.Text += "</table>";
            users_on.Text += "<br/><p align='right'>[ <a href='luckadmin.aspx'>ADMINISTRAR</a> ]</p>";
        }

        if (userTO.access_level != LuckPrize.Common.Data.Access_Level.Admin)
        {
         users_on.Text += "<table border='0' width='138'><tr><td align='right'><b>Jogadores no Bingo:</b></td><td><b>" + LuckPrize.Global.GetBingoCount().ToString() + "</b></td></tr></table>";
        } 
         

        System.Collections.Generic.List<LuckPrize.Common.Data.MessageTO> messages = LuckPrize.Common.Data.Message.GetMessagesToUserId(userTO.id, true);
        if (messages.Count > 0)
        {
            imghasmail.ImageUrl = "img/hasmail.gif";
        }
        else
        {
            imghasmail.ImageUrl = "img/avatars/30x30/unknown.png";
            mail.InnerHtml = "";
        }
    }
    else
    {
        mail.InnerHtml = "";
    }
%>

    <center>
    <!-- --------------------------------------------------------------------------------- -->
    <div style="width:800px;">
        <div style="float:left; width:260px; height:128px; background-image:url('img/header_01.jpg');"></div>
        <div style="float:left; width:270px; height:128px; background-image:url('img/header_02.jpg');">
        </div>
        <div style="padding-left:16px; padding-top:4px; text-align:left; float:left; width:254px; height:124px; background-image:url('img/header_03.jpg');">
            <%
                if (Session["validated"] == null || !(bool)(Session["validated"]))
                {
            %>
                <br />
                <form id="login" method="post" action="Login.aspx" defaultfocus="user">
                    <div style="float:left; margin:3px; text-align:right; width:50px;">Usuário:</div><input style="margin:1px;" type="text" maxlength="25" size="16" name="user" /> <br />
                    <div style="float:left; margin:3px; text-align:right; width:50px;">Senha:</div><input style="margin:1px;" type="password" maxlength="16" size="16" name="pass" /><br />
                    <a href="Register.aspx">Cadastre-se</a> e concorra a muitos prêmios!<br />
                    <div style="float:left; width:155px; margin-top:8px;"><a href="RecoverPassword.aspx">Esqueci minha senha!</a></div>
                    <div style="float:left; width:45px; text-align:right; margin-top:8px;"><input type="submit" value="Login" /></div>
                </form>
            <%
                }
                else
                {
            %>
                <h3>
                <span class="label">Usuário:</span> <% Response.Write(userTO.nick); %>
                <br />
                <span class="label">Saldo:</span> <% Response.Write(LuckPrize.Common.Util.Misc.FormatReal(userTO.credits)); %>
                <br />
                <span class="label">Bônus:</span> <% Response.Write(LuckPrize.Common.Util.Misc.FormatReal(userTO.bonus)); %>
                <br />
                <span class="label">Prêmio:</span> <% Response.Write(LuckPrize.Common.Util.Misc.FormatReal(userTO.prize)); %>
                </h3>
                <br />
                <a href="Logout.aspx">Logout</a>
                <div style="position:relative; left:-220px; top:-100px; width:150px;">
                    <asp:Label ID="users_on" runat="server"></asp:Label>
                </div>
                <div id="mail" style="position:relative; left:-175px; top:-80px" runat="server">
                    <a href="MyMessages.aspx"><asp:Image id="imghasmail" width="40" Height="30" BorderStyle="None" ToolTip="Você tem novas mensagens!" runat="server"></asp:Image></a>
                </div>
            <%
                }
            %>
        </div>
    </div>
    <br />

<%
    if (Session["validated"] != null && (bool)Session["validated"] == true)
    {
%>
    <!-- #include file="menu_logged.aspx" -->
<%
    }
else
    {
%>
    <!-- #include file="menu.aspx" -->
<%
    }
%>

