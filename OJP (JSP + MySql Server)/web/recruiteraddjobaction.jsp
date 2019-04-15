<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Recruiter – Add Job</title>
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
<hr>
<pre> <a href="recruiterprofile.jsp"> Profile </a> | <a href="recruiterviewjob.jsp"> View Your Jobs </a> | <a href="recruiteraddjob.jsp"> Add New Job </a> | <a href="recruitersearch.jsp"> Search Job Seeker </a> | <a href=""> Response Detail </a> | <a href="recruiterfeedback.jsp"> Feedback </a></pre>
<hr>
<%

Date dnow=new Date();
SimpleDateFormat ft=new SimpleDateFormat("E dd.MM.yyyy 'at' hh:mm:ss");
String jobid=request.getParameter("jobid");
String title=request.getParameter("title");
String location=request.getParameter("location");
String experience=request.getParameter("experience");
String salary=request.getParameter("salary");
String description=request.getParameter("description");
String functionalarea=request.getParameter("functionalarea");
String role=request.getParameter("role");
String keyskills=request.getParameter("keyskills");
String vacancy=request.getParameter("vacancy");
String interviewdate=request.getParameter("interviewdate");
String interviewtime=request.getParameter("interviewtime");
String interviewplace=request.getParameter("interviewplace");
String recruiter=request.getParameter("recruiter");

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

 Class.forName("com.mysql.jdbc.Driver");
 String url="jdbc:mysql://localhost:3306/ojp";

 con=DriverManager.getConnection(url,"root","");
 stmt=con.createStatement();
  
 stmt.executeUpdate("insert into job values('"+jobid+"','"+title+"','"+location+"','"+experience+"','"+salary+"','"+description+"','"+functionalarea+"','"+role+"','"+keyskills+"','"+vacancy+"','"+interviewdate+"','"+interviewtime+"','"+interviewplace+"','"+recruiter+"','"+ft.format(dnow)+"')");
 
 rs.close();
 stmt.close();
 con.close();
 
 response.sendRedirect("recruiterjobdetails.jsp?jobid="+jobid+"");
%>
<jsp:include page="footer.jsp"/>
</body>
</html>