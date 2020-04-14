<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BuyRequest.aspx.cs" Inherits="LuckPrize.Buy" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="LuckPrize" Namespace="LuckPrize.Validators" TagPrefix="custom" %>

<!-- #include file="header.aspx" -->

<script language="javascript" type="text/javascript">
</script>

<div style="width:800px">

    <div style="padding:16px; text-align:left; float:left; width:768px; height:480px; background-image:url('img/pattern_01.jpg');">

        
        <br><h2>Comprar Créditos</h2><br /><br /><br /> 

        
        <b>Pagamento através de transferência bancária os créditos são liberados imediatamente, já depósito pode levar até 24hs!</b>
        <br /><br /><br /><br />

        <div style="width:500px; position:relative; left:150px;">
            <form id="buy" action="BuyRequest.aspx" method="post" runat="server">
                <h3>Selecione o valor e o banco para efetuar o pagamento:</h3>
                <div style="padding:30px; width:440px; height:60px; background-color:#FFFFFF; color:#000000; font-size:18px;">
                    <div style="float:left; width:200px;">Valor:</div>
                    <div style="float:left; width:200px;">Banco:</div>
                    <br />
                    <div style="font-weight:bolder; float:left; width:200px;">
                    <asp:DropDownList ID="buyvalue" NAME="buyvalue" runat="server">
                    </asp:DropDownList>
                    <asp:RangeValidator ID="val_buyvalue" ControlToValidate="buyvalue" MinimumValue="1" MaximumValue="9999" ErrorMessage="(Obrigatório)" runat="server" />
                    </div>
                    <div style="font-weight:bolder; float:left; width:200px;">
                    <asp:DropDownList ID="bank" NAME="bank" runat="server">
                    </asp:DropDownList>
                    <asp:RangeValidator ID="val_bank" ControlToValidate="bank" MinimumValue="1" MaximumValue="9999" ErrorMessage="(Obrigatório)" runat="server" />
                    </div>
                </div>
                <br /><br />
                <center>
                <asp:Button ID="btnSubmit" runat="server" Text="Continuar" OnClick="btnSubmit_Click" />
                </center>
            </form>
        </div>

    </div>

</div>

<!-- #include file="footer.aspx" -->
