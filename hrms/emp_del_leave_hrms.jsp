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
<title>HRMS: Delete Leave From Employee</title>
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
<li><a href="admin_leave_hrms.jsp" title="Report">Report</a></li>
<li><a href="emp_add_leave_hrms.jsp" title="Add"  >Add</a></li>
<li><a href="emp_del_leave_hrms.jsp" title="Delete"class="on">Delete</a></li>
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
<h2>Delete leave</h2>
<p>Select the employee and the leave to be removed from the drop down menus below.</p>
<div>
</div>

<form>
<table>
<tr>
<td>Username:</td>
<td><select name= user >
<option value="" >Select employee...</option>

<div>
</div>

<%
Class.forName("com.mysql.jdbc.Driver").newInstance();
String url="jdbc:mysql://localhost:3306/hr_data";
Connection con1=null;
ResultSet rst1=null;
Statement stmt1=null;
String user_id = user.getUsername();
session.putValue("user_id",user_id);

try{

con1=DriverManager.getConnection(url, "tahirs2", "samir");
stmt1=con1.createStatement();
rst1=stmt1.executeQuery("select employee.user_type from employee where username='"+user_id+"'");
if(rst1.next()){
if(rst1.getString(1).equals("admin")){

try{

	Connection con2 = DriverManager.getConnection(url, "tahirs2", "samir");
	Statement st2=con2.createStatement();
	ResultSet rs2=st2.executeQuery("Select * from employee");
	String u3name="";
	String u_id="";
	while(rs2.next()){
	u3name=rs2.getString("username");
	u_id=rs2.getString("employee_id");
%>

<option value="<%=u_id%>"><%=u3name%></option>

<%
	}
	rs2.close();
	st2.close();
	con2.close();

%>

</select></td>
</tr>
<tr>
<td>Leave:</td>
<td><select name= lname>
<option value="" >Select leave...</option>
<%
	try{

	Connection con3 = DriverManager.getConnection(url, "tahirs2", "samir");
	Statement st3=con3.createStatement();
	ResultSet rs3=st3.executeQuery("select lleave.type, employee_has_leave.start_date from hr_data.lleave join employee_has_leave on lleave.leave_id = employee_has_leave.leave_leave_id");
	String u2name="";
	String u4name="";
	while(rs3.next()){
	u2name=rs3.getString("start_date");
	u4name=rs3.getString("type");
	
%>

<option value="<%=u2name%>"><%=u2name + " " +u4name%></option>

<%
	}
	rs3.close();
	st3.close();
	con3.close();
%>

</select></td>
<td><input type="submit" value="Remove" /></td>
</table>
</form>

<%		
		try{	
		String uid = request.getParameter("user");
		Connection con = DriverManager.getConnection(url, "tahirs2", "samir");
		String del_lev= "delete from employee_has_leave where employee_employee_id = ? and start_date = ?";
		PreparedStatement pst=con.prepareStatement(del_lev);

		String lname = request.getParameter("lname");
		if(!lname.equals("")&&!uid.equals("")){
		pst.setString(1, uid);
		pst.setString(2, lname);
		int del = pst.executeUpdate();
		if (del == 1) { 
%>
       		<table border="1" borderColor="#ffe9bf" cellPadding="0" cellSpacing="0" width="800" height="63">
		<tbody>
		<td bgColor="#006699" width="100" align="center" height="19"><font color="#ffffff"><b>Leave has been successfully removed from the employee</b></font></td>
		</tbody>    	
		</table>
<%
		response.setHeader("Refresh", "2; URL=emp_del_leave_hrms.jsp");

		}
		else{
		out.println("Failed");
		}
		}
		else {	
		%>
		</tbody>
	    	</table>
       		<table border="1" borderColor="#ffe9bf" cellPadding="0" cellSpacing="0" width="800" height="63">
		<tbody>
		<td bgColor="#A52A2A" width="100" align="center" height="19"><font color="#ffffff"><b>No leave or employee selected</b></font></td>
		</tbody>    	
		</table>
		<%
		}

		pst.close();
		con.close();
		}catch(Exception e){
		System.out.println(e.getMessage());
		}
		
	}catch(Exception e){
	System.out.println(e.getMessage());
	}

	}catch(Exception e){
	System.out.println(e.getMessage());
	}

}else {

%>
</form>
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
	</form>
	</tbody>
    	</table>

</div>

<div id="footer">
Copyright &#169 2012 Samir Tahir. All Rights Reserved.

</div>
</body>
</html>


