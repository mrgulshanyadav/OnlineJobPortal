<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="styles.css" type="text/css"/>
<title>New User Registration</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<h1>Registration</h1>
<fieldset>
<legend>Registration Form</legend>
<p style="color:red;" id="divCheckPasswordMatch"></p>
<form method="post" action="registrationaction.jsp" name="myForm">
<table align='center'>
<tr>
   <td align='center' colspan=2><input type="radio" name="usertype" value="jobseeker" required>JobSeeker <input type="radio" name="usertype" value="recruiter" required>Recruiter </td>
</tr>
<tr><td>&nbsp;</td></tr>
<tr>
    <td align='left'>Username</td>
    <td><input type='text' name='username' placeholder="Username" required></td>
</tr>

<tr>
    <td align='left'>Password</td>
    <td> <input type="password" name="password" placeholder="Password" id="password" required></td>
</tr>

<tr>
    <td align='left'>Confirm Password</td>
    <td><input type="password" placeholder="Confirm Password" id="confirm_password" onChange="checkPasswordMatch();" onClick="style.backgroundColor='white'" required ></td>
</tr>

<script type="text/javascript">
function checkPasswordMatch()
{
    var password = document.getElementById("password").value;
    var confirmPassword = document.getElementById("confirm_password").value;

    if (password != confirmPassword)
        {
    	document.getElementById("divCheckPasswordMatch").innerHTML="Passwords do not match!";
        document.getElementById("confirm_password").style.backgroundColor="red";
        }
}
</script>

<table align='center'>
<tr>
    <td align='center'><input type='submit' name='register' value="Register"></td>
</tr>
</table>
</form>
<a href="index.jsp">Click here to Login</a>
</fieldset>
<jsp:include page="footer.jsp"/>
</body>
</html>