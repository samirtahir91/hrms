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
<title>HRMS: Add Employee</title>
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
<li><a href="admin_add_hrms.jsp" title="Add" class="on">Add</a></li>
<li><a href="admin_edit_hrms.jsp" title="Edit">Edit</a></li>
<li><a href="admin_del_hrms.jsp" title="Delete">Delete</a></li>
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
<h2>Add employee</h2>
<p>Enter the new employee's details in the fields specified below, note all entries must not exceed the limits given.</p>
<p>The username field must be unique, i.e the last name followed by the initial of their first name followed by a number, for instance, "tahirs1".</p>
<div>
</div>

<form>
<table>
<tr>
<td>First name:</td>
<td><input type="text" size= "15" name="fname" /></td>
</tr>
<tr>
<td>Last name:</td>
<td><input type="text" size= "15" name="lname" />
</td>
</tr>
<tr>
<td>Username:</td>
<td><input type="text" size= "15" name="1username" /></td>
</tr>
<tr>
<td>Password:</td>
<td><input type="password" size= "15" name="password" /></td>
</tr>
<tr>
<td>Email:</td>
<td><input type="text" size= "15" name="email" /></td>
</tr>
<tr>
<td>Qulification:</td>
<td><input type="text" size= "15" name="qual" /></td>
</tr>
<tr>
<td>Date of birth:</td>
<td><input type="text" size= "15" name="dob" /></td>
</tr>
<tr>
<td>Age:</td>
<td><input type="text" size= "15" name="age" /></td>
</tr>
<tr>
<td>Sex:</td>
<td><input type="text" size= "15" name="sex" /></td>
</tr>
<tr>
<td>Insurance:</td>
<td><input type="text" size= "15" name="ins" /></td>
</tr>
<tr>
<td>Salary:</td>
<td><input type="text" size= "15" name="sal" /></td>
</tr>
<tr>
<td>Travel method:</td>
<td><input type="text" size= "15" name="trvl" /></td>
</tr>
<tr>
<td>User type</td>
<td><select name= utype>
  <option value="user">User</option>
  <option value="admin">Admin</option>
</select></td>
</tr>
<tr>
<td>Tax code:</td>
<td><input type="text" size= "15" name="tax" /></td>
</tr>
<tr>
<td>Telephone:</td>
<td><input type="text" size= "15" name="tel" /></td>
</tr>
<tr>
<td>Address:</td>
<td><input type="text" size= "15" name="address" /></td>
</tr>
<tr>
<td>Post code:</td>
<td><input type="text" size= "15" name="post" /></td>
</tr>
<tr>
<td>Department:</td>
<td><select name= dep>
<option value="" >Select department...</option>

<div>
</div>

<%
String DRIVER = "org.gjt.mm.mysql.Driver";
Class.forName(DRIVER).newInstance();

Connection con=null;
Connection con1=null;
Connection con2=null;
ResultSet rst=null;
ResultSet rst1=null;
Statement stmt=null;
Statement stmt1=null;
PreparedStatement pstmt2=null;

String url="jdbc:mysql://localhost:3306/hr_data";
String user_id = user.getUsername();
session.putValue("user_id",user_id);

String fname = request.getParameter("fname");
String lname = request.getParameter("lname");
String uname = request.getParameter("1username");
String pword = request.getParameter("password");
String uemail = request.getParameter("email");
String qual = request.getParameter("qual");
String dob = request.getParameter("dob");
String age = request.getParameter("age");
String sex = request.getParameter("sex");
String tax = request.getParameter("tax");
String tel = request.getParameter("tel");
String addr = request.getParameter("address");
String posc = request.getParameter("post");
String trvl = request.getParameter("trvl");
String sal = request.getParameter("sal");
String ins = request.getParameter("ins");
String utype = request.getParameter("utype");
String dep = request.getParameter("dep");
int updateQuery=0;
String current_id= null;

try{

con1=DriverManager.getConnection(url, "tahirs2", "samir");
stmt1=con1.createStatement();
rst1=stmt1.executeQuery("select employee.user_type from employee where username='"+user_id+"'");
if(rst1.next()){
if(rst1.getString(1).equals("admin")){

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
}catch(Exception e){
System.out.println(e.getMessage());
}
%>

</select></td>
<td><input type="submit" value="Create" /></td>
</tr>
</tbody>
</table>
</form>

<%

try{
con=DriverManager.getConnection(url, "tahirs2", "samir");
stmt=con.createStatement();
rst=stmt.executeQuery("select * from employee where employee.employee_id = (select max(employee_id) from employee)");
rst.next();
int num_id= Integer.parseInt((rst.getString(1))) + 1;
current_id=Integer.toString(num_id);
rst.close();
stmt.close();
con.close();

try{

	if(fname!=null && lname!=null && uname!=null&& pword!=null&& uemail!=null&& qual!=null&& dob!=null&& age!=null&& sex!=null&& tax!=null&& tel!=null&& addr!=null&& posc!=null&& trvl!=null&& sal!=null&& ins!=null&& utype!=null&& dep!=null){
                         // check if the text box having only blank spaces
          		if(fname!="" && lname!="" && uname!=""&& pword!=""&& uemail!=""&& qual!=""&& dob!=""&& age!=""&& sex!=""&& tax!=""&& tel!=""&& addr!=""&& posc!=""&& trvl!=""&& sal!=""&& ins!=""&& utype!=""&& dep!=""){

	String add_emp= "insert into employee (employee_id, username, password, first_name, last_name, email, qualification, dob, age, sex, insurance, travel_method, salary, tax, user_type, phone_number, address, postcode, department_department_id) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	con2=DriverManager.getConnection(url, "tahirs2", "samir");
	pstmt2=con2.prepareStatement(add_emp);
	
	pstmt2.setString(1, current_id);
	pstmt2.setString(2, uname);	
	pstmt2.setString(3, pword);
	pstmt2.setString(4, fname);
	pstmt2.setString(5, lname);
	pstmt2.setString(6, uemail);
	pstmt2.setString(7, qual);	
	pstmt2.setString(8, dob);
	pstmt2.setString(9, age);
	pstmt2.setString(10, sex);
	pstmt2.setString(11, ins);
	pstmt2.setString(12, trvl);
	pstmt2.setString(13, sal);	
	pstmt2.setString(14, tax);
	pstmt2.setString(15, utype);
	pstmt2.setString(16, tel);
	pstmt2.setString(17, addr);
	pstmt2.setString(18, posc);
	pstmt2.setString(19, dep);
              updateQuery = pstmt2.executeUpdate();

	}
	else {	
	%>
	</tbody>
    	</table>
       	<table border="1" borderColor="#ffe9bf" cellPadding="0" cellSpacing="0" width="800" height="63">
	<tbody>
	<td bgColor="#A52A2A" width="100" align="center" height="19"><font color="#ffffff"><b>Make sure all fields are filled in</b></font></td>
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
	<td bgColor="#A52A2A" width="100" align="center" height="19"><font color="#ffffff"><b>Make sure all fields are filled in</b></font></td>
	</tbody>    	
	</table>
	<%
	}

	

pstmt2.close();
con2.close();
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
	<td bgColor="#A52A2A" width="100" align="center" height="19"><font color="#ffffff"><b>Invalid user provileges, please login as administrator</b></font></td>
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

if (updateQuery != 0) { 
%>
       	<table border="1" borderColor="#ffe9bf" cellPadding="0" cellSpacing="0" width="800" height="63">
	<tbody>
	<td bgColor="#006699" width="100" align="center" height="19"><font color="#ffffff"><b><%=uname%> has been successfully added to the database</b></font></td>
    	</table>
<%
              }

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


