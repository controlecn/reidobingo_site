<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BuyRequestExists.aspx.cs" Inherits="LuckPrize.BuyRequestExists" %>

<!-- #include file="header.aspx" -->

<script language="javascript" type="text/javascript">
</script>

<div style="width:800px">

    <div style="padding:16px; text-align:left; float:left; width:768px; height:600px; background-image:url('img/pattern_01.jpg');">

         <br><h2>Comprar Créditos</h2><br /><br /><br /> 
        
        Os créditos serão liberados de imediato, assim que forem identificados no sistema bancário após sua transferência. 
        Caso efetue depósito, acesse o ATENDIMENTO ONLINE e informe o número do pedido.
        <br /><br /><br /><br />

        <div style="width:620px; position:relative; left:70px;">
            <h3>Você possui uma solicitação pendente!</h3>
            <div style="padding:30px; width:560px; height:200px; background-color:#FFFFFF; color:#000000; font-size:18px;">
                Nº: <asp:Label id="num" class="redbold" runat="server"></asp:Label><br /><br />
                <div style="float:left; width:100px; background-color:#D0D0D0; border-width:1px; border-color:#000000; border-style:solid;">Data</div>
                <div style="float:left; width:70px; background-color:#D0D0D0; border-width:1px; border-color:#000000; border-style:solid;">Hora</div>
                <div style="float:left; width:250px; background-color:#D0D0D0; border-width:1px; border-color:#000000; border-style:solid;">Banco</div>
                <div style="float:left; width:100px; background-color:#D0D0D0; border-width:1px; border-color:#000000; border-style:solid;">Valor</div>
                <br />
                <div id="data" style="float:left; width:100px; border-width:1px; border-color:#000000; border-style:solid;" runat="server"></div>
                <div id="hora" style="float:left; width:70px; border-width:1px; border-color:#000000; border-style:solid;" runat="server"></div>
                <div id="banco" style="float:left; width:250px; border-width:1px; border-color:#000000; border-style:solid;" runat="server"></div>
                <div id="valor" style="float:left; width:100px; border-width:1px; border-color:#000000; border-style:solid;" runat="server"></div>
                <br /><br />
                Agência: <asp:label id="agencia" class="redbold" runat="server"></asp:label><br />
                Conta: <asp:label id="conta" class="redbold" runat="server"></asp:label><br />
                Titular: <asp:label id="titular" class="redbold" runat="server"></asp:label><br />
                <form id="cancel" action="BuyRequestExists.aspx?action=cancel" method="post" runat="server">
                    <p align="right">
                        <asp:Button ID="btnSubmit" runat="server" Text="Cancelar a Requisição" />
                    </p>
                </form>
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
