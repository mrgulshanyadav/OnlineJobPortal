<%@ page import="java.sql.*" %>
<html>
<head>
<title>Login</title>
</head>
<body>
<%
try
{
String username=request.getParameter("username");
String password=request.getParameter("password");
String usertype=request.getParameter("usertype");


  if(username.equals("admin") && password.equals("admin") && usertype.equals("admin"))
   {
   session.setAttribute("username",username);
   session.setAttribute("usertype","admin");
   response.sendRedirect("adminhome.jsp");
   }

  
  Connection con=null;
  Statement stmt=null;
  ResultSet rs=null;

 Class.forName("com.mysql.jdbc.Driver");
 String url="jdbc:mysql://localhost:3306/ojp";
 
 con=DriverManager.getConnection(url,"root","");
 stmt=con.createStatement();
 
 rs=stmt.executeQuery("select * from Login where username='"+username+"' and password='"+password+"' and usertype='"+usertype+"' ");

  if(rs.next())
  {
	  session.setAttribute("username",username);
	  rs.close();
	  stmt.close();
	  con.close();
	  if(usertype.equals("jobseeker"))
	   {  
	   session.setAttribute("usertype","jobseeker");
	   response.sendRedirect("jobseekerhome.jsp");
	   }
	  else if(usertype.equals("recruiter"))
	   {
	   session.setAttribute("usertype","recruiter");
       response.sendRedirect("recruiterhome.jsp");
	   }
  }
  else
  {
%>
Invalid Username or Password or User Type
<jsp:include page="index.jsp"/>
<%
  }
}
catch(NullPointerException e)
{
	out.print("Please Enter Login Details");
%>
<jsp:include page="index.jsp"/>
<%
}
catch(Exception e)
{
	out.print(e);
}
%>
</body>
</html>