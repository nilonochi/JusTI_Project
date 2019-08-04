<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>JusTI Login Page</title>
</head>
<body>

	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
	String userid = request.getParameter("usr");
	session.setAttribute("userID", userid);
	String pwd = request.getParameter("pwd"); 
	Class.forName("com.mysql.cj.jdbc.Driver");	
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/justi","root","Asdf1234"); 
	Statement st = con.createStatement(); 
	ResultSet rs = st.executeQuery("select * from USER where USERNAME = '" + userid + "'"); 
	if(rs.next()) 
	{ 
		if(rs.getString(4).equals(pwd)) 
		{ 
			if(rs.getString(7).equalsIgnoreCase("developer")){
				response.sendRedirect("JusTI_portal_dev.jsp");
			}
			else {
				response.sendRedirect("JusTI_portal_user.jsp");
			}
		} 
		else 
		{	 
			out.println("Invalid password try again!"); 
		} 
	} 
	else 
	%>
	<br/>
	<a href="index.html">Home</a>

</body>
</html>