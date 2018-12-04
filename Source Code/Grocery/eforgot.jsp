<%@include file="home.jsp" %>
<div style="position:absolute; top:250px; left:500px;">
<script>
function myformvalidation()
{
var a=document.myform.email.value;
if(a=="")
{
alert("Enter Your Email");
document.myform.email.focus();
return false;
}
}</script>
<center><h2>Employee Forgot Password</h2></center>
<form action="eforgot1.jsp" name="myform" onsubmit="return myformvalidation();">
<table>
<tr><td>Enter your Email</td><td><input type=text name=email autofocus placeholder="Email"></td>
<td><input type=submit value="SendEmail"></td></tr>
</table>
</form>