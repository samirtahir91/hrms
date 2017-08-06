<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="user" class="user.UserData" scope="session"/>

<%-- 
    Document   : index
    Created on : 29-Jan-2012, 19:14:08
    Author     : Samir
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
<title>HRMS: Logout</title>
    
</head>

    <body>

        <table width="1024" border="0">
<tr>
<td colspan="2" style="background-color:#333385;">
    
<h1 align="center" style="font-family:arial;color:white;font-size:20px;">Human Resource Management System</h1>

</td>

</tr>


<tr valign="top">

<td style="background-color:#FFFF66;width:100px;text-align:top;">
<b><big></big></b><br />

</td>
<td style="background-color:#eeeeee;height:368px;width:400px;text-align:top;">
You have been succesfully logged out and will be redirected to the home page.
</td>

</tr>



<%
	user.setPassword(null);
	user.setUsername(null);
	response.setHeader("Refresh", "5; URL=index_hrms.jsp");
%>

<tr>
<td colspan="2" style="background-color:#E6E6F0;text-align:center;">
Copyright &#169; 2012 Samir Tahir</td>
</tr>

</table>
    
   </body>

</html>
