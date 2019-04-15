<html>
<head>
<link rel="stylesheet" href="styles.css" type="text/css"/>
<title> Recruiter - Feedback </title>
</head>
<body>
<jsp:include page="header.jsp"/>
<h1> Recruiter </h1>
<% 
String username=(String)session.getAttribute("username");
String usertype=(String)session.getAttribute("usertype");
if(username==null || usertype!="recruiter") //to check user is logged in, if user is not logged username will be null and page will redirect to index.jsp
{
	 response.sendRedirect("index.jsp");
}
%>
<p style="text-align:right;"> Welcome <%=username %> <a href="logout.jsp"> Logout </a></p>
<jsp:include page="recruitermenu.jsp"/>
<center>
<fieldset>
<legend>Feedback</legend>
<form method="post" action="mailto:ry4761@gmail.com" name="messageform">
<table>
<tr>
<td>Username</td>
<td><input type="text" name="username" value="<%=username%>" disabled></td>
</tr>
<tr>
<td>E-Mail</td>
<td><input type="text" name="email"></td>
</tr>
<tr>
<td>Message</td>
<td><textarea name="message" form="messageform" required></textarea></td>
</tr>
<tr>
<td></td>
<td><input type="submit" value="Send Message"></td>
</tr>
</table>
</form>
</fieldset>
</center>
<jsp:include page="footer.jsp"/>
</body>
</html>