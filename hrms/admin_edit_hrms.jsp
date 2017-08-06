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
<title>HRMS: Edit Employee</title>
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
<li><a href="admin_add_hrms.jsp" title="Add" >Add</a></li>
<li><a href="admin_edit_hrms.jsp" title="Edit" class="on">Edit</a></li>
<li><a href="admin_del_hrms.jsp" title="Delete" >Delete</a></li>
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
<h2>Edit employee</h2>
<p>Select the employee's username to be altered, then select the attribute from the drop down menus and enter the replacement below.</p>
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

	Connection conn = DriverManager.getConnection(url, "tahirs2", "samir");
	Statement st=conn.createStatement();
	ResultSet rs=st.executeQuery("Select * from employee");
	String u2name="";
	while(rs.next()){
	u2name=rs.getString("username");
%>

<option value="<%=u2name%>"><%=u2name%></option>

<%
	}
	rs.close();
	st.close();
	conn.close();
%>

</select></td>
</tr>

<tr>
<td>Attribute:</td>
<td><select name= attr>
<option value="" >Select attribute...</option>
<option value="username">username</option>
<option value="user_type">user type ("admin" or "user"</option>
<option value="first_name">first name</option>
<option value="last_name">last name</option>
<option value="email">email</option>
<option value="qualification">qualification</option>
<option value="dob">D.O.B.</option>
<option value="age">age</option>
<option value="sex">sex</option>
<option value="insurance">N.I</option>
<option value="travel_method">travel method</option>
<option value="salary">salary (&#163;)</option>
<option value="tax">tax code</option>
<option value="phone_number">telephone</option>
<option value="address">address</option>
<option value="postcode">post code</option>
</select></td>
</tr>

<tr>
<td>Replace with:</td>
<td><input type="text" size="28" name="newattr" /></td>
<td><input type="submit" value="Apply change" /></td>
</tr>
</tbody>
</table>
</form>

<%		


		try{	

		Connection con = DriverManager.getConnection(url, "tahirs2", "samir");
		String oldattr = request.getParameter("attr");		
		String new_id = request.getParameter("user");
		String alt_emp= "update employee set "+oldattr+" = ? where username = ?";
		PreparedStatement pst=con.prepareStatement(alt_emp);
		String a1ttribute = request.getParameter("newattr");
		if(!new_id.equals("")){
		if(!oldattr.equals("")){
		if(!a1ttribute.equals("")){
		pst.setString(1, a1ttribute);
		pst.setString(2, new_id);
		int alt = pst.executeUpdate();
		if (alt == 1) { 
%>
       		<table border="1" borderColor="#ffe9bf" cellPadding="0" cellSpacing="0" width="800" height="63">
		<tbody>
		<td bgColor="#006699" width="100" align="center" height="19"><font color="#ffffff"><b><%=new_id%> has been successfully altered in the database</b></font></td>
		</tbody>    	
		</table>
<%
		response.setHeader("Refresh", "2; URL=admin_edit_hrms.jsp");

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
		<td bgColor="#A52A2A" width="100" align="center" height="19"><font color="#ffffff"><b>No replacement entered, please make sure the field is filled in.</b></font></td>
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
		<td bgColor="#A52A2A" width="100" align="center" height="19"><font color="#ffffff"><b>No attribute selected</b></font></td>
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
		<td bgColor="#A52A2A" width="100" align="center" height="19"><font color="#ffffff"><b>No username selected</b></font></td>
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

</div>

<div id="footer">
Copyright &#169 2012 Samir Tahir. All Rights Reserved.

</div>
</body>
</html>


