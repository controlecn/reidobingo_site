<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Newsletters.aspx.cs" Inherits="LuckPrize.Newsletters" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="LuckPrize" Namespace="LuckPrize.Validators" TagPrefix="custom" %>

<!-- #include file="header.aspx" -->

<div style="width:800px">

    <div style="padding:16px; text-align:left; width:768px; height:770px; background-image:url('img/pattern_01.jpg');">

        
        <br><h2>Envio de Newsletter</h2><br /><br /><br /> <br /> 

        <center>
         <asp:Label runat="server" id="lbl_Message" style="color:#FF0000; font-size:18px" />  <br /> <br /> <br /> 
        <form id="news" name="news" method="post" action="Newsletters.aspx" runat="server" defaultfocus="topico">
            <asp:ToolkitScriptManager id="toolkit1" runat="server">
                <Services>
                    <asp:ServiceReference Path="~/WebServices/DataServices.asmx" />
                </Services>
            </asp:ToolkitScriptManager>

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

            <asp:CheckBox ID="via_email" NAME="via_email" checked="true" runat="server" />Enviar por e-mail
            <br />
            <asp:CheckBox ID="via_site" NAME="via_site" checked="true" runat="server" />Enviar pelo site

            <br />
            <asp:Button ID="btnSubmit" runat="server" Text="Enviar" OnClick="btnSubmit_Click" />

        </form>

        </center>
        <br /><br />

    </div>

</div>

<!-- #include file="footer.aspx" -->
