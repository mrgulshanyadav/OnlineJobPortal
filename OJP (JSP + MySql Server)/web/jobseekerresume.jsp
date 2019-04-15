<html>
<head>
<link rel="stylesheet" href="styles.css" type="text/css"/>
<title> JobSeeker - Resume </title>
</head>
<body>
<jsp:include page="header.jsp"/>
<h1> JobSeeker </h1>
<% 
String username=(String)session.getAttribute("username");
String usertype=(String)session.getAttribute("usertype");
if(username==null || usertype!="jobseeker") //to check user is logged in, if user is not logged username will be null and page will redirect to index.jsp
{
	 response.sendRedirect("index.jsp");
}
%>
<p style="text-align:right;"> Welcome <%=username %> <a href="logout.jsp"> Logout </a></p>
<jsp:include page="jobseekermenu.jsp"/>
<center>
<fieldset>
<legend>Upload Resume</legend>
<br>
<form method="post" action="/uploadServlet" enctype="multipart/form-data">
<input type="file" name="resume"><br><br>
<input type="submit" value="Upload">
</form>
</fieldset>
</center>
<jsp:include page="footer.jsp"/>
</body>
</html>