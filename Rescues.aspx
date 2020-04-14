<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rescues.aspx.cs" Inherits="LuckPrize.Rescues" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="LuckPrize" Namespace="LuckPrize.Validators" TagPrefix="custom" %>

<!-- #include file="header.aspx" -->

<script language="javascript" type="text/javascript">
</script>

<div style="width:800px">

    <div style="padding:16px; text-align:left; float:left; width:768px; height:780px; background-image:url('img/pattern_01.jpg');">

          <br><h2>Resgates de Prêmio</h2><br /><br />

            <form id="range" action="Rescues.aspx" method="post" runat="server">
                <asp:ToolkitScriptManager id="toolkit1" runat="server">
                    <Services>
                        <asp:ServiceReference Path="~/WebServices/DataServices.asmx" />
                    </Services>
                </asp:ToolkitScriptManager>
                <div style="width:750px; position:relative; left:5px; background-color:#CCDCDC">
                    <span class="msgheader3">
                    <font color="#000000">ID ou Login:</font> <asp:TextBox id="search" width="250px" AutoPostBack="true" onchange="" style="margin-left:4px; margin-top:4px; margin-bottom:4px; margin-right:0px;" maxlength="30" size="10" runat="server"></asp:TextBox>
                    <asp:HiddenField id="frm_pg" runat="server"></asp:HiddenField>
                    <asp:Button ID="btnSubmit" runat="server" Text="Pesquisar" OnClick="btnSubmit_Click" />
                    </span>
                    <span class="msgheader2">
                    <asp:Label id="header" runat="server"></asp:Label>
                    </span>
                </div>
                <div style="width:750px; position:relative; left:5px; background-color:#E0E0FF">
                    <asp:GridView id="grid" name="grid" runat="server">
                        <PagerStyle CssClass="gridPager" />
                    </asp:GridView>
                </div>
            </form>

        <br /><br />

        <center>
        <input type="button" value="OK" onclick="location.href='LuckAdmin.aspx'">
        </center>

    </div>

</div>

<!-- #include file="footer.aspx" -->
