<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page language="java" import="java.io.*" %> 
<jsp:useBean id="user" class="user.UserData" scope="session"/>

  <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/2002/REC-xhtml1-20020801/DTD/xhtml1-transitional.dtd"> -->
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/2002/REC-xhtml1-20020801/DTD/xhtml1-strict.dtd"> -->
<!-- <!doctype html public "-//W3C//DTD HTML 4.01//EN"> -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="generator" content="HTML Tidy for Linux (vers 1 September 2005), see www.w3.org" />
<title>HRMS: Edit Placement for Employee</title>
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
<li><a href="admin_dep_hrms.jsp" title="Report">Report</a></li>
<li><a href="admin_dep_srch_hrms.jsp" title="Search">Search</a></li>
<li><a href="emp_add_dep_hrms.jsp" title="Edit"  class="on">Edit</a></li>
</ul>

</div>
<div id="sidebar">
<div>
<h3 title="Sidebar">Reports</h3>
<ul>
<li><a href="admin_details_hrms.jsp">
Employee details report</a></li>

<li><a href="admin_training_hrms.jsp">
Training report<a /></li>

<li><a href="admin_skill_hrms.jsp">
Skill report<a /></li>

<li><a href="admin_proj_hrms.jsp">
Project report<a /></li>

<li><a href="admin_job_hrms.jsp">
Job report<a /></li>
<li><a href="admin_dep_hrms.jsp">
Placement report</a></li>
<li><a href="admin_leave_hrms.jsp">
Leave report</a></li>
<li><a href="admin_appraisal_hrms.jsp">
Appraisal report</a></li>
</ul>

<h3 title="Lorem Ipsum">Admin</h3>
<ul>
<li><a href="admin_add_hrms.jsp">Account tools</a></li>
<li><a href="admin_train_tool_hrms.jsp">
Training tools</a></li>
<li><a href="admin_skill_tool_hrms.jsp">
Skill tools</a></li>
<li><a href="admin_proj_tool_hrms.jsp">
Project tools</a></li>
<li><a href="admin_job_tool_hrms.jsp">
Job tools</a></li>
<li><a href="admin_dep_tool_hrms.jsp">Location tools</a></li>
<li><a href="admin_dep1_tool_hrms.jsp">Department</a></li>
<li><a href="admin_leave_tool_hrms.jsp">
Leave tools</a></li>
<li><a href="style_logout_hrms.jsp">
Logout</a></li>
</ul>

</div>
</div>

<div id="content">
<h2>Edit placement to employee</h2>
<p>Select the employee's username below, then select the department to be added.</p>

<div>
</div>

<form>
<table>
<tr>
<td>Username:</td>
<td><select name= user >
<option value="" >Select employee...</option>

<%
String DRIVER = "org.gjt.mm.mysql.Driver";
Class.forName(DRIVER).newInstance();

Connection con=null;
Connection con1=null;
Connection con2=null;
ResultSet rst=null;
ResultSet rst4=null;
ResultSet rst1=null;
Statement stmt=null;
Statement stmt4=null;
Statement stmt1=null;
PreparedStatement pstmt2=null;

String url="jdbc:mysql://localhost:3306/hr_data";
String user_id = user.getUsername();
session.putValue("user_id",user_id);

int updateQuery=0;
String current_id= null;

try{

con1=DriverManager.getConnection(url, "tahirs2", "samir");
stmt1=con1.createStatement();
rst1=stmt1.executeQuery("select employee.user_type from employee where username='"+user_id+"'");
if(rst1.next()){
if(rst1.getString(1).equals("admin")){

try{

	Connection conn = DriverManager.getConnection(url, "tahirs2", "samir");
	Statement st=conn.createStatement();
	ResultSet rs=st.executeQuery("Select * from employee");
	String u2name="";
	String u_id="";
	while(rs.next()){
	u2name=rs.getString("username");
	u_id=rs.getString("employee_id");
%>

<option value="<%=u_id%>"><%=u2name%></option>

<%
	}
	rs.close();
	st.close();
	conn.close();

%>

</select></td>
</tr>
<tr>
<td>Department:</td>
<td><select name= dname>
<option value="" >Select department...</option>

<%

try{

	Connection con4 = DriverManager.getConnection(url, "tahirs2", "samir");
	Statement st4=con4.createStatement();
	ResultSet rs4=st4.executeQuery("Select * from department");
	String dname="";
	String did="";
	while(rs4.next()){
	dname=rs4.getString("department_name");
	did=rs4.getString("department_id");
%>

<option value="<%=did%>"><%=dname%></option>

<%
	}
	rs4.close();
	st4.close();
	con4.close();


%>

</select></td>
<td><input type="submit" value="Apply" /></td>
</tr>
</tbody>
</table>
</form>

<%

try{
String uid = request.getParameter("user");
con4=DriverManager.getConnection(url, "tahirs2", "samir");
stmt4=con4.createStatement();
rst4=stmt4.executeQuery("select * from employee where employee.employee_id = '"+uid+"'");
rst4.next();
String user_name = rst4.getString("username");
rst4.close();
stmt4.close();
con4.close();



try{	
	String d_id = request.getParameter("dname");
	          	if(d_id!="" && uid!=""){
	String alt_dep= "update employee set department_department_id = ? where employee_id = ?";
	con2=DriverManager.getConnection(url, "tahirs2", "samir");
	pstmt2=con2.prepareStatement(alt_dep);
	
	pstmt2.setString(1, d_id);
	pstmt2.setString(2, uid);
		

	updateQuery = pstmt2.executeUpdate();

	}
	else {	
	%>
	</tbody>
    	</table>
       	<table border="1" borderColor="#ffe9bf" cellPadding="0" cellSpacing="0" width="800" height="63">
	<tbody>
	<td bgColor="#A52A2A" width="100" align="center" height="19"><font color="#ffffff"><b>Make sure employee and department are selected</b></font></td>
	</tbody>    	
	</table>
	<%
	}

	pstmt2.close();
	con2.close();

	if (updateQuery != 0) { 
%>
       	<table border="1" borderColor="#ffe9bf" cellPadding="0" cellSpacing="0" width="800" height="63">
	<tbody>
	<td bgColor="#006699" width="100" align="center" height="19"><font color="#ffffff"><b>Department has been successfully added to employee</b></font></td>
    	</table>
<%
              }

else {	
	%>
	</tbody>
    	</table>
       	<table border="1" borderColor="#ffe9bf" cellPadding="0" cellSpacing="0" width="800" height="63">
	<tbody>
	<td bgColor="#A52A2A" width="100" align="center" height="19"><font color="#ffffff"><b>Failed</b></font></td>
	</tbody>    	
	</table>
	<%
	}

	}catch(Exception e){
	System.out.println(e.getMessage());
	}


	}catch(Exception e){
	System.out.println(e.getMessage());
	}

	}catch(Exception e){
	System.out.println(e.getMessage());
	}

	}catch(Exception e){
	System.out.println(e.getMessage());
	}
}
else {
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
	<td bgColor="#A52A2A" width="100" align="center" height="19"><font color="#ffffff"><b>Invalid user privileges, please login as administrator</b></font></td>
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















<div>
</div>

