<%@include file="adminhome.jsp" %>
<div style="position:absolute; top:200px; left:500px;">
<%@page import="java.sql.*,databaseconnection.*" %>

<center><h2>Notifications</h2></center>
<%

Connection con=databasecon.getconnection();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from item where qua=0");
String	url1=null,url2=null;
while(rs.next())
{%>
	<h3>The Item <b><%=rs.getString(2)%> </b> is Out of Stock</h3>
<%}%>