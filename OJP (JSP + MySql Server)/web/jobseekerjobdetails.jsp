<%@ page import="java.sql.*" %>

<html>
<head>
<link rel="stylesheet" href="styles.css" type="text/css"/>
<title> JobSeeker – Job Details </title>
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
<legend>Job Details</legend>
<% 
String jobid=request.getParameter("jobid");

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/ojp";

con=DriverManager.getConnection(url,"root","");
stmt=con.createStatement();

rs=stmt.executeQuery("select * from job where jobid='"+jobid+"'");

while(rs.next())
{
%>

<div class="jobdetails">
<table width=30%>
<tr>
<td><b><%=rs.getString("title") %></b></td>
<td style="text-align:right;">Posted on <%=rs.getString("dateofposting") %></td>
</tr>
<tr>
<td><%=rs.getString("experience") %>&nbsp;Years</td>
<td style="text-align:right;">Posted by <%=rs.getString("recruiter") %></td>
</tr>
<tr>
<td><%=rs.getString("location") %></td>
</tr>
<tr>
<td><%=rs.getString("salary") %> p.a.</td>
</tr>
<tr>
<td>Vacancy-<%=rs.getString("vacancy") %></td>
</tr>
</table>
<hr width=30%>
<table>
<tr>
<td><%=rs.getString("description") %></td>
</tr>
</table>
<hr width=30%>
<table>
<tr>
<td>Functional Area &nbsp; </td>
<td><%=rs.getString("functionalarea") %></td>
</tr>
<tr>
<td>Role &nbsp;</td>
<td><%=rs.getString("role") %></td>
</tr>
<tr>
<td>Key Skills  &nbsp;</td>
<td><%=rs.getString("keyskills") %></td>
</tr>
<tr>
<td>Interview Date  &nbsp;</td>
<td><%=rs.getString("interviewdate") %></td>
</tr>
<tr>
<td>Interview Time  &nbsp;</td>
<td><%=rs.getString("interviewtime") %></td>
</tr>
<tr>
<td>Interview Place  &nbsp;</td>
<td><%=rs.getString("interviewplace") %></td>
</tr>
</table>
</div>
<br>
<a href="jobseekersendmessageaction.jsp?user=<%=rs.getString("recruiter") %>&jobid=<%=jobid %>">Apply for this Job</a>
<%	
}
 rs.close();
 stmt.close();
 con.close();
 %>
</fieldset>
</center>
<jsp:include page="footer.jsp"/>
</body>
</html>