<%@include file="customerhome.jsp" %>
<div style="position:absolute;top:200px;left:450px;">
<%@page import="java.sql.*,databaseconnection.*" %>
<center><h2>Cart</h2></center>
<%
int cid=(Integer)session.getAttribute("cid");
Connection con=databasecon.getconnection();
Statement st=con.createStatement();
int x=0;
String url=null,url3=null,url2=null;int tot=0,tot2=0;
ResultSet rs=st.executeQuery("select * from itemorder where cid='"+cid+"' and status='cart'");%>
<table><tr><th>Item Name</th><th>Quantity</th><th>Cost</th><th>Total Cost</th><th>Edit</th><th>Remove</th></tr>
<% while(rs.next())
{ url="remove.jsp?oid="+rs.getInt(1)+"&iid="+rs.getInt(3)+"&qua="+rs.getInt(5);
  url3="editcart.jsp?oid="+rs.getInt(1)+"&iid="+rs.getInt(3)+"&qua="+rs.getInt(5);
  x++;
  
tot2=rs.getInt(5)*rs.getInt(7);
tot=tot+tot2;
%>
	<tr align=center><td><%=rs.getString(4)%></td><td><%=rs.getInt(5)%>&nbsp <%=rs.getString(6)%></td><td><%=rs.getInt(7)%></td><td><%=tot2%></td><td><a href="<%=url3%>"><input type=button value=Edit></a></td><td><a href="<%=url%>"><input type=button value=Remove></a></td></tr>
<%}
url2="payment.jsp?&tot="+tot;
if(x>0){
%>
<tr align=center><td></td><td></td><td>Total Cost:</td><td><%=tot%></td><td><a href="<%=url2%>"><input type=button value="Make Payment"></a></td></tr>
<%} else{%>
	
	<tr align=center><td></td><td></td><td>Cart Is Empty</td><td></td><td></td></tr>
<%}%>
</table>