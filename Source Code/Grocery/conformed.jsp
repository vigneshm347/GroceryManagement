<%@include file="customerhome.jsp" %>
<div style="position:absolute;top:200px;left:500px;">
<%@page import="java.sql.*,databaseconnection.*" %>
<%
int cid=(Integer)session.getAttribute("cid");
Connection con=databasecon.getconnection();
Statement st=con.createStatement();
Statement st2=con.createStatement();
String url=null,url2=null;int tot=0,tot2=0,tot3=0,tot4=0;
int x=0;
ResultSet rs=st.executeQuery("select * from itemorder where cid='"+cid+"' and status='processednp'");
url="conformed1.jsp?cid="+cid;
url2="rejected.jsp?cid="+cid;
%>
<h2>Payment not Done Items</h2>
<table><tr><th>Item Name</th><th>Quantity</th><th>Cost</th><th>Total Cost</th></tr>
<% while(rs.next())
{
  x++;
tot2=rs.getInt(5)*rs.getInt(7);
tot=tot+tot2;
%>
	<tr align=center><td><%=rs.getString(4)%></td><td><%=rs.getInt(5)%>&nbsp <%=rs.getString(6)%></td><td><%=rs.getInt(7)%></td><td><%=tot2%></td></tr>
<% }  

%>
<tr align=center><td></td><td></td><td>Total Cost:</td><td><%=tot%></td></tr>
</table>
<%tot=0;tot2=0; %>
<%
ResultSet rs2=st2.executeQuery("select * from itemorder where cid='"+cid+"' and status='processedp'");%>
<h2>Paid Items</h2>
<table><tr><th>Item Name</th><th>Quantity</th><th>Cost</th><th>Total Cost</th><th>Remove</th></tr>
<% while(rs2.next())
{
 x++; 
tot4=rs2.getInt(5)*rs2.getInt(7);
tot3=tot3+tot4;
%>
	<tr align=center><td><%=rs2.getString(4)%></td><td><%=rs2.getInt(5)%>&nbsp <%=rs2.getString(6)%></td><td><%=rs2.getInt(7)%></td><td><%=tot4%></td></tr>
<%}

%>
<tr align=center><td></td><td></td><td>Total Cost:</td><td><%=tot3%></td></tr>
</table>
<%if(x>0){ %>
<a href="<%=url%>"><input type=button value="Process"></a>&nbsp&nbsp&nbsp<a href="<%=url2%>"><input type=button value="Reject"></a>
<%} tot3=0;tot4=0; %>