<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 

<html>
<head>
<meta charset="ISO-8859-1">
<title>JusTI Portal</title>

<meta charset="ISO-8859-1">

<style>
body {font-family: Arial;}

/* Style the tab */
.tab {
  overflow: hidden;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.tab button {
  background-color: inherit;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
  font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
  display: none;
  padding: 6px 12px;
  border: 1px solid #ccc;
  border-top: none;
}

html {
 
  /* The image used */
  background-color: gray;

  /* Full height */
  height: 100%; 

  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  
}

.white {color: white}

table {
	width: 800px;
}

th {
	text-align: left;
	font-size: 14px;
	font-weight: bold;
	color: black;
}

td {
	text-align: left;
	font-size: 10px;
}

table, th, td {
	border: 1px solid #999;
}

th, td {
	padding: 10px;
}
</style>
</head>
<body>

<%	String userid = session.getAttribute("userID").toString(); %>

<h2 class="white">JusTI Portal</h2>

<div class="tab">
  <button class="tablinks" onclick="openMenu(event, 'MyApplications')">My Applications</button>
  <button class="tablinks" onclick="openMenu(event, 'AllApplications')">All Applications</button>
  <button class="tablinks" onclick="openMenu(event, 'MyVolunteering')">My Volunteering</button>
  <button class="tablinks" onclick="openMenu(event, 'Contact')">Contact</button>
</div>

<div id="MyApplications" class="tabcontent">
  <table class="white">
  
  
    <%
	try {
	/* Create string of connection url within specified format with machine
	name, port number and database name. Here machine name id localhost and 
	database name is student. */
	String connectionURL = "jdbc:mysql://localhost:3306/justi";
	// declare a connection by using Connection interface
	Connection connection = null;
	/* declare object of Statement interface that is used for executing sql 
	statements. */
	Statement statement = null;
	// declare a resultset that uses as a table for output data from tha table.
	ResultSet rsDev = null;
	// Load JBBC driver "com.mysql.jdbc.Driver"
	Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
	/* Create a connection by using getConnection() method that takes parameters 
	of string type connection url, user name and password to connect to database.*/
	connection = DriverManager.getConnection(connectionURL, "root", "Asdf1234");
	/* createStatement() is used for create statement object that is used for 
	sending sql statements to the specified database. */
	statement = connection.createStatement();
	// sql query to retrieve values from the secified table.
	String queryDev = ("select APPL_NAME, APPL_SIZE, APPL_DATE, APPL_STATUS from APPL where DEVELOPER_ID = '" + userid + "'");	
	rsDev = statement.executeQuery(queryDev);
	%>
  
  
  	<tr>
  		<th>Application Name</th>
  		<th>Application Size</th>
  		<th>Application Date</th>
  		<th>Application Status</th>
  		<th>Log Collection</th>
  		<th>Application Management</th>
  	</tr>
		<%
		while (rsDev.next()) {
		%>
		<TR>
			<TD><%=rsDev.getString(1)%></TD>
			<TD><%=rsDev.getString(2)%></TD>
			<TD><%=rsDev.getString(3)%></TD>
			<TD><% if (rsDev.getInt(4) == 1){
						out.print("Active");
					}else if (rsDev.getInt(4) == 0){
						out.print("Inactive");
					}%>
			</TD>
			
			<TD><button id = "download">Download</button></TD>
			<TD>
				<form action="EditStatus" method="post">
         	  	  <fieldset>
         	  	  <label>Options:</label>
           			  <select name = "ApplOpt" id = "appl_options">
            		   <option value = "Activate" selected>Activate</option>
           			   <option value = "Deactivate">Deactivate</option>
           			   <option value = "Delete">Delete</option>
            		  </select>
        	  	 	<input type="submit" name="edit" value="Edit"/>
        	  	 	</fieldset>
        	  	 </form>
  			</TD>
		</TR>
		<% } %>
				<%
		// close all the connections.
		rsDev.close();
		statement.close();
		connection.close();
		} catch (Exception ex) {
		%>
		
		<%
		out.println("Unable to connect to database.");
		}
		%>
  </table>
  <div>
  	<fieldset>
		<legend>Upload Application</legend>
		<form action="JusTI_upload_app.jsp" method="post">
		<font color="white">Create a new project:</font>
   		<input type="submit" value="New project" />
       </form>
	</fieldset>
  </div>
</div>

<div id="AllApplications" class="tabcontent">
  <table class="white">
  
  
    <% 
	try {
	/* Create string of connection url within specified format with machine
	name, port number and database name. Here machine name id localhost and 
	database name is student. */
	String connectionURL = "jdbc:mysql://localhost:3306/justi";
	// declare a connection by using Connection interface
	Connection connection = null;
	/* declare object of Statement interface that is used for executing sql 
	statements. */
	Statement statement = null;
	// declare a resultset that uses as a table for output data from tha table.
	ResultSet rsUser = null;
	// Load JBBC driver "com.mysql.jdbc.Driver"
	Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
	/* Create a connection by using getConnection() method that takes parameters 
	of string type connection url, user name and password to connect to database.*/
	connection = DriverManager.getConnection(connectionURL, "root", "Asdf1234");
	/* createStatement() is used for create statement object that is used for 
	sending sql statements to the specified database. */
	statement = connection.createStatement();
	// sql query to retrieve values from the secified table.
	String queryUser = "select APPL_NAME, APPL_DESCRIPTION, DEVELOPER_ID, APPL_SIZE, APPL_DATE from APPL";	
	rsUser = statement.executeQuery(queryUser);
	%>
  
  
		<tr>
			<th>APPL_NAME</th>
			<th>APPL_DESCR</th>	
			<th>DEVELOPER</th>   
			<th>APPL_SIZE</th>
			<th>APPL_DATE</th>
			<th>DOWNLOAD</th>
		</tr>
				<%
		while (rsUser.next()) {
		%>
		<TR>
			<TD><%=rsUser.getString(1)%></TD>
			<TD><%=rsUser.getString(2)%></TD>
			<TD><%=rsUser.getString(3)%></TD>
			<TD><%=rsUser.getString(4)%></TD>
			<TD><%=rsUser.getString(5)%></TD>
			<TD><button>Download</button></TD>
		</TR>
		<% } %>
		<%
		// close all the connections.
		rsUser.close();
		statement.close();
		connection.close();
		} catch (Exception ex) {
		%>
		
		<%
		out.println("Unable to connect to database.");
		}
		%>
  </table>
</div>

<div id="MyVolunteering" class="tabcontent">
  <p class="white">Test</p> 
</div>
<p></p>
<p></p>

<div id="Contact" class="tabcontent">
  <p class="white">Email: <a href="mailto: justi@lambton.ca">justi@lambton.ca</a></p> 
</div>
<p></p>
<p></p>
<div>
	<form action="index.html" method="get" >
		<button type="submit">Logout</button>
	</form>
</div>

<script>
function openMenu(evt, menuOption) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(menuOption).style.display = "block";
  evt.currentTarget.className += " active";
}
</script>

</body>