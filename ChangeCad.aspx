<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangeCad.aspx.cs" Inherits="LuckPrize.ChangeCad" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="LuckPrize" Namespace="LuckPrize.Validators" TagPrefix="custom" %>

<!-- #include file="header.aspx" -->

<script language="javascript" type="text/javascript">
    String.prototype.trim = function() {
	    return this.replace(/^\s+|\s+$/g,"");
    }
    function SelectImage(src) {
        var ctrl = document.getElementById('<%= avatar.ClientID %>');
        ctrl.value = src;
    }
</script>

<div style="width:800px">

    <div style="padding:16px; text-align:left; float:left; width:471px; height:690px; background-image:url('img/pattern_01.jpg');">
        
        <br><h2>Alteração de Cadastro</h2><br /><br /><br /><br />

        <div style="width:500px; height:690px; background:transparent; overflow:auto;">

            <form id="regform" method="post" action="ChangeCad.aspx" runat="server" defaultfocus="oldpass">
                <asp:ToolkitScriptManager id="toolkit1" runat="server">
                    <Services>
                        <asp:ServiceReference Path="~/WebServices/DataServices.asmx" />
                    </Services>
                </asp:ToolkitScriptManager>

                <span class="register">Nome:</span>&nbsp;&nbsp;
                <asp:Label id="name" class="redbold" runat="server"></asp:Label>
                <br />

                <span class="register">Login:</span>&nbsp;&nbsp;
                <asp:Label id="nick" class="redbold" runat="server"></asp:Label>
                <br />

                <span class="register">Senha Atual:</span>
                <asp:TextBox ID="oldpass" NAME="oldpass" MAXLENGTH="16" SIZE="16" TEXTMODE="password" runat="server"/>
                <asp:CustomValidator ID="custom_ValPass" OnServerValidate="Server_ValidatePass" ControlToValidate="oldpass" Display="Dynamic" runat="server" ErrorMessage="" />
                <asp:RegularExpressionValidator ID="val_oldpass" runat="server" ErrorMessage="Senha curta" ControlToValidate="oldpass" Display="Dynamic" ValidationExpression=".{6,16}" />
                <asp:RequiredFieldValidator ID="req_oldpass" ControlToValidate="oldpass" Text="(Obrigatório)" Display="Dynamic" Runat="Server" />
                <asp:Label runat="server" id="lbl_OldPass" style="color:#FF0000" />
                <br />

                <span class="register">Nova Senha:</span>
                <asp:TextBox ID="pass1" NAME="pass1" MAXLENGTH="16" SIZE="16" TEXTMODE="password" runat="server"/> mínimo 6 caracteres 
                <asp:RegularExpressionValidator ID="val_pass1" runat="server" ErrorMessage="Senha curta" ControlToValidate="pass1" Display="Dynamic" ValidationExpression=".{6,16}" />
                <br />

                <span class="register">Confirmação:</span>
                <asp:TextBox ID="pass2" NAME="pass2" MAXLENGTH="16" SIZE="16" TEXTMODE="password" runat="server"/> 
                <asp:CompareValidator ID="comp_pass1_pass2" ControlToValidate="pass1" ControlToCompare="pass2" Type="String" Operator="Equal" Text="(Senhas Diferentes)" Display="Dynamic" Runat = "Server" />
                <br />

                <span class="register">E-mail:</span>&nbsp;&nbsp;
                <asp:Label id="email" class="redbold" runat="server"></asp:Label>
                <br />

                <span class="register">Nascimento:</span>
                <asp:TextBox ID="birthday" NAME="birthday" MAXLENGTH="10" SIZE="10" runat="server" /> dd/mm/aaaa 
                <asp:MaskedEditExtender ID="msk_birthday" Enabled="true" TargetControlID="birthday" Mask="99/99/9999" MaskType="Date" CultureName="pt-BR" runat="server" />
                <asp:MaskedEditValidator ID="mskv_birthday" runat="server" Display="Dynamic" ControlExtender="msk_birthday" ControlToValidate="birthday" EmptyValueMessage="(Obrigatório)" InvalidValueMessage="(Data inválida)" IsValidEmpty="False"></asp:MaskedEditValidator>
                <br />

                <span class="register">Gênero:</span>
                <asp:DropDownList ID="gender" NAME="gender" runat="server">
                <asp:ListItem Text="Selecione" Value="0" />
                <asp:ListItem Text="Masculino" Value="1" />
                <asp:ListItem Text="Feminino" Value="2" />
                </asp:DropDownList>
                <asp:RangeValidator ID="valGender" ControlToValidate="gender" MinimumValue="1" MaximumValue="2" ErrorMessage="(Obrigatório)" runat="server" />
                <br />

<!--
                <span class="register">Imagem</span> <asp:TextBox ReadOnly="true" enabled=true size=32 id="avatar" runat="server" />
                <div id="images" style="position:relative; border-style:inset; border-width:1px; left:101px; width:340px; height:120px; overflow:auto;" runat="server">
                </div>
                <br />
-->

                <span class="register"></span>
                <asp:CheckBox ID="newsletters" NAME="newsletters" checked="true" runat="server" />Quero receber informativos ( Bônus, Promoções Etc... )
                <br />

                <span class="register"></span>
                <asp:Button ID="btnSubmit" runat="server" Text="Confirmar Cadastro" OnClick="btnSubmit_Click" />
            </form>
        </div>
    </div>
    <div style="padding:16px; float:left; text-align:left; width:265px; height:690px; background-image:url('img/pattern_01.jpg');">
        <h2>Por quê LuckPrize?</h2>
        <ul>
        <li>Jogue instantâneo - Sem download.</li>
        <li>Fácil de comprar - Fácil de receber.</li>
        <li>Pagamentos de prêmios super rápido.</li>
        <li>Satisfação do cliente é a nossa prioridade.</li>
        <li>Suporte 24 horas por dia.</li>
        <li>Nossos jogos são testados por um laboratório independente.</li>
        <li>Gerador de Números Aleatórios (RNG).</li>
        <li>Experiência e qualidade em jogos online.</li>
        <li>Licenciado e regulamentado pelo Governo de Gibraltar.</li>
        <li>Site 100% Seguro.</li>
        </ul>
    </div>

</div>

<!-- #include file="footer.aspx" -->
