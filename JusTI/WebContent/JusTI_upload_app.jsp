<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>JusTI Portal</title>
</head>
<body bgcolor="gray">
  <div>
  	<fieldset>
		<legend>Upload Application</legend>
		<form action="UploadServlet" method="post" enctype="multipart/form-data">
			<font color="white">
				Application name:<input type="text" name="appname" /><br/><br/>
				Application Description (max 100 characters):<input type="text" name="appdescr" /><br/><br/>
				Select file to upload:<input type="file" name="file" size="50" />
   			</font>
   			<input type="submit" value="Upload Application" />
       	</form>
	</fieldset>
  </div>
<div>
<a href = "JusTI_portal_dev.jsp"><< Go Back</a>
</div>
<div>
	<FORM ACTION="JusTI_portal_dev.jsp" method="get" >
	<button type="submit">Cancel</button>
	</FORM>
</div>
</body>
</html>