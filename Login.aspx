<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LuckPrize.Login" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!-- #include file="header.aspx" -->

<div style="width:800px">

    <div style="padding:16px; text-align:left; float:left; width:471px; height:226px; background-image:url('img/empty_middle_01.jpg');">
        <%
            if (userTO == null)
            {
        %>
            <h1>Usuário ou senha inválidos!</h1>
            <br /><br />
            O usuário ou senha que você informou não são válidos.
            <br /><br />
            Caso você ainda não tenha um usuário cadastrado, <br /><a href="Register.aspx">cadastre-se</a> e concorra a muitos prêmios!
            <br /><br />
            Se você já tem um usuário cadastrado, porém esqueceu a sua senha, <br />você pode tentar recuperá-la na página <a href="RecoverPassword.aspx">esqueci minha senha</a>.
        <%
            }
            else
            {
        %>
            <h1>Confirmação Pendente!</h1>
            <br /><br />
            Sua nova conta ainda se encontra inativa.
            <br /><br />
            Foi enviado um e-mail para <b><% Response.Write("<a href = mailto:" + userTO.email + ">" + userTO.email + "</a>"); %></b>, solicitando uma confirmação. 
            Abra o e-mail e siga as instruções do mesmo para ativar a sua conta.
            <br /><br />
            Caso deseje receber outra mensagem de confirmação, <a href="ResendConfirmation.aspx">clique aqui</a>.
        <%
            }
        %>
    </div>
    <div style="float:left; width:297px; height:258px; background-image:url('img/middle_02.jpg');"></div>

    <!-- parte inferior esquerda -->
    <form id="winners" runat="server">
        <asp:ToolkitScriptManager id="toolheader" runat="server">
            <Services>
                <asp:ServiceReference Path="~/WebServices/DataServices.asmx" />
            </Services>
        </asp:ToolkitScriptManager>
        <div style="float:left; width:250px; height:170px; background-image:url('img/middle_03_antigo.jpg');">
            <div style="position:relative; top:45px;">
                <b>Vencedores Recentes</b><br />
                <div style="position:relative; top:4px;">
                    <asp:GridView id="grid" name="grid" runat="server" CssClass="gridStyle">
                        <PagerStyle CssClass="gridPager" />
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>

    <!-- parte inferior central -->
    <a href="Bingo.aspx" target="bingo" id="open_bingo" runat="server">
        <div style="float:left; width:300px; height:170px; background-image:url('img/middle_04.jpg');">
            <div style="position:relative; top:140px;">
                <asp:Label id="accum" style="font-size:18px" runat="server"></asp:Label>
            </div>
        </div>
    </a>

     <!-- parte inferior direita -->
    <div style="float:left; width:250px; height:170px; background-image:url('img/middle_05.jpg');">
        <div style="position:relative; top:45px;">
        <b>Suporte On-Line</b><br /><br />
        <!-- BEGIN Comm100 Live Chat Button Code --><div><div id="comm100_LiveChatDiv"></div><a href="http://www.comm100.com/livechat/" onclick="comm100_Chat();return false;" target="_blank" title = "Suporte On-Line"><img src="http://chatserver.comm100.com/BBS.aspx?siteId=24402&planId=457" border="0px" alt="Suporte On-Line" /></a></span></div></div><!-- End Comm100 Live Chat Button Code --> 
        </div>
    </div>

</div>

<!-- #include file="footer.aspx" -->
