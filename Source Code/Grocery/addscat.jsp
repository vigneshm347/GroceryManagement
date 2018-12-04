<%@include file="adminhome.jsp" %>
<div style="position:absolute; top:200px; left:500px;">
<script>
function myformvalidation()
{
var a=document.myform.cat.value;
if(a=="<--Category-->")
{
alert("Please Choose Category");
document.myform.cat.focus();
return false;
}
var b=document.myform.scat.value;
if(b=="")
{
alert("Enter Choose Sub Category Name");
document.myform.scat.focus();
return false;
}
}
</script>
<%@page import="java.sql.*,databaseconnection.*" %>
<center><h2>Add Sub Category</h2></center>
<form action="addscat1.jsp" name="myform" onsubmit="return myformvalidation();">
<table>
<% 
Connection con=databasecon.getconnection();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from category");%>
<tr><td>Select Category</td><td><select name=cat><option><--Category--></option>
<% while(rs.next())
{%>
<option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
<% }
%>
</select></td></tr>
<tr><td>Enter Sub Category Name :</td><td><input type=text name=scat></td></tr>
<tr><td></td><td><input type=submit value="Add"></td></tr>
</table>
</form>