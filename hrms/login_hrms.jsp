<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<jsp:useBean id="user" class="user.UserData" scope="session"/>
<jsp:setProperty name="user" property="*"/>


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
        
<title>HRMS: Account Login</title>
    
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

<p align="center"><b>Login</b><br>&nbsp;</p>

<%
String userid=request.getParameter("username");
session.putValue("userid",userid);
String pwd=request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hr_data", "tahirs2", "samir");
Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select * from employee where username='"+userid+"'"); 
if(rs.next())
{
	  if(rs.getString(3).equals(pwd))
	{
		out.println("Welcome "+rs.getString(4));
		out.println(". You will be redirected to your details page shortly, once there you may use the links on the left panel to view HR information");
		response.setHeader("Refresh", "7; URL=details_hrms.jsp");

	}
	else
	{
	user.setPassword(null);
	user.setUsername(null);
	out.println("Invalid password try again");
	    	

	}
}
else
{
	user.setPassword(null);
	user.setUsername(null);
	out.println("Invalid username try again");
	    	
}


%>
<p<a href="index_hrms.jsp">
Back<a /></p>

</td>
</tr>

<tr>
<td colspan="2" style="background-color:#E6E6F0;text-align:center;">
Copyright 	&#169; 2012 Samir Tahir</td>
</tr>

</table>
    
</body>

</html>
