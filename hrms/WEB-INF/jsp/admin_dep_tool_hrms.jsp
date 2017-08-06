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
<title>HRMS: Add Location to System</title>
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
<li><a href="http://localhost:8080/admin_dep_tool_hrms.jsp" title="Add" class="on">Add</a></li>
<li><a href="http://localhost:8080/admin_edit_dep_hrms.jsp" title="Edit">Edit</a></li>
<li><a href="http://localhost:8080/admin_del_dep_hrms.jsp" title="Delete">Delete</a></li>
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
<h2>Add location to system</h2>
<p>Enter the new location details in the fields specified below, note all entries must not exceed the limits given.</p>

<div>
</div>

<form>
<table>
<tr>
<td>Address:</td>
<td><input type="text" size= "15" name="aname" /></td>
</tr>
<tr>
<td>Post code:</td>
<td><input type="text" size= "15" name="posc" />
</td>
</tr>
<tr>
<td>City:</td>
<td><input type="text" size= "15" name="city" /></td>
<tr>
<tr>
<td>Region:</td>
<td><input type="text" size= "15" name="region" /></td>
<tr>
<tr>
<td>Country:</td>
<td><input type="text" size= "15" name="country" /></td>
<td><input type="submit" value="Create" /></td>
</tr>
</table>
</form>

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

String aname = request.getParameter("aname");
String posc = request.getParameter("posc");
String city = request.getParameter("city");
String region = request.getParameter("region");
String country = request.getParameter("country");
int updateQuery=0;
String current_id= null;

try{

con1=DriverManager.getConnection(url, "tahirs2", "samir");
stmt1=con1.createStatement();
rst1=stmt1.executeQuery("select employee.user_type from employee where username='"+user_id+"'");
if(rst1.next()){
if(rst1.getString(1).equals("admin")){


try{
con=DriverManager.getConnection(url, "tahirs2", "samir");
stmt=con.createStatement();
rst=stmt.executeQuery("select * from location where location.location_id = (select max(location_id) from location)");
rst.next();
int num_id= Integer.parseInt((rst.getString(1))) + 1;
current_id=Integer.toString(num_id);
rst.close();
stmt.close();
con.close();

try{

	if(aname!=null && posc!=null && city!=null && region!=null && country!=null){
                         // check if the text box having only blank spaces
          		if(aname!="" && posc!="" && city!="" && region!="" && country!=""){

	String add_loc= "insert into location (location_id, address, postcode, city, region, country) values (?, ?, ?, ?, ?, ?)";
	con2=DriverManager.getConnection(url, "tahirs2", "samir");
	pstmt2=con2.prepareStatement(add_loc);
	
	pstmt2.setString(1, current_id);
	pstmt2.setString(2, aname);	
	pstmt2.setString(3, posc);
	pstmt2.setString(4, city);
	pstmt2.setString(5, region);
	pstmt2.setString(6, country);
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

if (updateQuery != 0) { 
%>
       	<table border="1" borderColor="#ffe9bf" cellPadding="0" cellSpacing="0" width="800" height="63">
	<tbody>
	<td bgColor="#006699" width="100" align="center" height="19"><font color="#ffffff"><b><%=aname%> has been successfully added to the database</b></font></td>
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


