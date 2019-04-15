<%@ page import="java.sql.*" %>
<html>
<head>
<link rel="stylesheet" href="styles.css" type="text/css"/>
<title> JobSeeker - Message Box </title>
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
<legend>Messages</legend>
<%

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

 Class.forName("com.mysql.jdbc.Driver");
 String url="jdbc:mysql://localhost:3306/ojp";

 con=DriverManager.getConnection(url,"root","");
 stmt=con.createStatement();
 
 rs=stmt.executeQuery("select * from message where to_username='"+username+"' order by datetime desc ");
 if(!rs.next())
 {
 %>
 Empty Message Box
 <%
 }
 while(rs.next())
 {
%>

<hr width=30%>
<div class="inbox">
<table width=30%>

<tr>
<td><a href="jobseekerrecruiterprofile.jsp?user=<%=rs.getString("from_username") %>"><%=rs.getString("from_username") %></a></td>
<td style="text-align:right;"><%=rs.getString("datetime") %></td>
</tr>

<tr>
<td><%=rs.getString("message") %><a href="jobseekerjobdetails.jsp?jobid=<%=rs.getString("forjob")%>"><%=rs.getString("forjob") %></a></td>
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


</fieldset>
</center>
<jsp:include page="footer.jsp"/>
</body>
</html>