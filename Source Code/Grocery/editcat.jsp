<%@include file="adminhome.jsp" %>
<div style="position:absolute; top:200px; left:500px;">
<script>
function myformvalidation()
{
var a=document.myform.cat.value;
if(a=="")
{
alert("Enter Category");
document.myform.cat.focus();
return false;
}
}</script>
<%@page import="java.sql.*,databaseconnection.*" %>
<center><h2>Edit Category</h2></center>
<form action="editcat1.jsp" name="myform" onsubmit="return myformvalidation();">
<table>
<% 
String cid=request.getParameter("cid");
Connection con=databasecon.getconnection();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from category where category_id='"+cid+"'");%>

<% if(rs.next())
{%>
<tr><td>Category Name :</td><td><input type=text name=cat autofocus value="<%=rs.getString(2)%>"></td>
<% }
%>
<input type=hidden name=cid value="<%=cid%>">
<td></td><td><input type=submit value="Update"></td></tr>
</table>
</form>