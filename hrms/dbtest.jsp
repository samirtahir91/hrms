<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>

<html>
	<head>
		<title>MySQL Database creation</title>
		<style>
		* { font-size: 12px; font-family: Verdana }
		</style>
	</head>
	<body>
	
		<h2>Creation of a new table</h2>
		
		<%
			Connection 	con;
			Statement	stm;
			String		query1;
			String		query2;

			String url 	= 	"jdbc:mysql://localhost:3306/hr_data";
			
			Class.forName("com.mysql.jdbc.Driver");
			
			con 		=	DriverManager.getConnection(url, "root", "samir"); 
			stm			=	con.createStatement();
			
			query1		=	"CREATE  TABLE `hr_data`.`TestTable2` (`idTestTable` INT NOT NULL ,`testColumn` VARCHAR(45) NULL , PRIMARY KEY (`idTestTable`) );";
			query2		=	"INSERT INTO `hr_data`.`testtable2` (`idTestTable`, `testColumn`) VALUES (1, 's');";
			
           					
           	stm.executeUpdate(query1);
	stm.executeUpdate(query2);

			con.close();
				
		
		%>
	
	</body>
</html>