<%@ page contentType="text/html;charset=windows-1252"%> 
<%@ page import ="java.sql.*" %> 
<%@ page import ="javax.sql.*" %> 
<%@ page import ="javax.naming.InitialContext" %> 
<%@ page import ="java.sql.PreparedStatement.*" %> 
<html>
<head>
<link rel="stylesheet" href="layout.css" type="text/css"/>
</head>
<body>
<jsp:include page="header.jsp"/>
<form name="upload1" method="post"> 
<% 
String username=(String)session.getAttribute("username");
 
Connection con=null;
PreparedStatement ps=null;
String up2=request.getParameter("resume"); 
java.io.File f=new java.io.File(up2); 
java.io.FileInputStream fis= new java.io.FileInputStream(f); 
Class.forName("oracle.jdbc.driver.OracleDriver");
String url="jdbc:oracle:thin:@localhost:1521";

con=DriverManager.getConnection(url,"system","system");
ps=con.prepareStatement("insert into jobseekerresume values(?,?)"); 
ps.setString(1,username); 
ps.setBinaryStream(2,fis,(int)f.length()); 
ps.executeUpdate(); 
ps.close(); 
con.close(); 
%> 
 
</form> 
<jsp:include page="footer.jsp"/>
</body>
</html>