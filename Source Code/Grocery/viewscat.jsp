<body>
<%@page import="java.sql.*,databaseconnection.*" %>
<%
String cid=request.getParameter("cid");
Connection con=databasecon.getconnection();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from subcategory where cid='"+cid+"'");
%>
<h3>Sub Category Details</h3>
<table border=1><tr><th>Sub Category Name</th></tr>
<%
while(rs.next())
{
%>
	<tr><td><%=rs.getString(3)%></td></tr>
<%}
%>