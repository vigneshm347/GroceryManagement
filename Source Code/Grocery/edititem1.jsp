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
alert("Enter Valid Quantity");
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
alert("Please Enter Valid Cost of eact Item");
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
<center><h2>Edit Item Including Image</h2></center>
<form action="edititem2.jsp" method=post ENCTYPE="multipart/form-data" name="myform" onsubmit="return myformvalidation();">
<table>
<% 
int iid=Integer.parseInt(request.getParameter("iid"));
Connection con=databasecon.getconnection();
Statement st=con.createStatement();
Statement st2=con.createStatement();
Statement st3=con.createStatement();
ResultSet rs2=null,rs3=null;
String image=null;
int cid2=0;
ResultSet rs=st.executeQuery("select * from item where item_id='"+iid+"'");
if(rs.next())
{image="Items//"+rs.getString(6);
%>

<tr><td></td><td><img src="<%=image%>" height="100" width="100"></td></tr>
<input type=hidden name=iid value="<%=rs.getInt(1)%>">
<tr><td>Product Name</td><td><input type=text name=pname value="<%=rs.getString(2)%>"></td></tr>
<tr><td>Quantity</td><td><input type=number size=6 name=qua  value="<%=rs.getInt(3)%>">&nbsp&nbsp<input type=text size=6 name=mes value="<%=rs.getString(4)%>" ></td></tr>
<tr><td>Cost</td><td><input type=number name=cost value="<%=rs.getInt(5)%>"></td></tr>
<tr><td>Picture</td><td><input type=file name=pic></td></tr>
<tr><td>Select Sub Category</td><td><select name=scat><option><--Sub Category--></option>
<% 
rs2=st2.executeQuery("select cid from subcategory where subcategory_id='"+rs.getInt(7)+"'");
if(rs2.next())
{
	rs3=st3.executeQuery("select * from subcategory where cid='"+rs2.getInt(1)+"'");
	while(rs3.next())
	{%>
	<option value="<%=rs3.getInt(1)%>"  <% if(rs3.getInt(1)==rs.getInt(7)){%>selected<%} %>><%=rs3.getString(3)%></option>
	<% }
}
}
%>
</select></td></tr>
<tr><td></td><td><input type=submit value="Update Item"></td></tr>
</table>
</form>