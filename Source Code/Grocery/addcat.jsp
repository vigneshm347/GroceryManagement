<%@include file="adminhome.jsp" %>
<div style="position:absolute; top:200px; left:500px;">
<script>
function myformvalidation()
{
var a=document.myform.cat.value;
if(a=="")
{
alert("Enter Category Name");
document.myform.cat.focus();
return false;
}
}</script>
<center><h2>Add Category</h2></center>
<form action="addcat1.jsp" name="myform" onsubmit="return myformvalidation();">
<table>
<tr><td>Enter Category Name :</td><td><input type=text name=cat autofocus></td>
<td></td><td><input type=submit value="Add"></td></tr>
</table>
</form>