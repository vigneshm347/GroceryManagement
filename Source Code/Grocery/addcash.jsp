<%@include file="customerhome.jsp" %>
<div style="position:absolute;top:250px;left:570px;">
<script>
function myformvalidation()
{
var a=document.myform.cash.value;
if(a=="" || a<1)
{
alert("Please Enter Valid Cash");
document.myform.cash.focus();
return false;
}
var b=document.myform.noc.value;
if(b=="")
{
alert("Please Enter Name on the card");
document.myform.noc.focus();
return false;
}
var c=document.myform.cnum.value;
if(c=="")
{
alert("Enter  Card Number");
document.myform.cnum.focus();
return false;
}
var d=document.myform.val.value;
if(d=="")
{
alert("Please Enter Validity");
document.myform.val.focus();
return false;
}
var e=document.myform.cvv.value;
if(e=="")
{
alert("Enter CVV");
document.myform.cvv.focus();
return false;
}

}
</script>
<center><h2>Add Cash to Wallet</h2></center>
<%@page import="java.sql.*,databaseconnection.*" %>
<%
int cid=(Integer)session.getAttribute("cid");
Connection con=databasecon.getconnection();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from card where cid='"+cid+"'");
if(rs.next())
{%>

  <form action="addcash11.jsp" name="myform" onsubmit="return myformvalidation();">	
	<table>
	<tr><td>Enter Amount :</td><td><input type=number name=cash placeholder="CASH"></td></tr>
	<tr><td>Name on Card:</td><td><input type=text name="noc" value="<%=rs.getString(2)%>"></td></tr>
	<tr><td>Card Number:</td><td><input type=text name="cnum" value="<%=rs.getString(3)%>"></td></tr>
	<tr><td>Validity:</td><td><input type=text name="val" value="<%=rs.getString(4)%>"></td></tr>
	<tr><td>CVV Number:</td><td><input type=text size=6 name="cvv"value="<%=rs.getString(5)%>"></td></tr>
	<tr><td></td><td><input type=submit value="Add"></td></tr>
	</table>
	</form>

<%}else{%>
    <form action="addcash1.jsp">	
	<table>
	<tr><td>Enter Amount :</td><td><input type=number name=cash placeholder="CASH"></td></tr>
	<tr><td>Name on Card:</td><td><input type=text name="noc" placeholder="Name on Card"></td></tr>
	<tr><td>Card Number:</td><td><input type=Number name="cnum" placeholder="Please Enter Card Number"></td></tr>
	<tr><td>Validity:</td><td><input type=text name="val" placeholder="MM/YY"></td></tr>
	<tr><td>CVV Number:</td><td><input type=text size=6 name="cvv" placeholder="CVV"></td></tr>
	<tr><td></td><td><input type=submit value="Pay"></td></tr>
	</table>
	</form>
<%}
%>