<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyMessagesRead.aspx.cs" Inherits="LuckPrize.MyMessagesRead" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="LuckPrize" Namespace="LuckPrize.Validators" TagPrefix="custom" %>

<!-- #include file="header.aspx" -->

<script language="javascript" type="text/javascript">
</script>

<div style="width:800px">

    <div style="padding:16px; text-align:left; float:left; width:768px; height:650px; background-image:url('img/pattern_01.jpg');">

        <h1>Minhas Mensagens</h1>

        <br /><br />
        Todas as mensagens estão disponíveis apenas por trinta dias!
        <br /><br />

        <form runat="server">
        <div style="width:600px; position:relative; left:100px;">
            <div style="padding:30px; width:540px; height:320px; background-color:#FFFFFF; color:#000000; font-size:18px;">
            Data: <asp:Label id="data" class="redbold" runat="server"></asp:Label><br /><br />
            Assunto: <asp:Label id="assunto" class="redbold" runat="server"></asp:Label><br /><br />
            Mensagem: <br />
            <asp:TextBox ID="mensagem" enabled="false" NAME="mensagem" TEXTMODE="MultiLine" MAXLENGTH="2048" HEIGHT="200px" WIDTH="500px" runat="server" />
            </div>
        </div>
        </form>

        <br /><br />

        <center>
        <input type="button" value="OK" onclick="location.href='MyMessages.aspx'">
        </center>

    </div>

</div>

<!-- #include file="footer.aspx" -->
