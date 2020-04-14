<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BuyRequestConfirmation.aspx.cs" Inherits="LuckPrize.BuyRequestConfirmation" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="LuckPrize" Namespace="LuckPrize.Validators" TagPrefix="custom" %>

<!-- #include file="header.aspx" -->

<script language="javascript" type="text/javascript">
</script>

<div style="width:800px">

    <div style="padding:16px; text-align:left; float:left; width:768px; height:630px; background-image:url('img/pattern_01.jpg');">

        <br><h2>Comprar Créditos</h2><br /><br /><br /> 

         Os créditos serão liberados de imediato, assim que forem identificados no sistema bancário após sua transferência. 
        Caso efetue depósito, acesse o ATENDIMENTO ONLINE e informe o número do pedido.
        <br /><br /><br />

        <div style="width:600px; position:relative; left:100px;">
            <h3>Comprovante de Requisição de Compra de Créditos:</h3>
            <div style="padding:30px; width:540px; height:320px; background-color:#FFFFFF; color:#000000; font-size:18px;">
            Nº <asp:Label id="numero" class="redbold" runat="server"></asp:Label><br />
            <!--Créditos: <asp:Label id="creditos" class="redbold" runat="server"></asp:Label><br />-->
            Data: <asp:Label id="data" class="redbold" runat="server"></asp:Label><br />
            <br />
            <b>Dados para Depósito:</b><br />
            <br />
            Banco: <asp:Label id="banco" class="redbold" runat="server"></asp:Label><br />
            Agência: <asp:Label id="agencia" class="redbold" runat="server"></asp:Label> 
            Conta: <asp:Label id="conta" class="redbold" runat="server"></asp:Label><br />
            Titular: <asp:Label id="titular" class="redbold" runat="server"></asp:Label><br />
            Valor: <asp:Label id="valor" class="redbold" runat="server"></asp:Label> 
            <br /><br />
            <b><u>ATENÇÃO!</u></b> <p class="redbold">Deposite o valor exato, pois será identificado pelos centavos.</p>
            </div>
        </div>

        <br /><br />

        <center>
        <input type="button" value="OK" onclick="location.href='MyAccount.aspx'">
        </center>

    </div>

</div>

<!-- #include file="footer.aspx" -->
