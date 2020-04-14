<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BonusRanges.aspx.cs" Inherits="LuckPrize.BonusRanges" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="LuckPrize" Namespace="LuckPrize.Validators" TagPrefix="custom" %>

<!-- #include file="header.aspx" -->

<script language="javascript" type="text/javascript">
</script>

<div style="width:800px">

    <div style="padding:16px; text-align:left; float:left; width:768px; height:780px; background-image:url('img/pattern_01.jpg');">

        <br><h2>Cadastro Bônus</h2><br /><br />

            <form id="bonusranges" action="BonusRanges.aspx" method="post" runat="server">
                <asp:ToolkitScriptManager id="toolkit1" runat="server">
                    <Services>
                        <asp:ServiceReference Path="~/WebServices/DataServices.asmx" />
                    </Services>
                </asp:ToolkitScriptManager>
                <asp:HiddenField id="update_id" runat="server"></asp:HiddenField>
                <div style="width:750px; position:relative; left:5px; background-color:#CCDCDC">
                    <span class="msgheader2">
                    <asp:Label id="header" runat="server"></asp:Label>
                    </span>
                </div>
                <div style="width:750px; position:relative; left:5px; background-color:#E0E0FF">
                    <asp:GridView id="grid" name="grid" runat="server">
                        <PagerStyle CssClass="gridPager" />
                    </asp:GridView>
                </div>

                <br /><br />

                <span class="register">Créditos:</span>
                <asp:TextBox ID="credits" MAXLENGTH="10" SIZE="10" runat="server"/>
                <br />

                <span class="register">Porcentagem:</span>
                <asp:TextBox ID="bonus_percent" MAXLENGTH="6" SIZE="6" runat="server"/>
                <br />

                <center>
                <asp:Button ID="btnSubmit" runat="server" Text="Atualizar" OnClick="btnSubmit_Click" />
                <input type="button" value="Cancelar" onclick="location.href='LuckAdmin.aspx'">
                <br />
                <asp:Label id="save_message" class="redbold" runat="server"></asp:Label>
                </center>

            </form>

        <br />

    </div>

</div>

<!-- #include file="footer.aspx" -->
