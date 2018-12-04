<%@include file="adminhome.jsp" %>
<div style="position:absolute; top:200px; left:500px;">
<script>
function myformvalidation()
{
var a=document.myform.pname.value;
if(a=="")
{
alert("Enter Item Name");
document.myform.pname.focus();
return false;
}
var b=document.myform.qua.value;
if(b=="" || b<0)
{
alert("Enter Quantity");
document.myform.qua.focus();
return false;
}
var c=document.myform.mes.value;
if(c=="")
{
alert("Enter  Product Measurement");
document.myform.mes.focus();
return false;
}
var d=document.myform.cost.value;
if(d=="" || d<0)
{
alert("Please Enter Cost of eact Item");
document.myform.cost.focus();
return false;
}
var e=document.myform.pic.value;
if(e=="")
{
alert("Please Select Pic");
document.myform.pic.focus();
return false;
}
var f=document.myform.scat.value;
if(f=="<--Sub Category-->")
{
alert("Enter Sub Category");
document.myform.scat.focus();
return false;
}
}
</script>
<%@page import="java.sql.*,databaseconnection.*" %>
<h2>Add Sub Category</h2>
<form action="additem2.jsp" method=post ENCTYPE="multipart/form-data" name="myform" onsubmit="return myformvalidation();">
<table>
<% 
int catid=Integer.parseInt(request.getParameter("catid"));
Connection con=databasecon.getconnection();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from subcategory where cid='"+catid+"'");%>
<tr><td>Product Name</td><td><input type=text name=pname placeholder="Product name"></td></tr>
<tr><td>Quantity</td><td><input type=number size=6 name=qua placeholder="Quantity">&nbsp&nbsp<input type=text size=6 name=mes placeholder="mesurments" ></td></tr>
<tr><td>Cost</td><td><input type=number name=cost placeholder="Item Cost"></td></tr>
<tr><td>Picture</td><td><input type=file name=pic></td></tr>
<tr><td>Select Sub Category</td><td><select name=scat><option><--Sub Category--></option>
<% while(rs.next())
{%>
<option value="<%=rs.getString(1)%>"><%=rs.getString(3)%></option>
<% }
%>
</select></td></tr>
<tr><td></td><td><input type=submit value="Add Item"></td></tr>
</table>
</form>