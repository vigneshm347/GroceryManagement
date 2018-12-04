<%@include file="customerhome.jsp" %>
<div style="position:absolute;top:200px;left:470px;">
<center><h2>Card Payment</h2>
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

<%@page import="java.sql.*,databaseconnection.*" %>
<%
int cid=(Integer)session.getAttribute("cid");
int tot=Integer.parseInt(request.getParameter("tot"));
Connection con=databasecon.getconnection();
Statement st=con.createStatement();
Statement st3=con.createStatement();
Statement st4=con.createStatement();
Statement st2=con.createStatement();
int wat=0,cash=0,pay=0;
ResultSet rs2=st2.executeQuery("select * from wallet where cid='"+cid+"'");
if(rs2.next())
{
	wat=rs2.getInt(2);
	if((tot-rs2.getInt(2))>=0){cash=0;}else{cash=rs2.getInt(2)-tot;}
	st3.executeUpdate("update wallet set cash='"+cash+"' where cid='"+cid+"'");
	
}
 
if((tot-wat)>0){pay=tot-wat;}else{pay=0;}

%><b>
Total Amount :<%=tot %>&nbsp&nbsp&nbsp
Wallet Amount :<%=wat%>&nbsp&nbsp&nbsp

You Have to pay:<%=pay%></b><br><br>
<%if(pay>0)
{
ResultSet rs=st.executeQuery("select * from card where cid='"+cid+"'");
if(rs.next())
{%>
  <form action="paycard11.jsp" name="myform" onsubmit="return myformvalidation();">	
	<table>
	<tr><td>Amount :</td><td><input type=number name=cash value="<%=pay%>" readonly></td></tr>
	<tr><td>Name on Card:</td><td><input type=text name="noc" value="<%=rs.getString(2)%>"></td></tr>
	<tr><td>Card Number:</td><td><input type=text name="cnum" value="<%=rs.getString(3)%>"></td></tr>
	<tr><td>Validity:</td><td><input type=text name="val" value="<%=rs.getString(4)%>"></td></tr>
	<tr><td>CVV Number:</td><td><input type=text size=6 name="cvv"value="<%=rs.getString(5)%>"></td></tr>
	<tr><td></td><td><input type=submit value="Pay"></td></tr>
	</table>
	</form>

<%}else{%>
    <form action="paycard1.jsp" name="myform" onsubmit="return myformvalidation();">	
	<table>
	<tr><td>Amount :</td><td><input type=number name=cash value="<%=pay%>" readonly></td></tr>
	<tr><td>Name on Card:</td><td><input type=text name="noc" placeholder="Name on Card"></td></tr>
	<tr><td>Card Number:</td><td><input type=Number name="cnum" placeholder="Please Enter Card Number"></td></tr>
	<tr><td>Validity:</td><td><input type=text name="val" placeholder="MM/YY"></td></tr>
	<tr><td>CVV Number:</td><td><input type=text size=6 name="cvv" placeholder="CVV"></td></tr>
	<tr><td></td><td><input type=submit value="Pay"></td></tr>
	</table>
	</form>
<%}
}else{
	st4.executeUpdate("update itemorder set status='paid' where cid='"+cid+"' and status='cart'");%>
	<h2>Payment Done</h2>
<%}
%>