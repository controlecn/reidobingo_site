<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LuckAdmin.aspx.cs" Inherits="LuckPrize.LuckAdmin" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="LuckPrize" Namespace="LuckPrize.Validators" TagPrefix="custom" %>

<!-- #include file="header.aspx" -->

<script language="javascript" type="text/javascript">
</script>

<div style="width:800px">

    <div style="padding:16px; text-align:left; float:left; width:768px; height:480px; background-image:url('img/pattern_01.jpg');">

        <h2>Menu do Administrador</h2>
        <br />

        <form id="adminform" method="post" runat="server">
            <asp:ToolkitScriptManager id="toolkit1" runat="server">
                <Services>
                    <asp:ServiceReference Path="~/WebServices/DataServices.asmx" />
                </Services>
            </asp:ToolkitScriptManager>
        
            <div style="float:left; width:255px; height:150px;">
                <p class="admmnuhead">Resumo Geral
                <table cellspacing="0" border="1" bordercolor="#000000" width="230">
                    <tr><td align="right" width="100">Rodadas</td><td><asp:Label runat="server" id="total_turns">0</asp:Label></td></tr>
                    <tr><td align="right" width="100">Canceladas</td><td><asp:Label runat="server" id="total_cancels">0</asp:Label></td></tr>
                    <tr><td align="right" width="100">Apostas</td><td><asp:Label runat="server" id="total_bets">0</asp:Label></td></tr>
                    <tr><td align="right" width="100">Prêmios</td><td><asp:Label runat="server" id="total_prizes">0</asp:Label></td></tr>
                    <tr><td align="right" width="100">Lucro</td><td><asp:Label runat="server" id="total_lucre">0</asp:Label></td></tr>
                    </tr>
                </table>
            </div>

            <div style="float:left; width:255px; height:150px;">
                <p class="admmnuhead">Cadastros dos Usuários</p>
                <table cellspacing="0" border="1" bordercolor="#000000" width="230">
                    <tr><td align="right" width="100">Cadastrados</td><td><asp:Label runat="server" id="users_cad">0</asp:Label></td></tr>
                    <tr><td align="right" width="100">Confirmados</td><td><asp:Label runat="server" id="users_conf">0</asp:Label></td></tr>
                    <tr><td align="right" width="100">Não confirmados</td><td><asp:Label runat="server" id="users_unconf">0</asp:Label></td></tr>
                    <tr><td align="right" width="100">Com créditos</td><td><asp:Label runat="server" id="users_with_creds">0</asp:Label></td></tr>
                    <tr><td align="right" width="100">Sem créditos</td><td><asp:Label runat="server" id="users_no_creds">0</asp:Label></td></tr>
                    <tr><td align="right" width="100">Soma créditos</td><td><asp:Label runat="server" id="users_sum_creds">0</asp:Label></td></tr>
                    <tr><td align="right" width="100">Soma prêmios</td><td><asp:Label runat="server" id="users_sum_prizes">0</asp:Label></td></tr>
                    </tr>
                </table>
            </div>

            <div style="float:left; width:255px; height:100px;">
                <p class="admmnuhead">Requisições Pendentes</p>
                <table cellspacing="0" border="1" bordercolor="#000000" width="230">
                    <tr><td align="right" width="100">Nº Resgates</td><td><asp:Label runat="server" id="num_reqs_prize">0</asp:Label></td></tr>
                    <tr><td align="right" width="100">Soma Resgates</td><td><asp:Label runat="server" id="sum_reqs_prize">0</asp:Label></td></tr>
                    <tr><td align="right" width="100">Nº Compras</td><td><asp:Label runat="server" id="num_reqs_credit">0</asp:Label></td></tr>
                    <tr><td align="right" width="100">Soma Compras</td><td><asp:Label runat="server" id="sum_reqs_credit">0</asp:Label></td></tr>
                    </tr>
                </table>
            </div>

            <br />

            <div style="float:left; width:700px; height:100px;">
                <br />
                <input type="button" value="Cadastros" onclick="location.href='Users.aspx'" />
                <input type="button" value="Configurações" onclick="location.href='Config.aspx'" />
                <asp:Button ID="btnClear" runat="server" Text="Limpar não Ativados" OnClick="btnClearOlds_Click" /><asp:Label id="clear_message" class="redbold" runat="server"></asp:Label>
                <br /><br />
                <input type="button" value="Compras" onclick="location.href='Buys.aspx'" />
                <input type="button" value="Resgates" onclick="location.href='Rescues.aspx'" />
                <input type="button" value="Newsletters" onclick="location.href='Newsletters.aspx'" />
                <input type="button" value="Bancos" onclick="location.href='Banks.aspx'" />
                <input type="button" value="Bônus" onclick="location.href='BonusRanges.aspx'" />
                <br /><br />                
                <input type="button" value="Log Geral" onclick="location.href='Log.aspx'" />
                <input type="button" value="Log Chat" onclick="location.href='LogChat.aspx'" />
                <input type="button" value="Relatório Bingo" onclick="location.href='ResultsExtended.aspx'" />
                <input type="button" value="Relatório Geral" onclick="location.href='ResumePeriod.aspx'" />
                <br /><br /><br /><br /><br />
                <asp:Button ID="btnClearOldYear" runat="server" Text="LIMPAR LOGS" OnClick="btnClearOldYear_Click" /><asp:Label id="clear_oldyearmessage" class="redbold" runat="server"></asp:Label>
            </div>

        </form>

    </div>

</div>

<!-- #include file="footer.aspx" -->
