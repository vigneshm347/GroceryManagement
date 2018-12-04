<%@include file="home.jsp" %>
<div style="position:absolute; top:250px; left:550px;">
<script>
function myformvalidation()
{
var a=document.myform.uname.value;
if(a=="")
{
alert("Enter Username");
document.myform.uname.focus();
return false;
}
var b=document.myform.pass.value;
if(b=="")
{
alert("Enter Password");
document.myform.pass.focus();
return false;
}
}
</script>
<center><h2>Customer Login</center>
<form action="clog1.jsp" name="myform" onsubmit="return myformvalidation();">
<table>
<tr><td>Username</td><td><input type=text name=uname autofocus placeholder="Username" oninvalid="alert('Please Enter Username');"></td></tr>
<tr><td>Password</td><td><input type=password name=pass  placeholder="Password" oninvalid="alert('Please Enter Password');"></td></tr>
<tr><td></td><td><input type=submit value="Login"></td></tr>
</table><br>
<a href="creg.jsp"><img src="images/signup.png" width="150" height=50></a>
<a href="cforgot.jsp"><img src="images/forgot.png" width="150" height=50></a>
</form>