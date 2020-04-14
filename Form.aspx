<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form.aspx.cs" Inherits="LuckPrize.Form" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="LuckPrize" Namespace="LuckPrize.Validators" TagPrefix="custom" %>

<!-- #include file="header.aspx" -->

<div style="width:800px">

    <div style="padding:16px; text-align:left; width:768px; height:770px; background-image:url('img/pattern_01.jpg');">

        
        <br><h2>Assistência ao Cliente</h2><br /><br /><br /> <br /> 

        <b>
        Utilize o e-mail: <img src="img/email.jpg" border="0" /> ou preencha o formulário abaixo para entrar em contato conosco!
        <br /><br /><br /><br />

        <center>
         <asp:Label runat="server" id="lbl_Message" style="color:#FF0000; font-size:18px" />  <br /> <br /> <br /> 
        <form id="contact" name="contact" method="post" action="Form.aspx" runat="server" defaultfocus="name">
            <asp:ToolkitScriptManager id="toolkit1" runat="server">
                <Services>
                    <asp:ServiceReference Path="~/WebServices/DataServices.asmx" />
                </Services>
            </asp:ToolkitScriptManager>
            
           
            <div style="float:left; width:360px; height:60px;">
                <p class="admmnuhead">Seu nome:</p>
                <asp:TextBox ID="name" NAME="name" MAXLENGTH="50" SIZE="30" runat="server"/><br />
                <asp:RequiredFieldValidator ID="req_Name" ControlToValidate="name" Text="(Obrigatório)" Display="Dynamic" Runat="Server" />
            </div>

            <div style="float:left; width:360px; height:60px;">
                <p class="admmnuhead">Seu e-mail:</p>
                <asp:TextBox ID="email" NAME="email" MAXLENGTH="50" SIZE="30" runat="server"/><br />
                <asp:RegularExpressionValidator ID="val_email" runat="server" Display="Dynamic" ErrorMessage="Email inválido." ControlToValidate="email" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$" />
                <asp:RequiredFieldValidator ID="req_email" ControlToValidate="email" Text="(Obrigatório)" Display="Dynamic" Runat="Server" />
            </div>

            <br /><br /><br />

            <div style="width:720px; height:60px;">
                <p class="admmnuhead">Assunto:</p>
                <asp:TextBox ID="topico" NAME="topico" MAXLENGTH="80" SIZE="60" runat="server"/><br />
                <asp:RequiredFieldValidator ID="req_topico" ControlToValidate="topico" Text="(Obrigatório)" Display="Dynamic" Runat="Server" />
            </div>
            
            <br /><br /><br />

            <div style="width:720px; height:300px;">
                <p class="admmnuhead">Mensagem:</p>
                <asp:TextBox ID="message" NAME="message" READONLY="false" TEXTMODE="MultiLine" MAXLENGTH="2048" HEIGHT="250px" WIDTH="600px" runat="server"/><br />
                <asp:CustomValidator ID="custom_ValMessage" OnServerValidate="Server_ValidateMessage" ControlToValidate="message" Display="Dynamic" runat="server" ErrorMessage="" />
                <asp:RequiredFieldValidator ID="req_Message" ControlToValidate="message" Text="(Obrigatório)" Display="Dynamic" Runat="Server" />
                <br />
                
            </div>

            <br />
            <asp:Button ID="btnSubmit" runat="server" Text="Enviar" OnClick="btnSubmit_Click" />

        </form>

        </center>
        <br /><br />

    </div>

</div>

<!-- #include file="footer.aspx" -->
