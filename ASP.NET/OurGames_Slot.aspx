<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OurGames_Bingo.aspx.cs" Inherits="LuckPrize.OurGames_Bingo" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="LuckPrize" Namespace="LuckPrize.Validators" TagPrefix="custom" %>

<!-- #include file="header.aspx" -->
<script language="javascript" type="text/javascript">
</script>

<div style="width:800px">

    <div style="padding:16px; text-align:left; float:left; width:471px; height:530px; background-image:url('img/pattern_01.jpg');">
        <center>
        <h1>Mania das Frutas</h1>
        <br />

        <img src="img/screen_bingo.jpg" width="400" height="298" />
        <br /><br /><br />
        <div style="border-width:2px; border-style:solid; width:400px; height:50px;">
        <p style="margin-top:12px; font-size:25px; font-weight:bolder">Acumulado: <asp:Label id="accum" runat="server"></asp:Label></p>
        </div>
        <br /><br />

        <a href="Bingo.aspx" target="_blank" id="open_bingo" runat="server">
            <img src="img/btn_play.png" border="0" />
        </a>

        </center>
    </div>
    <div style="padding:16px; float:left; text-align:left; width:265px; height:530px; background-image:url('img/pattern_01.jpg');">
        <h2>Informações:</h2>
        <ul>
        <li>Jogue instantâneo - Sem download</li>
        <li>8 Símbolos prêmiados.</li>
        <li>5 Linhas de Premiação.</li>
        <li>Até 10 apostas por linha</li>
        <li>Aposta mínima: <asp:Label id="normal_value" runat="server"></asp:Label><br />
        <li>Aposta máxima: <asp:Label id="mega_value" runat="server"></asp:Label><br />
        </li>
        </ul>
    </div>

</div>

<!-- #include file="footer.aspx" -->
