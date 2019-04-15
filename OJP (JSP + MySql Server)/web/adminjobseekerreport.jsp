<%@ page import="java.sql.*" %>
<html>
<head>
<link rel="stylesheet" href="styles.css" type="text/css"/>
<title> Admin – JobSeeker Report </title>
</head>
<body>
<jsp:include page="header.jsp"/>
<h1>Administrator</h1>
<% 
String username=(String)session.getAttribute("username");
String usertype=(String)session.getAttribute("usertype");
if(username==null || usertype!="admin") //to check user is logged in, if user is not logged username will be null and page will redirect to index.jsp
{
	 response.sendRedirect("index.jsp");
}
%>
<p style="text-align:right;"> Welcome <%=username %>    <a href="logout.jsp"> Logout </a></p>
<jsp:include page="adminmenu.jsp"/>
<fieldset>
<legend>List of Registered JobSeekers</legend>
<div class="adminlist">
<table width=30% border=1>
<b><tr>
<td width=10%>S.No.</td>
<td width=50%>Username</td>
<td width=20%>View Profile</td>
<td width=20%>Remove Profile</td>
</tr></b>
</table>
<%
Connection con=null;
Statement stmt=null;
ResultSet rs=null;
int count=1;
 Class.forName("com.mysql.jdbc.Driver");
 String url="jdbc:mysql://localhost:3306/ojp";

 con=DriverManager.getConnection(url,"root","");
 stmt=con.createStatement();
 
 rs=stmt.executeQuery("select * from jobseekerprofile");
 while(rs.next())
 {
%>

<table width=30% border=1>
<tr>
<td width=10%><%=count%>.</td>
<td width=50%><%=rs.getString("username") %></td>
<td width=20%><a href="adminjobseekerprofile.jsp?user=<%=rs.getString("username") %>">View</a></td>
<td width=20%><a href="adminremoveaction.jsp?user=<%=rs.getString("username")%>&type=jobseeker">Remove</a></td>
</tr>
</table>
</div>
<%
count++;
} 
 rs.close();
 stmt.close();
 con.close();
%>
</fieldset>
<jsp:include page="footer.jsp"/>
</body>
</html>