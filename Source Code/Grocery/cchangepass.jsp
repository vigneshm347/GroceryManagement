<%@include file="customerhome.jsp" %>
<div style="position:absolute;top:200px;left:500px;">
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
<center><h2>Change Password</h2></center>
<form action="cchangepass1.jsp" name="myform" onsubmit="return myformvalidation();">
<table>
<tr><td>New Password</td><td><input type=password name=pass1 autofocus  placeholder="New password"></td></tr>
<tr><td>Confirm Password</td><td><input type=password name=pass2  placeholder="Confirm password"></td></tr>
<tr><td></td><td><input type=submit value="Change Password"></td></tr>
</table>
</form>