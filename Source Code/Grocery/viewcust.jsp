<%@include file="adminhome.jsp" %>
<div style="position:absolute; top:200px; left:400px;">
<%@page import="java.sql.*,databaseconnection.*" %>
<%

Connection con=databasecon.getconnection();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from customer");
String	url1=null,url2=null;
%>
<center><h2>Customers Details</h2></center>
<table border=1><tr><th>Username</th><th>Email</th><th>Gender</th><th>Place</th><th>Phone</th></tr>
<%
while(rs.next())
{

%>
	<tr><td><%=rs.getString(2)%></td><td><%=rs.getString(4)%></td><td><%=rs.getString(5)%></td><td><%=rs.getString(6)%><td><%=rs.getString(7)%></td></tr>
<%}
%>