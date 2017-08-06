<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page language="java" import="java.io.*" %> 
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
<title>HRMS: Job search</title>
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
<li><a href="http://localhost:8080/admin_job_hrms.jsp" title="Report" >Report</a></li>
<li><a href="http://localhost:8080/admin_job_srch_hrms.jsp" title="Search"class="on">Search</a></li>
<li><a href="http://localhost:8080/emp_add_job_hrms.jsp" title="Add" >Add</a></li>
<li><a href="http://localhost:8080/emp_del_job_hrms.jsp" title="Delete">Delete</a></li>
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
<h2>Job search</h2>
<p>Select the job to view employees that posses it.</p>
<div>
</div>

<form>
<table>
<tr>
<td>Job:</td>
<td><select name= jname>
<option value="" >Select job...</option>

<div>
</div>

<%
Class.forName("com.mysql.jdbc.Driver").newInstance();
String url="jdbc:mysql://localhost:3306/hr_data";
Connection con1=null;
Connection con=null;
ResultSet rst1=null;
ResultSet rst=null;
Statement stmt1=null;
Statement stmt=null;
String user_id = user.getUsername();
session.putValue("user_id",user_id);


try{

con1=DriverManager.getConnection(url, "tahirs2", "samir");
stmt1=con1.createStatement();
rst1=stmt1.executeQuery("select employee.user_type from employee where username='"+user_id+"'");
if(rst1.next()){
if(rst1.getString(1).equals("admin")){

	try{

	Connection conn = DriverManager.getConnection(url, "tahirs2", "samir");
	Statement st=conn.createStatement();
	ResultSet rs=st.executeQuery("Select * from job");
	String u2name="";
	String u2id="";
	while(rs.next()){
	u2id=rs.getString("job_id");
	u2name=rs.getString("job_name");
%>

<option value="<%=u2id%>"><%=u2name%></option>

<%
	}
	rs.close();
	st.close();
	conn.close();
%>

</select></td>
<td><input type="submit" value="Submit" /></td>
</tr>
</tbody>
</table>
</form>

<%		


		try{	

		
		String new_id = request.getParameter("jname");
		
		con = DriverManager.getConnection(url, "tahirs2", "samir");
		stmt=con.createStatement();
		rst=stmt.executeQuery("select * from employee join employee_has_job on (employee_id = employee_has_job.employee_employee_id) where employee_has_job.job_job_id='"+new_id+"'");
		
		if(!new_id.equals("")){
%>
<table border="1" borderColor="#ffe9bf" cellPadding="0" cellSpacing="0" width="800" height="63">
<tbody>
<td bgColor="#006699" width="47" align="center" height="19"><font color="#ffffff"><b>Employee ID</b></font></td>
<td bgColor="#006699" width="107" height="19"><font color="#ffffff"><b>First Name</b></font></td>
<td bgColor="#006699" width="224" height="19"><font color="#ffffff"><b>Last Name</b></font></td>
<td bgColor="#006699" width="270" height="19"><font color="#ffffff"><b>Email</b></font></td>
<td bgColor="#006699" width="270" height="19"><font color="#ffffff"><b>Qualification</b></font></td>
<td bgColor="#006699" width="270" height="19"><font color="#ffffff"><b>DOB</b></font></td>
<td bgColor="#006699" width="270" height="19"><font color="#ffffff"><b>Age</b></font></td>
<td bgColor="#006699" width="270" height="19"><font color="#ffffff"><b>Sex</b></font></td>
<td bgColor="#006699" width="270" height="19"><font color="#ffffff"><b>Insurance</b></font></td>
<td bgColor="#006699" width="270" height="19"><font color="#ffffff"><b>Travel Method</b></font></td>
<td bgColor="#006699" width="270" height="19"><font color="#ffffff"><b>Salary (&#163;)</b></font></td>
<td bgColor="#006699" width="270" height="19"><font color="#ffffff"><b>Tax (%)</b></font></td>
<td bgColor="#006699" width="270" height="19"><font color="#ffffff"><b>Telephone</b></font></td>
<td bgColor="#006699" width="270" height="19"><font color="#ffffff"><b>Address</b></font></td>
<td bgColor="#006699" width="270" height="19"><font color="#ffffff"><b>Post code</b></font></td>
<%

while(rst.next()){

%>

<tr>
<td bgColor="#CCFF99" vAlign="top" width="47" align="center" height="19"><%=rst.getString(1)%>.</td>
<td bgColor="#CCFF99" vAlign="top" width="107" height="19"><%=rst.getString(4)%></td>
<td bgColor="#CCFF99" vAlign="top" width="224" height="19"><%=rst.getString(5)%></td>
<td bgColor="#CCFF99" vAlign="top" width="270" height="19"><%=rst.getString(6)%></td>
<td bgColor="#CCFF99" vAlign="top" width="270" height="19"><%=rst.getString(7)%></td>
<td bgColor="#CCFF99" vAlign="top" width="270" height="19"><%=rst.getString(8)%></td>
<td bgColor="#CCFF99" vAlign="top" width="270" height="19"><%=rst.getString(9)%></td>
<td bgColor="#CCFF99" vAlign="top" width="270" height="19"><%=rst.getString(10)%></td>
<td bgColor="#CCFF99" vAlign="top" width="270" height="19"><%=rst.getString(11)%></td>
<td bgColor="#CCFF99" vAlign="top" width="270" height="19"><%=rst.getString(12)%></td>
<td bgColor="#CCFF99" vAlign="top" width="270" height="19"><%=rst.getString(13)%></td>
<td bgColor="#CCFF99" vAlign="top" width="270" height="19"><%=rst.getString(14)%></td>
<td bgColor="#CCFF99" vAlign="top" width="270" height="19"><%=rst.getString(16)%></td>
<td bgColor="#CCFF99" vAlign="top" width="270" height="19"><%=rst.getString(17)%></td>
<td bgColor="#CCFF99" vAlign="top" width="270" height="19"><%=rst.getString(18)%></td>
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
	<td bgColor="#A52A2A" width="100" align="center" height="19"><font color="#ffffff"><b>No job selected.</b></font></td>
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

}catch(Exception e){
System.out.println(e.getMessage());
}

}else {

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

}
else {
%>

	</tbody>
	</table>       	
	<table border="1" borderColor="#ffe9bf" cellPadding="0" cellSpacing="0" width="800" height="63">
	<tbody>
	<td bgColor="#A52A2A" width="100" align="center" height="19"><font color="#ffffff"><b>Invalid user provileges, please login as administrator</b></font></td>
	</tbody>    	
	</table>
<%
}



rst1.close();
stmt1.close();
con1.close();

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


