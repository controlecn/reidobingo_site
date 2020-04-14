<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecoverPassword.aspx.cs" Inherits="LuckPrize.RecoverPassword" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="LuckPrize" Namespace="LuckPrize.Validators" TagPrefix="custom" %>

<!-- #include file="header.aspx" -->

<script language="javascript" type="text/javascript">
    function ValidateNick(source, args) {
        var ctrl = document.getElementById('<%= nick.ClientID %>');
        if (ctrl.value != null)
            args.IsValid = !LuckPrize.DataServices.NickExists(ctrl.value, ValidateNickResult);
    }
    function ValidateNickResult(result) {
        var lbl = document.getElementById('<%= nickExistsLabel.ClientID %>');
        if (result) {
            lbl.innerHTML = "";
        }
        else {
            lbl.innerHTML = "(Não Encontrado)";
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
            lbl.innerHTML = "";
        }
        else {
            lbl.innerHTML = "(Não Encontrado)";
        }
    }
</script>

<div style="width:800px">

    <div style="padding:16px; text-align:left; float:left; width:471px; height:590px; background-image:url('img/pattern_01.jpg');">
    
        <%
            if (Page.Request["res"] == null)
            {
        %>
    
            
            <br><h2>Recuperação de Senha</h2><br /><br /><br /> 
            
            <div style="width:500px; height:590px; background:transparent; overflow:auto;">

                Uma nova senha será gerada e enviada ao seu e-mail cadastrado no LuckPrize.
                <br /><br />
                Para que isso ocorra é necessário digitar o seu login e o e-mail cadastrado.
                <br /><br /><br /> <br /> 

                <form id="recform" name="recform" method="post" action="RecoverPassword.aspx" runat="server" defaultfocus="nick">
                    <asp:ToolkitScriptManager id="toolkit1" runat="server">
                        <Services>
                            <asp:ServiceReference Path="~/WebServices/DataServices.asmx" />
                        </Services>
                    </asp:ToolkitScriptManager>

                    <span class="register">Login:</span>
                    <asp:TextBox ID="nick" NAME="nick" MAXLENGTH="25" SIZE="25" runat="server"/>
                    <asp:CustomValidator ID="custom_ValNick" ClientValidationFunction="ValidateNick" OnServerValidate="Server_ValidateNick" ControlToValidate="nick" Display="Dynamic" runat="server" ErrorMessage="(Não Encontrado)" />
                    <asp:RequiredFieldValidator ID="req_nick" ControlToValidate="nick" Text="(Obrigatório)" Display="Dynamic" Runat="Server" />
                    <asp:Label runat="server" id="nickExistsLabel" style="color:#FF0000" />
                    <br />

                    <span class="register">E-mail:</span>
                    <asp:TextBox ID="email" NAME="email" MAXLENGTH="50" SIZE="30" runat="server"/>
                    <asp:RegularExpressionValidator ID="val_email" runat="server" Display="Dynamic" ErrorMessage="Email inválido." ControlToValidate="email" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$" />
                    <asp:CustomValidator ID="custom_ValEmail" ClientValidationFunction="ValidateEmail" OnServerValidate="Server_ValidateEmail" ControlToValidate="email" Display="Dynamic" runat="server" ErrorMessage="(Não Encontrado)" />
                    <asp:RequiredFieldValidator ID="req_email" ControlToValidate="email" Text="(Obrigatório)" Display="Dynamic" Runat="Server" />
                    <asp:Label runat="server" id="emailExistsLabel" style="color:#FF0000" />
                    <br />

                    <span class="register"></span>
                    <asp:Button ID="btnSubmit" runat="server" Text="Gerar Nova Senha" OnClick="btnSubmit_Click" />
                </form>
            </div>
        <%
            }
            else
            {
                if (Page.Request["res"] == "OK")
                {
        %>
                    <h2>Recuperação de Senha</h2>
                    <br /><br />
                    Uma nova senha foi gerada e enviada ao e-mail: <b><% Response.Write("<a href = mailto:" + userTO.email + ">" + userTO.email + "</a>"); %></b>.
                    <br /><br />
                    Verifique seu e-mail para obter a nova senha.<br /><br />

         <center>
        <input type="button" value="OK" onclick="location.href='default.aspx'">
        </center>
        
        <%
                }
                else
                {
        %>
                    <h2>Recuperação Falhou</h2>
                    <br /><br />
                    As informações que você forneceu não são válidas para gerar uma nova senha.<br /><br />

         <center>
        <input type="button" value="OK" onclick="location.href='RecoverPassword.aspx'">
        </center>

        <%
                }
            }
        %>
    </div>
    <div style="padding:16px; float:left; text-align:left; width:265px; height:590px; background-image:url('img/pattern_01.jpg');">
    </div>
      
    </div>

<!-- #include file="footer.aspx" -->
