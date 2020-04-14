<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrizeRequest.aspx.cs" Inherits="LuckPrize.PrizeRequest" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="LuckPrize" Namespace="LuckPrize.Validators" TagPrefix="custom" %>

<!-- #include file="header.aspx" -->

<script language="javascript" 
        src="/aspnet_client/system_web/1_0_3617_0/WebUIValidation.js">
</script>

<script language="javascript" type="text/javascript">
    function EnableBank() {
        document.getElementById('bankdata').style.display = 'block'; document.getElementById('back').style.height = '920px';
        var ctrl = document.getElementById('<%= min_value.ClientID %>');
        ctrl.innerHTML = '* mínimo R$ 10,00';
    }
    function DisableBank() {
        document.getElementById('bankdata').style.display = 'none';document.getElementById('back').style.height = '660px';
        var ctrl = document.getElementById('<%= min_value.ClientID %>');
        ctrl.innerHTML = '* mínimo R$ 0,01';
    }
</script>

<div style="width:800px">

    <div id="back" style="padding:16px; text-align:left; float:left; width:768px; height:920px; background-image:url('img/pattern_01.jpg');">

       <br><h2>Resgatar Prêmios</h2><br /><br /><br />

           <h4>Existem duas formas de sacar seus prêmios:<br /><br />

          1. Conta bancária - Você receberá o valor disponível do seu prêmio, através de transferência, doc, ted ou depósito em sua conta bancária. Normalmente em até 48hs, após sua solicitação.<br /><br />

          2. Converter em créditos - Converte automaticamente seu prêmio em saldo no site, para que você possa continuar jogando.<br /><br /><br /><br />

       


        <div style="width:500px; position:relative; left:150px;">
            <form id="draft" action="PrizeRequest.aspx" method="post" runat="server">
                <asp:ToolkitScriptManager id="toolkit1" runat="server">
                    <Services>
                        <asp:ServiceReference Path="~/WebServices/DataServices.asmx" />
                    </Services>
                </asp:ToolkitScriptManager>
                <h3>Selecione a opção desejada:</h3>
                <div style="padding:30px; width:440px; height:150px; background-color:#FFFFFF; color:#000000; font-size:18px;">
                    <asp:RadioButton id="deposit" Text="Depositar em conta bancária" onclick="EnableBank()" Checked="true" GroupName="opt" runat="server"/><br />
                    <asp:RadioButton id="tocredits" Text="Converter em créditos" onclick="DisableBank()" Checked="false" GroupName="opt" runat="server"/><br /><br />
                    Valor: R$ <asp:TextBox ID="value" NAME="value" MAXLENGTH="13" SIZE="13" runat="server"/><br />
                    <asp:MaskedEditExtender ID="msk_value" Enabled="true" TargetControlID="value" InputDirection="RightToLeft" Mask="99999999.99" MaskType="Number" CultureName="pt-BR" runat="server" CultureCurrencySymbolPlaceholder="R$" CultureDecimalPlaceholder="," CultureThousandsPlaceholder="." />
                    <asp:CustomValidator ID="custom_value" OnServerValidate="Server_ValidateValue" ControlToValidate="value" Display="Dynamic" runat="server" ErrorMessage="(Valor Inválido)" />
                    <asp:RequiredFieldValidator ID="req_value" ControlToValidate="value" Text="(Obrigatório)" Display="Dynamic" Runat="Server" /><br />
                    <span class="red" style="font-size:10px;"><asp:Label id="min_value" runat="server">* mínimo R$ 10,00</asp:Label></span>
                    <div style="width:180px; height:70px; position:relative; left:260px; top:-80px; background-color:#CCDCDC; text-align:center; vertical-align:middle">
                        <p style="color:#000000; font-weight:bold">Prêmio Disponível:</p><br />
                        <asp:Label id="premio" class="redbold" style="font-size:17px" runat="server" />
                    </div>
                </div>
                <br />
                <div id="bankdata" style="padding:30px; width:440px; height:220px; background-color:#FFFFFF; color:#000000; font-size:18px;">
                    <span class="register2">Banco:</span><asp:TextBox id="banco" maxlength="50" size="32" runat="server" />
                    <asp:CustomValidator ID="req_bank" OnServerValidate="Server_ValidateBank" ControlToValidate="banco" ValidateEmptyText="true" ErrorMessage="(Obrigatório)" Display="Dynamic" Runat="Server" /><br />
                    <span class="register2">Agência:</span><asp:TextBox id="agencia" maxlength="15" size="15" runat="server" />
                    <asp:CustomValidator ID="req_agencia" OnServerValidate="Server_ValidateAgencia" ControlToValidate="agencia" ValidateEmptyText="true" ErrorMessage="(Obrigatório)" Display="Dynamic" Runat="Server" /><br />
                    <span class="register2">Conta:</span><asp:TextBox id="conta" maxlength="20" size="20" runat="server" />
                    <asp:CustomValidator ID="req_conta" OnServerValidate="Server_ValidateConta" ControlToValidate="conta" ValidateEmptyText="true" ErrorMessage="(Obrigatório)" Display="Dynamic" Runat="Server" /><br />
                    <span class="register2">CPF:</span><asp:TextBox id="cpf" maxlength="15" size="15" runat="server" />
                    <asp:CustomValidator ID="req_cpf" OnServerValidate="Server_ValidateCPF" ControlToValidate="cpf" ValidateEmptyText="true" ErrorMessage="(Obrigatório)" Display="Dynamic" Runat="Server" />
                    <asp:MaskedEditExtender ID="msk_cpf" Enabled="true" TargetControlID="cpf" Mask="999,999,999-99" runat="server" /><br />
                    <span class="register2">Titular:</span><asp:TextBox id="titular" maxlength="50" size="32" runat="server" />
                    <asp:CustomValidator ID="req_titular" OnServerValidate="Server_ValidateTitular" ControlToValidate="titular" ValidateEmptyText="true" ErrorMessage="(Obrigatório)" Display="Dynamic" Runat="Server" /><br />
                    <asp:RadioButton id="corrente" Text="Conta Corrente" Checked="true" GroupName="tipoconta" runat="server"/><br />
                    <asp:RadioButton id="poupança" Text="Conta Poupança" Checked="false" GroupName="tipoconta" runat="server"/>
                    <br />
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
