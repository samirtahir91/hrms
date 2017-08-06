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
        
<title>HRMS: Employee Details</title>
    
</head>

    <body>

        <table width="1030" border="0">
<tr>
<td colspan="2" style="background-color:#333385;">
    
<h1 align="center" style="font-family:arial;color:white;font-size:20px;">Human Resource Management System</h1>

</td>

</tr>


<tr valign="top">

<td style="background-color:#FFFF66;width:120px;text-align:top;">
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

<p align="center"><b>Employee details report</b><br>&nbsp;</p>


<table border="1" borderColor="#ffe9bf" cellPadding="0" cellSpacing="0" width="800" height="63">
<tbody>
<td bgColor="#008080" width="47" align="center" height="19"><font color="#ffffff"><b>Employee ID</b></font></td>
<td bgColor="#008080" width="107" height="19"><font color="#ffffff"><b>First Name</b></font></td>
<td bgColor="#008080" width="224" height="19"><font color="#ffffff"><b>Last Name</b></font></td>
<td bgColor="#008080" width="270" height="19"><font color="#ffffff"><b>Email</b></font></td>
<td bgColor="#008080" width="270" height="19"><font color="#ffffff"><b>Qualification</b></font></td>
<td bgColor="#008080" width="270" height="19"><font color="#ffffff"><b>DOB</b></font></td>
<td bgColor="#008080" width="270" height="19"><font color="#ffffff"><b>Age</b></font></td>
<td bgColor="#008080" width="270" height="19"><font color="#ffffff"><b>Sex</b></font></td>
<td bgColor="#008080" width="270" height="19"><font color="#ffffff"><b>Insurance</b></font></td>
<td bgColor="#008080" width="270" height="19"><font color="#ffffff"><b>Travel Method</b></font></td>
<td bgColor="#008080" width="270" height="19"><font color="#ffffff"><b>Salary (&#163;)</b></font></td>
<td bgColor="#008080" width="270" height="19"><font color="#ffffff"><b>Tax (%)</b></font></td>
<td bgColor="#008080" width="270" height="19"><font color="#ffffff"><b>Telephone</b></font></td>
<td bgColor="#008080" width="270" height="19"><font color="#ffffff"><b>Address</b></font></td>
<td bgColor="#008080" width="270" height="19"><font color="#ffffff"><b>Post code</b></font></td>

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
rst=stmt.executeQuery("select * from employee where username='"+user_id+"'");
while(rst.next()){

%>
<tr>
<td bgColor="#ffcc68" vAlign="top" width="47" align="center" height="19"><%=rst.getString(1)%>.</td>
<td bgColor="#ffcc68" vAlign="top" width="107" height="19"><%=rst.getString(4)%></td>
<td bgColor="#ffcc68" vAlign="top" width="224" height="19"><%=rst.getString(5)%></td>
<td bgColor="#ffcc68" vAlign="top" width="270" height="19"><%=rst.getString(6)%></td>
<td bgColor="#ffcc68" vAlign="top" width="270" height="19"><%=rst.getString(7)%></td>
<td bgColor="#ffcc68" vAlign="top" width="270" height="19"><%=rst.getString(8)%></td>
<td bgColor="#ffcc68" vAlign="top" width="270" height="19"><%=rst.getString(9)%></td>
<td bgColor="#ffcc68" vAlign="top" width="270" height="19"><%=rst.getString(10)%></td>
<td bgColor="#ffcc68" vAlign="top" width="270" height="19"><%=rst.getString(11)%></td>
<td bgColor="#ffcc68" vAlign="top" width="270" height="19"><%=rst.getString(12)%></td>
<td bgColor="#ffcc68" vAlign="top" width="270" height="19"><%=rst.getString(13)%></td>
<td bgColor="#ffcc68" vAlign="top" width="270" height="19"><%=rst.getString(14)%></td>
<td bgColor="#ffcc68" vAlign="top" width="270" height="19"><%=rst.getString(16)%></td>
<td bgColor="#ffcc68" vAlign="top" width="270" height="19"><%=rst.getString(17)%></td>
<td bgColor="#ffcc68" vAlign="top" width="270" height="19"><%=rst.getString(18)%></td>
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
