<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrizeRequestConverted.aspx.cs" Inherits="LuckPrize.PrizeRequestConverted" %>

<!-- #include file="header.aspx" -->

<script language="javascript" type="text/javascript">
</script>

<div style="width:800px">

    <div style="padding:16px; text-align:left; float:left; width:768px; height:600px; background-image:url('img/pattern_01.jpg');">

        <br><h2>Resgatar Prêmios</h2><br /><br /><br /><br /><br />

         

        <div style="width:620px; position:relative; left:70px;">
            <h3>Os créditos solicitados foram convertidos:</h3>
            <div style="padding:30px; width:560px; height:50px; background-color:#FFFFFF; color:#000000; font-size:18px;">
                Nº: <asp:label id="num" class="redbold" runat="server"></asp:label><br />
                Créditos: <asp:label id="creditos" class="redbold" runat="server"></asp:label><br />
            </div>

            <br /><br />

            <center>
            <input type="button" value="OK" onclick="location.href='MyAccount.aspx'">
            </center>
        </div>

        <center>
        <br />
        </center>

    </div>

</div>

<!-- #include file="footer.aspx" -->
