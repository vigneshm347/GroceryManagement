<%@include file="customerhome.jsp" %>
<div style="position:absolute;top:200px;left:500px;">
<script>
function myformvalidation()
{
var a=document.myform.qua2.value;
if(a=="")
{
alert("Please Enter Valid Number of Items");
document.myform.qua2.focus();
return false;
}
}
</script>
<center><h2>Edit Cart</h2></center>
<%@page import="java.sql.*,databaseconnection.*" %>
<%

int iid=Integer.parseInt(request.getParameter("iid"));
int oid=Integer.parseInt(request.getParameter("oid"));
int qua=Integer.parseInt(request.getParameter("qua"));%>

<form action="editcart1.jsp" name="myform" onsubmit="return myformvalidation();">
<input type=hidden name=iid value="<%=iid%>">
<input type=hidden name=oid value="<%=oid%>">
<input type=hidden name=qua value="<%=qua%>">
Modify Quantity<input type=number name=qua2 value="<%=qua%>">
<input type=submit value="Modify">
</form>