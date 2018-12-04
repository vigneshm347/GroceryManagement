<%@include file="home.jsp" %>
<div style="position:absolute; top:250px; left:550px;">
<script>
function myformvalidation()
{
var a=document.myform.uname.value;
if(a=="")
{
alert("Choose Username");
document.myform.uname.focus();
return false;
}
var b=document.myform.pass.value;
if(b=="")
{
alert("Choose Password");
document.myform.pass.focus();
return false;
}
var c=document.myform.email.value;
if(c=="")
{
alert("Enter  Email");
document.myform.email.focus();
return false;
}
var d=document.myform.gen.value;
if(d=="")
{
alert("Please Select Gender");
document.myform.email.focus();
return false;
}
var e=document.myform.place.value;
if(e=="")
{
alert("Enter Place");
document.myform.place.focus();
return false;
}
var f=document.myform.mob.value;
var g = f.length;

if(f==""||g!=10)
{
alert("Enter Valid Phone Number");
document.myform.mob.focus();
return false;
}
}
</script>
<center><h3>Customer Registration</h3></center>
<form action="creg1.jsp" name="myform" onsubmit="return myformvalidation();">
<table>
<tr><td>Username</td><td><input type=text name=uname autofocus placeholder="Enter Username" ></td></tr>
<tr><td>Password</td><td><input type=password name=pass  placeholder="Enter Password"></td></tr>
<tr><td>Email</td><td><input type=email name=email   placeholder="Email Address"></td></tr>
<tr><td>Gender</td><td><input type=radio name=gen value=Male>Male &nbsp&nbsp<input type=radio name=gen value=Female>Female</td></tr>
<tr><td>Place</td><td><input type=text name=place   placeholder="Place "></td></tr>
<tr><td>Phone</td><td><input type=number name=mob  placeholder="Phone Number"></td></tr>
<tr><td></td><td><input type=submit value="Register"></td></tr>
</table>
</form>