<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<jsp:useBean id="user" class="user.UserData" scope="session"/>
<jsp:setProperty name="user" property="*"/>  

  <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/2002/REC-xhtml1-20020801/DTD/xhtml1-transitional.dtd"> -->
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/2002/REC-xhtml1-20020801/DTD/xhtml1-strict.dtd"> -->
<!-- <!doctype html public "-//W3C//DTD HTML 4.01//EN"> -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="generator" content="HTML Tidy for Linux (vers 1 September 2005), see www.w3.org" />
<title>HRMS: Logout</title>
<link rel="stylesheet" type="text/css" media="screen" href="style.css" />
<style type="text/css">
/*<![CDATA[*/
 span.c1 {color:#000;}
/*]]>*/
</style>
</head>
<body>
<div id="container">
<div id="header">
<div id="userbox">

</div>
<h1><strong>Human Resource Management System<span class="c1">.</span></strong></h1>

</div>
<div id="sidebar">
<div>
<h3 title="Sidebar">Features</h3>
</div>

</div>
<div id="content">
<h2>You have been succesfully logged out and will be redirected to the home page.
</h2>
<div></div><div></div><div></div><div></div><div></div><div></div><div></div>
<%
	user.setPassword(null);
	user.setUsername(null);
	response.setHeader("Refresh", "5; URL=style_index_hrms.jsp");
%>

</div>
</table>
    



<div id="footer">
Copyright &#169 2012 Samir Tahir. All Rights Reserved.

</div>
</body>
</html>


