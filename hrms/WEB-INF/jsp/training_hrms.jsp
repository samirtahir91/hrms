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
        
<title>HRMS: Training Report</title>
    
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
<b><big>Menu</big></b><br />

<a href="http://localhost:8080/details_hrms.jsp">
Employee details report</a><br />

<a href="http://localhost:8080/training_hrms.jsp">
Training report<a /><br />

<a href="http://localhost:8080/skill_hrms.jsp">
Skill report<a /><br />

<a href="http://localhost:8080/proj_hrms.jsp">
Project report<a /><br />

<a href="http://localhost:8080/job_hrms.jsp">
Job report<a /><br
 />
<a href="http://localhost:8080/dep_hrms.jsp">
Placement report</a><br />
<a href="http://localhost:8080/logout_hrms.jsp">
Logout<a/><br />

</td>
<td style="background-color:#eeeeee;height:368px;width:400px;text-align:top;">

<p align="center"><b>Training report</b><br>&nbsp;</p>

<div align="center" width="85%">
<center>
<table border="1" borderColor="#ffe9bf" cellPadding="0" cellSpacing="0" width="800" height="63">
<tbody>
<td bgColor="#008080" width="47" align="center" height="19"><font color="#ffffff"><b>Training</b></font></td>
<td bgColor="#008080" width="270" height="19"><font color="#ffffff"><b>Start date</b></font></td>
<td bgColor="#008080" width="270" height="19"><font color="#ffffff"><b>End date</b></font></td>

<%
String DRIVER = "org.gjt.mm.mysql.Driver";
Class.forName(DRIVER).newInstance();


Connection con=null;
ResultSet rst=null;
Statement stmt=null;

try{
String url="jdbc:mysql://localhost:3306/hr_data";
String user_id = user.getUsername();
session.putValue("user_id",user_id);

con=DriverManager.getConnection(url, "tahirs2", "samir");
stmt=con.createStatement();
rst=stmt.executeQuery("select  training.training_name, start_date, end_date from training join employee_has_training on (training.training_id = employee_has_training.training_training_id) where employee_has_training.employee_username='"+user_id+"'");
while(rst.next()){

%>
<tr>
<td bgColor="#CCFF99" vAlign="top" width="47" align="center" height="19"><%=rst.getString(1)%>.</td>
<td bgColor="#CCFF99" vAlign="top" width="107" height="19"><%=rst.getString(2)%></td>
<td bgColor="#CCFF99" vAlign="top" width="224" height="19"><%=rst.getString(3)%></td>
</tr>
<% 

}
rst.close();
stmt.close();
con.close();
}catch(Exception e){
System.out.println(e.getMessage());
}
%>

</tbody>
</table>
</center>
</div>
</td>
</tr>

<tr>
<td colspan="2" style="background-color:#E6E6F0;text-align:center;">
Copyright 	&#169; 2012 Samir Tahir</td>
</tr>

</table>
    
</body>

</html>
