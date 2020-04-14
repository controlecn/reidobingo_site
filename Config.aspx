<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Config.aspx.cs" Inherits="LuckPrize.Config" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="LuckPrize" Namespace="LuckPrize.Validators" TagPrefix="custom" %>

<!-- #include file="header.aspx" -->

<script language="javascript" type="text/javascript">
</script>

<div style="width:800px">

    <div style="padding:16px; text-align:left; float:left; width:768px; height:620px; background-image:url('img/pattern_01.jpg');">

        <br><h2>Config do sistema</h2><br /><br /><br />

        <form id="config" runat="server">
        <div style="width:650px; position:relative; left:50px">

            Máximo de Jogadores: <asp:textbox id="bingo_max_players" MAXLENGTH="3" SIZE="5" runat="server"></asp:textbox><br />
            <br />

            Frequência normal: <asp:textbox id="bingo_normal_freq_days" MAXLENGTH="10" SIZE="15" runat="server"></asp:textbox> dias e <asp:textbox id="bingo_normal_freq_minutes" MAXLENGTH="10" SIZE="15" runat="server"></asp:textbox> minutos<br />
            Frequência mega: <asp:textbox id="bingo_mega_freq_days" MAXLENGTH="10" SIZE="15" runat="server"></asp:textbox> dias e <asp:textbox id="bingo_mega_freq_minutes" MAXLENGTH="10" SIZE="15" runat="server"></asp:textbox> minutos<br />
            <br />

            Valor normal: <asp:textbox id="bingo_price_normal" MAXLENGTH="10" SIZE="15" runat="server"></asp:textbox><br />
            Valor mega: <asp:textbox id="bingo_price_mega" MAXLENGTH="10" SIZE="15" runat="server"></asp:textbox><br />
            <br />

            Acumulado: <asp:textbox id="bingo_accum" MAXLENGTH="10" SIZE="15" runat="server"></asp:textbox><br />
            Porcentagem Acumulado: <asp:textbox id="bingo_percent_accum" MAXLENGTH="10" SIZE="15" runat="server"></asp:textbox><br />
            Porcentagem Prêmio: <asp:textbox id="bingo_percent_prize" MAXLENGTH="10" SIZE="15" runat="server"></asp:textbox><br />
            Acumulado Inicial: <asp:textbox id="bingo_initial_accum" MAXLENGTH="10" SIZE="15" runat="server"></asp:textbox><br />
            <br />

            Bônus por indicação: <asp:textbox id="friend_credits" MAXLENGTH="10" SIZE="15" runat="server"></asp:textbox><br />
            <br />

            <asp:Button ID="btnSubmit" runat="server" Text="Salvar" OnClick="btnSubmit_Click" /><asp:Label id="save_message" class="redbold" runat="server"></asp:Label>
        </div>
        </form>

    </div>

</div>
<!-- #include file="footer.aspx" -->
