<%@include file="adminhome.jsp" %>
<div style="position:absolute; top:200px; left:300px;">
<%@page import="java.sql.*,databaseconnection.*" %>
<%

Connection con=databasecon.getconnection();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from employee");
String	url1=null,url2=null;
%>
<center><h2>Employees Details</h2></center>
<table border=1><tr><th>Username</th><th>Email</th><th>Gender</th><th>Place</th><th>Phone</th><th>Status</th><th>Change Status</th></tr>
<%
while(rs.next())
{
url1="status.jsp?status=yes&eid="+rs.getString(1);
url2="status.jsp?status=no&eid="+rs.getString(1);
%>
	<tr><td><%=rs.getString(2)%></td><td><%=rs.getString(4)%></td><td><%=rs.getString(5)%></td><td><%=rs.getString(6)%><td><%=rs.getString(7)%></td>
	<td><%=rs.getString(8)%></td><td><%if(rs.getString(8).equals("no")){ %><a href="<%=url1%>">Activate</a><%}else{ %> <a href="<%=url2%>">Deactivate</a><%} %></td></tr>
<%}
%>