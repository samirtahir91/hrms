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
<title>HRMS: Appraisal Report</title>
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

<ul id="nav">
<li><a href="http://localhost:8080/admin_appraisal_hrms.jsp" title="Report" class="on">Report</a></li>
<li><a href="http://localhost:8080/emp_add_appr_hrms.jsp" title="Add" >Add</a></li>
<li><a href="http://localhost:8080/emp_add_appr_review_hrms.jsp" title="Review">Review</a></li>
<li><a href="http://localhost:8080/emp_del_appr_hrms.jsp" title="Delete">Delete</a></li>
</ul>

</div>
<div id="sidebar">
<div>
<h3 title="Sidebar">Reports</h3>
<ul>
<li><a href="http://localhost:8080/admin_details_hrms.jsp">
Employee details report</a></li>

<li><a href="http://localhost:8080/admin_training_hrms.jsp">
Training report<a /></li>

<li><a href="http://localhost:8080/admin_skill_hrms.jsp">
Skill report<a /></li>

<li><a href="http://localhost:8080/admin_proj_hrms.jsp">
Project report<a /></li>

<li><a href="http://localhost:8080/admin_job_hrms.jsp">
Job report<a /></li>
<li><a href="http://localhost:8080/admin_dep_hrms.jsp">
Placement report</a></li>
<li><a href="http://localhost:8080/admin_leave_hrms.jsp">
Leave report</a></li>
<li><a href="http://localhost:8080/admin_appraisal_hrms.jsp">
Appraisal report</a></li>
</ul>

<h3 title="Lorem Ipsum">Admin</h3>
<ul>
<li><a href="http://localhost:8080/admin_add_hrms.jsp">Account tools</a></li>
<li><a href="http://localhost:8080/admin_train_tool_hrms.jsp">
Training tools</a></li>
<li><a href="http://localhost:8080/admin_skill_tool_hrms.jsp">
Skill tools</a></li>
<li><a href="http://localhost:8080/admin_proj_tool_hrms.jsp">
Project tools</a></li>
<li><a href="http://localhost:8080/admin_job_tool_hrms.jsp">
Job tools</a></li>
<li><a href="http://localhost:8080/admin_dep_tool_hrms.jsp">Location tools</a></li>
<li><a href="http://localhost:8080/admin_dep1_tool_hrms.jsp">Department</a></li>
<li><a href="http://localhost:8080/admin_leave_tool_hrms.jsp">
Leave tools</a></li>
<li><a href="http://localhost:8080/style_logout_hrms.jsp">
Logout</a></li>
</ul>

</div>
</div>

<div id="content">
<h2>Appraisal report</h2>
<p>Enter an employee's username for a report.</p>
<div>
</div>

<form>
<table>
<td>Username:</td>
<td><input type="text" size= "15" name="username" /></td>
<td><input type="submit" value="Submit" /></td>
</table>
</form>

<div>
</div>

<%
String DRIVER = "org.gjt.mm.mysql.Driver";
Class.forName(DRIVER).newInstance();

Connection con=null;
Connection con1=null;
ResultSet rst=null;
ResultSet rst1=null;
Statement stmt=null;
Statement stmt1=null;

String url="jdbc:mysql://localhost:3306/hr_data";
String user_id = user.getUsername();
session.putValue("user_id",user_id);
String userid=request.getParameter("username");
session.putValue("userid",userid);

try{

con1=DriverManager.getConnection(url, "tahirs2", "samir");
stmt1=con1.createStatement();
rst1=stmt1.executeQuery("select employee.user_type from employee where username='"+user_id+"'");
if(rst1.next()){
if(rst1.getString(1).equals("admin")){
user.setPassword("admin");
}}
else {
user.setPassword("user");
}

rst1.close();
stmt1.close();
con1.close();
}catch(Exception e){
System.out.println(e.getMessage());
}

try{
if(user.getPassword().equals("admin")){
con=DriverManager.getConnection(url, "tahirs2", "samir");
stmt=con.createStatement();
rst=stmt.executeQuery("select employee_has_appraisal.target, employee_has_appraisal.set_date, employee_has_appraisal.review from employee_has_appraisal where employee_has_appraisal.employee_username='"+userid+"'");

if(!userid.equals("")){

%>

<table border="1" borderColor="#ffe9bf" cellPadding="0" cellSpacing="0" width="800" height="63">
<tbody>
<td bgColor="#006699" width="100" align="center" height="19"><font color="#ffffff"><b>Target</b></font></td>
<td bgColor="#006699" width="47" height="19"><font color="#ffffff"><b>Start date</b></font></td>
<td bgColor="#006699" width="270" height="19"><font color="#ffffff"><b>Review</b></font></td>

<%

while(rst.next()){

%>
<tr>
<td bgColor="#CCFF99" vAlign="top" width="100" align="center" height="19"><%=rst.getString(1)%>.</td>
<td bgColor="#CCFF99" vAlign="top" width="47" height="19"><%=rst.getString(2)%></td>
<td bgColor="#CCFF99" vAlign="top" width="270" height="19"><%=rst.getString(3)%></td>
</tr>
<% 

}

}
else {
%>
	</tbody>
    	</table>
       	<table border="1" borderColor="#ffe9bf" cellPadding="0" cellSpacing="0" width="800" height="63">
	<tbody>
	<td bgColor="#A52A2A" width="100" align="center" height="19"><font color="#ffffff"><b>No username entered.</b></font></td>
	</tbody>    	
	</table>
<%
}

}
else
{
%>
	</tbody>
	</table>
       	<table border="1" borderColor="#ffe9bf" cellPadding="0" cellSpacing="0" width="800" height="63">
	<tbody>
	<td bgColor="#A52A2A" width="100" align="center" height="19"><font color="#ffffff"><b>Invalid user privileges, please login as administrator</b></font></td>
	</tbody>    	
	</table>
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

</div>

<div id="footer">
Copyright &#169 2012 Samir Tahir. All Rights Reserved.

</div>
</body>
</html>


