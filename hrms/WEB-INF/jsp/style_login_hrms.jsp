<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
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
<title>HRMS: Account Login</title>
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

</div>

</div>
<div id="content">
<h2>Login</h2>
<p></p>


<%
String userid=request.getParameter("username");
session.putValue("userid",userid);
String pwd=request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hr_data", "tahirs2", "samir");
Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select * from employee where username='"+userid+"'"); 
if(rs.next())
{
	  if(rs.getString(3).equals(pwd))
	{
		out.println("Welcome "+rs.getString(4)+".");
		out.println("You will be redirected to your details page shortly, once there you may use the links on the left panel to view HR information");
			if(rs.getString(15).equals("admin"))
			{
				response.setHeader("Refresh", "6; URL=http://localhost:8080/admin_details_hrms.jsp");	
			}
		else
		{
			response.setHeader("Refresh", "6; URL=http://localhost:8080/style_details_hrms.jsp");
		}
	}
	else
	{
	user.setPassword(null);
	user.setUsername(null);
	out.println("Invalid password try again");
	    	

	}
}
else
{
	user.setPassword(null);
	user.setUsername(null);
	out.println("Invalid username try again");
	    	
}


%>
<p><a href="http://localhost:8080/style_index_hrms.jsp">
Back<a /></p>
</div>
<div id="footer">
Copyright &#169 2012 Samir Tahir. All Rights Reserved.

</div>
</body>
</html>


