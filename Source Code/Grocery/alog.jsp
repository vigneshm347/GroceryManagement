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
<center><h2>Administrator Login</h2></center>
<form action="alog1.jsp" name="myform" onsubmit="return myformvalidation();" >
<table>
<tr><td>Username</td><td><input type=text name=uname autofocus  placeholder="Username"></td></tr>
<tr><td>Password</td><td><input type=password name=pass placeholder="Password"></td></tr>
<tr><td></td><td><input type=submit value="Login"></td></tr>
</table>
</form>