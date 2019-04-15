<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
<%
request.getSession();
session.removeAttribute("username");
session.removeAttribute("usertype");
session.invalidate();
%>
You are successfully logged out!
<jsp:include page="index.jsp"/>
</body>
</html>