<%@include file="home.jsp" %>
<div style="position:absolute; top:250px; left:500px;">
<script>
function myformvalidation()
{
var a=document.myform.pass1.value;
if(a=="")
{
alert("Choose New Password");
document.myform.pass1.focus();
return false;
}
var b=document.myform.pass2.value;
if(b=="")
{
alert("Confirm Password");
document.myform.pass2.focus();
return false;
}
if(a!=b)
	{
	alert("New Password and Confirm Password Should be Same");
	document.myform.pass2.focus();
	return false;
	}
}
</script>
<% String email=request.getParameter("email");%>
<center><h2>Customer Password Reset</h2></center>
<form action="creset1.jsp" name="myform" onsubmit="return myformvalidation();">
<table>
<input type=hidden name=email value="<%=email%>">
<tr><td>New Password</td><td><input type=password name=pass1 autofocus  placeholder="New password"></td></tr>
<tr><td>Conform Password</td><td><input type=password name=pass2  placeholder="Old password"></td></tr>
<tr><td></td><td><input type=submit value="Change Password"></td></tr>
</table>
</form>