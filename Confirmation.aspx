<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Confirmation.aspx.cs" Inherits="LuckPrize.Confirm" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!-- #include file="header.aspx" -->

<div style="width:800px">

    <div style="padding:16px; text-align:left; float:left; width:471px; height:226px; background-image:url('img/empty_middle_01.jpg');">
        <%
            if (userTO == null)
            {
        %>
            <h1>Confirmação Inválida!</h1>
            <br /><br />
            O código de confirmação expirou ou é inválido.
        <%
            }
            else
            {
        %>
            <h1>Confirmado!</h1>
            <br /><br />
            Seu E-mail foi validado e sua conta foi ativada.
            <br /><br />
            Desejamos muita diversão e boa sorte, divirta-se no LuckPrize!
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
