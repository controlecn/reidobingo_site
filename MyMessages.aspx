<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyMessages.aspx.cs" Inherits="LuckPrize.MyMessages" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="LuckPrize" Namespace="LuckPrize.Validators" TagPrefix="custom" %>

<!-- #include file="header.aspx" -->

<script language="javascript" type="text/javascript">
    function Delete() {
    }
    function CheckAll() {
        var chkall = document.getElementById('chkall');
        for (i = 0; i < 100; i++) {
            var ctrl = document.getElementById('chk' + i);
            if (ctrl != null) {
                ctrl.checked = chkall.checked;
            }
        }
    }
</script>

<div style="width:800px">

    <div style="padding:16px; text-align:left; float:left; width:768px; height:600px; background-image:url('img/pattern_01.jpg');">

        
        <br><h2>Minhas Mensagens</h2><br /><br /><br /><br /><br />


        <form id="frm" method="post" action="MyMessages.aspx" runat="server">
            <div style="width:600px; padding:0px; margin:0px; position:relative; left:100px; background-color:#CCDCDC; color:#000000">
                <asp:Label id="header" runat="server"></asp:Label>
            </div>
            <div style="width:600px; padding:0px; margin:0px; position:relative; left:100px; background-color:#E0E0FF; color:#000000">
                <asp:Label id="grid" name="grid" runat="server"></asp:Label>
            </div>
            <div style="width:600px; padding:0px; margin:0px; position:relative; left:100px; background-color:#CCDCDC; color:#000000">
                <asp:Label id="footer" runat="server"></asp:Label>
            </div>
        </form>

        <br /><br />

        <center>
        <input type="button" value="OK" onclick="location.href='MyAccount.aspx'">
        </center>

    </div>

</div>

<!-- #include file="footer.aspx" -->
