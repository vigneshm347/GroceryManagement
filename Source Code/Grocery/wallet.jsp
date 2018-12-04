<%@include file="customerhome.jsp" %>
<div style="position:absolute;top:250px;left:570px;">
<%@page import="java.sql.*,databaseconnection.*" %>
<%
int cid=(Integer)session.getAttribute("cid");
Connection con=databasecon.getconnection();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from wallet where cid='"+cid+"'");
if(rs.next())
{%>
	<table><tr><td><h2>Balance : </h2></td><td><h2><%=rs.getInt(2)%></h2></td></tr>
	<tr><td><a href="addcash.jsp"><input type=button value="Add Cash"></a></td><td></td></tr>
	</table>
<%}
%>