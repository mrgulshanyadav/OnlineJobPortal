<html>
<head>
<link rel="stylesheet" href="styles.css" type="text/css"/>
<title> JobSeeker – Search </title>
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
<legend>Search Jobs</legend>
<form method="get" action="jobseekersearchresult.jsp">
<table>
 <tr>
 <td>Keywords</td>
 </tr>
 <tr>
 <td><input type="text" name="keyword"></td>
 </tr>

 <tr>
 <td>Location</td>
 </tr>
 <tr>
 <td><input type="text" name="location"></td>
 </tr>
 
 <tr>
 <td>Experience</td>
 <td>Expected Salary</td>
 </tr>
 <tr>
 <td><input type="number" name="experience"></td>
 <td><input type="number" name="expectedsalary"></td>
 </tr>
 
 <tr>
 <td><input type="submit" name="submit" value="Search Jobs"></td>
 </tr>
</table>
</form>
</fieldset>
</center>
<jsp:include page="footer.jsp"/>
</body>
</html>