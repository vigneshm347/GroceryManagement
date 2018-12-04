<%@include file="customerhome.jsp" %>
<div style="position:absolute;top:200px;left:500px;">
<%@page import="java.sql.*,databaseconnection.*" %>
<%
int cid=(Integer)session.getAttribute("cid");
Connection con=databasecon.getconnection();
Statement st=con.createStatement();
Statement st2=con.createStatement();
String url=null,url2=null;int tot=0,tot2=0,tot3=0,tot4=0;
ResultSet rs=st.executeQuery("select * from itemorder where cid='"+cid+"' and status='notpaid'");%>
<h2>Payment not Done Items</h2>
<table><tr><th>Item Name</th><th>Quantity</th><th>Cost</th><th>Total Cost</th></tr>
<% while(rs.next())
{ url="remove.jsp?oid="+rs.getInt(1)+"&iid="+rs.getInt(3)+"&qua="+rs.getInt(5);
  
tot2=rs.getInt(5)*rs.getInt(7);
tot=tot+tot2;
%>
	<tr align=center><td><%=rs.getString(4)%></td><td><%=rs.getInt(5)%>&nbsp <%=rs.getString(6)%></td><td><%=rs.getInt(7)%></td><td><%=tot2%></td></tr>
<% }  
url2="payment.jsp?&tot="+tot;
%>
<tr align=center><td></td><td></td><td>Total Cost:</td><td><%=tot%></td></tr>
</table>
<%tot=0;tot2=0; %>
<%
ResultSet rs2=st2.executeQuery("select * from itemorder where cid='"+cid+"' and status='paid'");%>
<h2>Paid Items</h2>
<table><tr><th>Item Name</th><th>Quantity</th><th>Cost</th><th>Total Cost</th><th>Remove</th></tr>
<% while(rs2.next())
{
  
tot4=rs2.getInt(5)*rs2.getInt(7);
tot3=tot3+tot4;
%>
	<tr align=center><td><%=rs2.getString(4)%></td><td><%=rs2.getInt(5)%>&nbsp <%=rs2.getString(6)%></td><td><%=rs2.getInt(7)%></td><td><%=tot4%></td></tr>
<%}
url2="payment.jsp?&tot="+tot;
%>
<tr align=center><td></td><td></td><td>Total Cost:</td><td><%=tot3%></td></tr>
</table>
<%tot3=0;tot4=0; %>