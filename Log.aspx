<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Log.aspx.cs" Inherits="LuckPrize.Log" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="LuckPrize" Namespace="LuckPrize.Validators" TagPrefix="custom" %>

<!-- #include file="header.aspx" -->

<script language="javascript" type="text/javascript">
</script>

<div style="width:800px">

    <div style="padding:16px; text-align:left; float:left; width:768px; height:780px; background-image:url('img/pattern_01.jpg');">

        <br><h2>Log do sistema</h2><br /><br />


            <form id="range" action="Log.aspx" method="post" runat="server">
                <asp:ToolkitScriptManager id="toolkit1" runat="server">
                    <Services>
                        <asp:ServiceReference Path="~/WebServices/DataServices.asmx" />
                    </Services>
                </asp:ToolkitScriptManager>
                <div style="width:600px; position:relative; left:100px; background-color:#CCDCDC">
                    <span class="msgheader1">
                    <asp:TextBox id="date" AutoPostBack="true" onchange="range.frm_pg.value=1" style="margin-left:4px; margin-top:4px; margin-bottom:4px; margin-right:0px;" maxlength="10" size="10" runat="server"></asp:TextBox>
                    <asp:ImageButton id="popcal" ImageURL="~/img/popcal.png" Width="16" Height="16" style="margin-left:0px; margin-top:9px; margin-right:4px;" runat="server" ImageAlign="Top" />
                    <asp:MaskedEditExtender ID="msk_date" Enabled="true" TargetControlID="date" Mask="99/99/9999" MaskType="Date" CultureName="pt-BR" runat="server" />
                    <asp:MaskedEditValidator ID="mskv_date" runat="server" Display="Static" ControlExtender="msk_date" ControlToValidate="date" EmptyValueMessage="" InvalidValueMessage="(Data inválida)" IsValidEmpty="False"></asp:MaskedEditValidator>
                    <asp:CalendarExtender id="calendar" TargetControlID="date" Format="dd/MM/yyyy" PopupButtonID="popcal" PopupPosition="bottomright" runat="server" cssclass="cal_Theme1"></asp:CalendarExtender>
                    <asp:HiddenField id="frm_pg" runat="server"></asp:HiddenField>
                    <asp:Button ID="btnSubmit" runat="server" Text="Pesquisar" OnClick="btnSubmit_Click" />
                    </span>
                    <span class="msgheader2">
                    <asp:Label id="header" runat="server"></asp:Label>
                    </span>
                </div>
                <div style="width:600px; position:relative; left:100px; background-color:#E0E0FF">
                    <asp:GridView id="grid" name="grid" runat="server">
                        <PagerStyle CssClass="gridPager" />
                    </asp:GridView>
                </div>
            </form>

        <br /><br />

        <center>
        <input type="button" value="OK" onclick="location.href='MyAccount.aspx'">
        </center>

    </div>

</div>

<!-- #include file="footer.aspx" -->
