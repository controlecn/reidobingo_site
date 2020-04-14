<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Indications.aspx.cs" Inherits="LuckPrize.Indications" ValidateRequest="False" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="LuckPrize" Namespace="LuckPrize.Validators" TagPrefix="custom" %>

<!-- #include file="header.aspx" -->

<script language="javascript" type="text/javascript">
    String.prototype.trim = function() {
        return this.replace(/^\s+|\s+$/g, "");
    }
    function ValidateName(source, args) {
        var lbl = document.getElementById('<%= lbl_Name.ClientID %>');
        var ctrl = document.getElementById('<%= name.ClientID %>');
        var reg = /^[a-zA-Z0-9-_\s]+$/;
        if (ctrl.value == null || ctrl.value.length == 0) {
            lbl.innerHTML = "(Obrigatório)";
            args.IsValid = false;
        }
        else if (ctrl.value[0] == ' ') {
            args.IsValid = false;
            lbl.innerHTML = "(Inválido)";
        } else {
            if (!reg.test(ctrl.value)) {
                lbl.innerHTML = "(Inválido)";
            }
            else {
                lbl.innerHTML = "";
            }
        }
    }
    function ValidateEmail(source, args) {
        var ctrl = document.getElementById('<%= email.ClientID %>');
        if (ctrl.value != null)
            args.IsValid = !LuckPrize.DataServices.EMailExists(ctrl.value, ValidateEmailResult);
    }
    function ValidateEmailResult(result) {
        var lbl = document.getElementById("<%= emailExistsLabel.ClientID %>");
        if (result) {
            lbl.innerHTML = "(Já Cadastrado)";
        }
        else {
            lbl.innerHTML = "";
        }
    }
    function ValidateMessage(source, args) {
        var lbl = document.getElementById('<%= lbl_Message.ClientID %>');
        var ctrl = document.getElementById('<%= message.ClientID %>');
        var reg = /^[^"']+$/;
        if (ctrl.value == null || ctrl.value.length == 0) {
            lbl.innerHTML = "(Obrigatório)";
            args.IsValid = false;
        }
        else if (ctrl.value[0] == ' ') {
            args.IsValid = false;
            lbl.innerHTML = "(Inválido)";
        } else {
//            if (!reg.test(ctrl.value)) {
//                lbl.innerHTML = "(Inválido)";
//            }
//            else {
                lbl.innerHTML = "";
//            }
        }
    }
    function Recalculate() {
    }
</script>

<div style="width:800px">

    <div style="padding:16px; text-align:left; float:left; width:471px; height:590px; background-image:url('img/pattern_01.jpg');">
       
        <br><h2>Indicação de Amigos</h2><br /><br /><br />

        <div style="width:500px; height:590px; background:transparent; overflow:auto;">

            <form id="regform" name="regform" method="post" action="Indications.aspx" runat="server" defaultfocus="name">
                <asp:ToolkitScriptManager id="toolkit1" runat="server">
                    <Services>
                        <asp:ServiceReference Path="~/WebServices/DataServices.asmx" />
                    </Services>
                </asp:ToolkitScriptManager>

                <span class="register">Nome:</span>
                <asp:TextBox ID="name" NAME="name" MAXLENGTH="50" SIZE="40" runat="server"/>
                <asp:CustomValidator ID="custom_ValName" ClientValidationFunction="ValidateName" OnServerValidate="Server_ValidateName" ControlToValidate="name" Display="Dynamic" runat="server" ErrorMessage="" />
                <asp:RequiredFieldValidator ID="req_Name" ControlToValidate="name" Text="(Obrigatório)" Display="Dynamic" Runat="Server" />
                <asp:Label runat="server" id="lbl_Name" style="color:#FF0000" />
                <br />

                <span class="register">Email:</span>
                <asp:TextBox ID="email" NAME="email" MAXLENGTH="50" SIZE="30" runat="server"/>
                <asp:RegularExpressionValidator ID="val_email" runat="server" Display="Dynamic" ErrorMessage="Email inválido." ControlToValidate="email" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$" />
                <asp:CustomValidator ID="custom_ValEmail" ClientValidationFunction="ValidateEmail" OnServerValidate="Server_ValidateEmail" ControlToValidate="email" Display="Dynamic" runat="server" ErrorMessage="(Já Cadastrado)" />
                <asp:RequiredFieldValidator ID="req_email" ControlToValidate="email" Text="(Obrigatório)" Display="Dynamic" Runat="Server" />
                <asp:Label runat="server" id="emailExistsLabel" style="color:#FF0000" />
                <br />

                <span class="register">Mensagem:</span>
                <asp:TextBox ID="message" NAME="message" READONLY="true" TEXTMODE="MultiLine" MAXLENGTH="2048" HEIGHT="250px" WIDTH="300px" runat="server"/>
                <asp:CustomValidator ID="custom_ValMessage" ClientValidationFunction="ValidateMessage" OnServerValidate="Server_ValidateMessage" ControlToValidate="message" Display="Dynamic" runat="server" ErrorMessage="" />
                <asp:RequiredFieldValidator ID="req_Message" ControlToValidate="message" Text="(Obrigatório)" Display="Dynamic" Runat="Server" />
                <asp:Label runat="server" id="lbl_Message" style="color:#FF0000" />
                <br />

                <center><h3><asp:Label runat="server" id="lbl_sent" /></h3></center><br />

                <span class="register"></span>
                <asp:Button ID="btnSubmit" runat="server" Text="Enviar" OnClick="btnSubmit_Click" />
            </form>
        </div>
    </div>
    <div style="padding:16px; float:left; text-align:left; width:265px; height:590px; background-image:url('img/pattern_01.jpg');">
        <div style="padding:16px; width:232px; height:490px; color:#000000; background-color:#C0D0E0;">
            <h3><b>Preencha o formulário com os dados de seu amigo e ganhe <asp:Label id="valor_indicacao" runat="server" class="redbold" /> 
            na compra de crédito do seu indicado.</b></h3>
            <br /><br />
            <h4><b>Sua estatística de Indicação:</b></h4>
            <br />
            <b>Mês atual: <asp:Label id="mes" class="redbold" runat="server"></asp:Label></b><br /><br />
            <b>Indicados/Comprou: <asp:Label id="indicou" class="redbold" runat="server" /></b><br /><br />
            <b>Valor Pago: <asp:Label id="pagou" class="redbold" runat="server" /></b><br /><br />
            <br />
            <h3>
            Utilize o link abaixo para divulgar o LuckPrize.com em seu site ou blog e ganhe dinheiro com a 
            compra de crédito do seu indicado.
            <br /><br />
            <a href="http://www.luckprize.com/Register.aspx?ind=<% Response.Write(userTO.id); %>" class="redbold">http://www.luckprize.com/<br>Register.aspx?ind=<% Response.Write(userTO.id); %></a>
            </h3>
        </div>
    </div>

</div>

<!-- #include file="footer.aspx" -->
