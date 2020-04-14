<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Banks.aspx.cs" Inherits="LuckPrize.Banks" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="LuckPrize" Namespace="LuckPrize.Validators" TagPrefix="custom" %>

<!-- #include file="header.aspx" -->

<script language="javascript" type="text/javascript">
</script>

<div style="width:800px">

    <div style="padding:16px; text-align:left; float:left; width:768px; height:780px; background-image:url('img/pattern_01.jpg');">

        <br><h2>Cadastro Bancos</h2><br /><br />

            <form id="banks" action="Banks.aspx" method="post" runat="server">
                <asp:ToolkitScriptManager id="toolkit1" runat="server">
                    <Services>
                        <asp:ServiceReference Path="~/WebServices/DataServices.asmx" />
                    </Services>
                </asp:ToolkitScriptManager>
                <asp:HiddenField id="update_id" runat="server"></asp:HiddenField>
                <div style="width:750px; position:relative; left:5px; background-color:#CCDCDC">
                    <span class="msgheader2">
                    <asp:Label id="header" runat="server"></asp:Label>
                    </span>
                </div>
                <div style="width:750px; position:relative; left:5px; background-color:#E0E0FF">
                    <asp:GridView id="grid" name="grid" runat="server">
                        <PagerStyle CssClass="gridPager" />
                    </asp:GridView>
                </div>

                <br /><br />

                <span class="register">Nome:</span>
                <asp:TextBox ID="name" MAXLENGTH="50" SIZE="40" runat="server"/>
                <br />

                <span class="register">Agência:</span>
                <asp:TextBox ID="agency" MAXLENGTH="15" SIZE="16" runat="server"/>
                <br />

                <span class="register">Conta:</span>
                <asp:TextBox ID="account" MAXLENGTH="20" SIZE="21" runat="server"/>
                <br />

                <span class="register">CPF:</span>
                <asp:TextBox ID="cpf" MAXLENGTH="14" SIZE="15" runat="server"/>
                <br />

                <span class="register">Titular:</span>
                <asp:TextBox ID="titular" MAXLENGTH="50" SIZE="40" runat="server"/>
                <br />

                <span class="register">Tipo:</span>
                <asp:DropDownList ID="acctype" NAME="acctype" runat="server">
                <asp:ListItem Text="Corrente" Value="C" />
                <asp:ListItem Text="Poupança" Value="P" />
                </asp:DropDownList>
                <br />

                <center>
                <asp:Button ID="btnSubmit" runat="server" Text="Atualizar" OnClick="btnSubmit_Click" />
                <input type="button" value="Cancelar" onclick="location.href='LuckAdmin.aspx'">
                </center>

            </form>

        <br /><br />

    </div>

</div>

<!-- #include file="footer.aspx" -->
