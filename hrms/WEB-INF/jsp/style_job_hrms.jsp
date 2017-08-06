<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="user" class="user.UserData" scope="session"/>   
  <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/2002/REC-xhtml1-20020801/DTD/xhtml1-transitional.dtd"> -->
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/2002/REC-xhtml1-20020801/DTD/xhtml1-strict.dtd"> -->
<!-- <!doctype html public "-//W3C//DTD HTML 4.01//EN"> -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="generator" content="HTML Tidy for Linux (vers 1 September 2005), see www.w3.org" />
<title>HRMS: Job Report</title>
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
<ul>
<li><a href="http://localhost:8080/style_details_hrms.jsp">
Employee details report</a></li>

<li><a href="http://localhost:8080/style_training_hrms.jsp">
Training report<a /></li>

<li><a href="http://localhost:8080/style_skill_hrms.jsp">
Skill report<a /></li>

<li><a href="http://localhost:8080/style_proj_hrms.jsp">
Project report<a /></li>

<li><a href="http://localhost:8080/style_job_hrms.jsp">
Job report<a /></li>
<li><a href="http://localhost:8080/style_dep_hrms.jsp">
Placement report</a></li>
<li><a href="http://localhost:8080/style_leave_hrms.jsp">
Leave report</a></li>
<li><a href="http://localhost:8080/style_appraisal_hrms.jsp">
Appraisal report</a></li>
<li><a href="http://localhost:8080/style_logout_hrms.jsp">
Logout<a/></li>

</ul>
</div>

</div>
<div id="content">
<h2>Jobs report</h2>
<table border="1" borderColor="#ffe9bf" cellPadding="0" cellSpacing="0" width="800" height="63">
<tbody>
<td bgColor="#006699" width="47" align="center" height="19"><font color="#ffffff"><b>Job</b></font></td>
<td bgColor="#006699" width="270" height="19"><font color="#ffffff"><b>Min salary (&#163;)</b></font></td>
<td bgColor="#006699" width="270" height="19"><font color="#ffffff"><b>Max salary (&#163;)</b></font></td>
<td bgColor="#006699" width="270" height="19"><font color="#ffffff"><b>Start date</b></font></td>
<td bgColor="#006699" width="270" height="19"><font color="#ffffff"><b>End date</b></font></td>


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
rst=stmt.executeQuery("select job.job_name, min_salary, max_salary, employee_has_job.start_date, end_date from job join employee_has_job on (job.job_id = employee_has_job.job_job_id) where employee_has_job.employee_username='"+user_id+"'");
while(rst.next()){

%>
<tr>
<td bgColor="#CCFF99" vAlign="top" width="47" align="center" height="19"><%=rst.getString(1)%>.</td>
<td bgColor="#CCFF99" vAlign="top" width="107" height="19"><%=rst.getString(2)%></td>
<td bgColor="#CCFF99" vAlign="top" width="224" height="19"><%=rst.getString(3)%></td>
<td bgColor="#CCFF99" vAlign="top" width="270" height="19"><%=rst.getString(4)%></td>
<td bgColor="#CCFF99" vAlign="top" width="270" height="19"><%=rst.getString(5)%></td>
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
</table>
    



<div id="footer">
Copyright &#169 2012 Samir Tahir. All Rights Reserved.

</div>
</body>
</html>


