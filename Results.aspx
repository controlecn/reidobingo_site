<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Results.aspx.cs" Inherits="LuckPrize.Results" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="LuckPrize" Namespace="LuckPrize.Validators" TagPrefix="custom" %>

<!-- #include file="header.aspx" -->

<script language="javascript" type="text/javascript">
</script>

<div style="width:800px">

    <div style="padding:16px; text-align:left; float:left; width:768px; height:780px; background-image:url('img/pattern_01.jpg');">

        <br><h2>Últimos Resultados</h2><br /><br /><br /> 

        
            <form id="results" action="Results.aspx" method="post" runat="server">
                <asp:ToolkitScriptManager id="toolkit1" runat="server">
                    <Services>
                        <asp:ServiceReference Path="~/WebServices/DataServices.asmx" />
                    </Services>
                </asp:ToolkitScriptManager>
                <div style="width:600px; position:relative; left:100px; background-color:#E0E0FF">
                    <asp:GridView id="grid" name="grid" runat="server"></asp:GridView>
                </div>
            </form>

        <br /><br />

        <center>
        <input type="button" value="OK" onclick="location.href='MyAccount.aspx'">
        </center>

    </div>

</div>

<!-- #include file="footer.aspx" -->
