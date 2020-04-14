<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bingo.aspx.cs" Inherits="LuckPrize.Bingo1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
    <head runat="server">
        <title>LuckPrize BINGO</title>
        <style type="text/css">body { margin:0px 0px 0px 0px; padding:0px 0px 0px 0px; overflow: hidden; }</style>
        <script language="javascript" type="text/javascript">
            function Unload() {
                LuckPrize.DataServices.Bingo_Leave('<% Response.Write(Session.SessionID); %>', UnloadResult);
            }
            function UnloadResult(result) {
            }
        </script>
    </head>
    <body bgcolor="#000000" onunload="Unload()">
            <form id="frmbingo" runat="server">
                <asp:ToolkitScriptManager id="toolkit1" runat="server">
                    <Services>
                        <asp:ServiceReference Path="~/WebServices/DataServices.asmx" />
                    </Services>
                </asp:ToolkitScriptManager>
	            <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0" width="100%" height="100%" id="Bingo" align="middle">
	            <param name="allowScriptAccess" value="sameDomain" />
	            <param name="allowFullScreen" value="true" />
	            <param name="movie" value="Bingo.swf?session=<% Response.Write(Session.SessionID); %>" />
	            <param name="quality" value="high" />
	            <param name="scale" value="exactfit" />
	            <param name="bgcolor" value="#ffffff" />
	            <param name="width" value="100%" />
	            <param name="height" value="100%" />
	            <embed src="Bingo.swf?session=<% Response.Write(Session.SessionID); %>" quality="high" scale="exactfit" bgcolor="#000000" width="100%" height="100%" name="Bingo" align="middle" allowScriptAccess="sameDomain" allowFullScreen="true" type="application/x-shockwave-flash" pluginspage="http://www.adobe.com/go/getflashplayer" />
	            </object>
            </form>
    </body>
</html>
