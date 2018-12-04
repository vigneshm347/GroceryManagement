<%@include file="customerhome.jsp" %>
<div style="position:absolute;top:200px;left:450px;">
<center><h2>Purchase History</h2>
<%@page import="java.sql.*,databaseconnection.*" %>
<%
int cid=(Integer)session.getAttribute("cid");
Connection con=databasecon.getconnection();
Statement st=con.createStatement();
String url=null,url2=null;int tot=0,tot2=0;
ResultSet rs=st.executeQuery("select * from itemorder where cid='"+cid+"' and (status='completed' or status='rejectedp' or status='rejectednp' or status='rejectedpc' or status='rejectednpc')");%>
<table border=1><tr><th>Item Name</th><th>Quantity</th><th>Cost</th><th>Total Cost</th><th>Status</th><th>Action Date</th></tr>
<% while(rs.next())
{ url="remove.jsp?oid="+rs.getInt(1)+"&iid="+rs.getInt(3)+"&qua="+rs.getInt(5);
  
tot2=rs.getInt(5)*rs.getInt(7);
tot=tot+tot2;
%>
	<tr align=center><td><%=rs.getString(4)%></td><td><%=rs.getInt(5)%>&nbsp <%=rs.getString(6)%></td><td><%=rs.getInt(7)%></td>
	<td><%=tot2%></td><td><%if(rs.getString(8).equals("completed")){%>Completed<%}else if(rs.getString(8).equals("rejectedp")){%>Rejected by Store<%}else if(rs.getString(8).equals("rejectednp")){%>Rejected by Store<%}else if(rs.getString(8).equals("rejectednpc")){%>Rejected by You<%}else if(rs.getString(8).equals("rejectedpc")){%>Rejected by You<%} %></td>
	<td><%=rs.getString(9)%></td></tr>
<%}
%>
</table>