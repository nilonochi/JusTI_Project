<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>JusTI Registration Page</title>
</head>
<body>

	<%@ page import ="java.sql.*" %>
	<%@ page import ="javax.sql.*" %>
	<%
	String fname = request.getParameter("fname");
	String lname = request.getParameter("lname"); 
	String user = request.getParameter("userid"); 
	String pwd = request.getParameter("pwd"); 
	String address = request.getParameter("address"); 
	String contact = request.getParameter("cto"); 
	String typeAccess = request.getParameter("typeaccess");
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/justi","root","Asdf1234"); 
	Statement st = con.createStatement(); 
	ResultSet rs; 
	int i = st.executeUpdate("insert into user values ('"+ fname +"', '"+ lname +"', '"+ user +"', '"+ pwd +"', '"+ address +"', '"+ contact +"', '"+ typeAccess +"')"); 
	
	out.println("User Registered"); 
	
	
	%>
	<a href ="JusTI_login.html">Login</a><br/><br/>
	<a href="index.html">Home</a>

</body>
</html>