<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registered.aspx.cs" Inherits="LuckPrize.Registered" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!-- #include file="header.aspx" -->

<div style="width:800px">

    <div style="padding:16px; text-align:left; float:left; width:471px; height:226px; background-image:url('img/empty_middle_01.jpg');">
        <h1>Cadastrado com Sucesso</h1>
        <br /><br />
        Seu usuário foi cadastrado com sucesso.
        <br /><br />
        Um e-mail de confirmação foi enviado para o endereço <b><% Response.Write("<a href = mailto:" + userTO.email + ">" + userTO.email + "</a>"); %></b>. Para ativar a sua conta, siga as instruções do e-mail.
        <br /><br />
        Se nos próximos minutos o e-mail não chegar na sua caixa-postal, você pode acessar o site com o seu login e senha cadastrados, para que o sistema reenviei outra confirmação de cadastro.
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
