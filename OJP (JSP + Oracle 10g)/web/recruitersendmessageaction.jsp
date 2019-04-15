<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.*" %>
<html>
<head>
<title> Recruiter – Send Message </title>
</head>
<body>
<%
String username=(String)session.getAttribute("username");
String usertype=(String)session.getAttribute("usertype");
if(username==null || usertype!="recruiter") //to check user is logged in, if user is not logged username will be null and page will redirect to index.jsp
{
	 response.sendRedirect("index.jsp");
}
%>
<% 
Date dnow=new Date();
SimpleDateFormat ft=new SimpleDateFormat("E dd.MM.yyyy 'at' hh:mm:ss");
String user=request.getParameter("user");
String jobid=request.getParameter("jobid");
String message="Selected for Interview for job ";

 Connection con=null;
 Statement stmt=null;
 ResultSet rs=null;
 
  Class.forName("oracle.jdbc.driver.OracleDriver");
  String url="jdbc:oracle:thin:@localhost:1521";

  con=DriverManager.getConnection(url,"system","system");
  stmt=con.createStatement();
  
  rs=stmt.executeQuery("insert into message values('"+username+"','"+user+"','"+message+"','"+jobid+"','"+ft.format(dnow)+"')");
    
	  rs.close();
	  stmt.close();
	  con.close();

  response.sendRedirect("recruitermessagebox.jsp");
  
%>
</body>
</html>