<%@ page import="java.sql.*" %>

<html>
<head>
<link rel="stylesheet" href="styles.css" type="text/css"/>
<title> Recruiter – View Job </title>
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
<fieldset>
<legend>Posted Jobs</legend>
<center>
<% 
Connection con=null;
Statement stmt=null;
ResultSet rs=null;

Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/ojp";

con=DriverManager.getConnection(url,"root","");
stmt=con.createStatement();

rs=stmt.executeQuery("select * from job where recruiter='"+username+"' ");

while(rs.next())
{
%>

<hr width=30%>
<div class="jobslist">
<table width=30%>
<tr>
<td><b><a href="recruiterjobdetails.jsp?jobid=<%=rs.getString("jobid") %>"><%=rs.getString("title") %></a></b></td>
<td style="text-align:right;">Posted on <%=rs.getString("dateofposting") %></td>
</tr>
<tr>
<td><%=rs.getString("experience") %>Years</td>
</tr>
<tr>
<td><%=rs.getString("location") %></td>
</tr>
<tr>
<td><%=rs.getString("salary") %> p.a.</td>
</tr>
<tr>
<td><%=rs.getString("keyskills") %></td>
</tr>
<tr>
<td>Vacancy-<%=rs.getString("vacancy") %></td>
</tr>
</table>
</div>
<hr width=30%>
<%	
}
rs.close();
stmt.close();
con.close();
%>
</center>
</fieldset>
<jsp:include page="footer.jsp"/>
</body>
</html>