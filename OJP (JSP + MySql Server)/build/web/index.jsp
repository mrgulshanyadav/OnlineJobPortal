<html>
<head>
<link rel="stylesheet" href="styles.css" type="text/css"/>
<title>Login</title>
</head>
<body>
<center>
 <fieldset><legend>Login</legend>
<form name="form1" method="post" action="loginaction.jsp">
<table> 
<tr>
 <td align='center' colspan=2><input type="radio" name="usertype" value="jobseeker" required>JobSeeker <input type="radio" name="usertype" value="recruiter" required>Recruiter <input type="radio" name="usertype" value="admin" required>Admin </td>
</tr>
<tr>
<td>&nbsp</td>
</tr>
<tr>
<td>Username</td>
<td><input name="username" type="text" placeholder="Username" required></td>
</tr>
<tr>
<td>Password</td>
<td><input name="password" type="password" placeholder="Password" required></td>
</tr>
<tr>
<td></td>
<td align="center" colspan=2><input type="submit" name="Submit" value="Login"></td>
</tr>
</table>                                          
</form>
<a href="registration.jsp">Click here to register an Account</a>
</fieldset>
<jsp:include page="footer.jsp"/>
</center>
</body>
</html>