<%@ page import="java.sql.*" %>
<html>
<head>
<title> Recruiter – Update Profile </title>
</head>
<body>
<%
String username=(String)session.getAttribute("username");
String usertype=(String)session.getAttribute("usertype");
%>
<% 
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String company=request.getParameter("company");
String designation=request.getParameter("designation");
String location=request.getParameter("location");
String email=request.getParameter("email");
String mobile=request.getParameter("mobile");
String gender=request.getParameter("gender");

 Connection con=null;
 Statement stmt=null;
 ResultSet rs=null;
 ResultSet rs1=null;
 ResultSet rs2=null;
 ResultSet rs3=null;
 
  Class.forName("oracle.jdbc.driver.OracleDriver");
  String url="jdbc:oracle:thin:@localhost:1521";

  con=DriverManager.getConnection(url,"system","system");
  stmt=con.createStatement();
  
  rs=stmt.executeQuery("select * from login where username='"+username+"' and usertype='"+usertype+"' ");
  if(rs.next())
  {
  rs1=stmt.executeQuery("select * from recruiterprofile where username='"+username+"'");
	  if(rs1.next())
	  {
		  rs2=stmt.executeQuery("update recruiterprofile set username='"+username+"' , fname='"+fname+"' , lname='"+lname+"' , company='"+company+"' , designation='"+designation+"' , location='"+location+"' , email='"+email+"' , mobile='"+mobile+"' , gender='"+gender+"' where username='"+username+"' ");     
	  }
	  else
	  {
          rs3=stmt.executeQuery("insert into recruiterprofile values('"+username+"','"+fname+"','"+lname+"','"+company+"','"+designation+"','"+location+"','"+email+"','"+mobile+"','"+gender+"')");     
	  }
	 
	  stmt.close();
	  con.close();
  }
  response.sendRedirect("recruiterprofile.jsp");
  
%>
</body>
</html>