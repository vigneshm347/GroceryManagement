<%@include file="adminhome.jsp" %>
<div style="position:absolute; top:200px; left:500px;">
<%@page import="java.sql.*,databaseconnection.*" %>
<%

Connection con=databasecon.getconnection();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from category");
String	url1=null,url2=null;
%>
<center><h2>Category Details</h2></center>

<table border=1><tr><th>Category Name</th><th>View SubCategory</th><th>Edit</th></tr>
<%
while(rs.next())
{
url1="viewscat.jsp?cid="+rs.getString(1);
url2="editcat.jsp?cid="+rs.getString(1);
%>
	<tr><td><%=rs.getString(2)%></td><td><a href="" onclick="window.open('<%=url1%>','name','width=400,height=400')">View SubCategory</a></td><td><a href="<%=url2%>"><input type=button value=Edit></a></td></tr>
<%}
%>