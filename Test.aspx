<%@ Page language="vb" %>
<!-- 
Name:		Demo: BrowserCaps update for modern browsers, http://slingfive.com/pages/code/browserCaps/
Author:	Rob Eberhardt, http://slingfive.com/
History:
	2004-11-19	updated demo (simplified code & made valid)
	2003-12-03	first published
-->


<html>
<head>
<title>BrowserCaps - Request.Browser Info</title>
<style type="text/css">
<!--
UL {
margin:0;
padding:0;
margin-left:1em;
}
-->
</style>
</head>

<body>

<h3><a href="http://slingfive.com/pages/code/browserCaps/">BrowserCaps</a> - Request.Browser Info:</h3>

<%=Request.ServerVariables("http_user_agent")%>
<hr />

<ul>
	<li>Browser = <%=Request.Browser.Browser()%>
	<li>Version = <%=Request.Browser.Version()%>
	<li>MajorVersion = <%=Request.Browser.MajorVersion()%>
	<li>MinorVersion = <%=Request.Browser.MinorVersion()%>
	<li>Platform = <%=Request.Browser.Platform()%>
	<li>EcmaScriptVersion = <%=Request.Browser.EcmaScriptVersion()%>
	<li>Type = <%=Request.Browser.Type()%>
	<li>TagWriter = <%=Request.Browser.TagWriter()%>
</ul>
<hr />

<ul>
	<li>ActiveXControls = <%=Request.Browser.ActiveXControls()%>
	<li>AOL = <%=Request.Browser.AOL()%>
	<li>BackgroundSounds = <%=Request.Browser.BackgroundSounds()%>
	<li>Beta = <%=Request.Browser.Beta()%>
	<li>Browser = <%=Request.Browser.Browser()%>
	<li>CDF = <%=Request.Browser.CDF()%>
	<li>ClrVersion = <%=Request.Browser.ClrVersion()%>
	<li>Cookies = <%=Request.Browser.Cookies()%>
	<li>Crawler = <%=Request.Browser.Crawler()%>
	<li>EcmaScriptVersion = <%=Request.Browser.EcmaScriptVersion()%>
	<li>Frames = <%=Request.Browser.Frames()%>
	<li>JavaApplets = <%=Request.Browser.JavaApplets()%>
	<li>JavaScript = <%=Request.Browser.JavaScript()%>
	<li>MajorVersion = <%=Request.Browser.MajorVersion()%>
	<li>MinorVersion = <%=Request.Browser.MinorVersion()%>
	<li>MSDomVersion = <%=Request.Browser.MSDomVersion()%>
	<li>Platform = <%=Request.Browser.Platform()%>
	<li>Tables = <%=Request.Browser.Tables()%>
	<li>TagWriter = <%=Request.Browser.TagWriter()%>
	<li>Type = <%=Request.Browser.Type()%>
	<li>VBScript = <%=Request.Browser.VBScript()%>
	<li>Version = <%=Request.Browser.Version()%>
	<li>W3CDomVersion = <%=Request.Browser.W3CDomVersion()%>
	<li>Win16 = <%=Request.Browser.Win16()%>
	<li>Win32 = <%=Request.Browser.Win32()%>
</ul>
<hr />


</body>
</html>
