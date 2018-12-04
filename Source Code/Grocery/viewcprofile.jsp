<%@include file="customerhome.jsp" %>
<div style="position:absolute; top:230px; left:550px;">
<%@page import="java.sql.*,databaseconnection.*" %>
<%
int cid=(Integer)session.getAttribute("cid");
Connection con=databasecon.getconnection();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from customer where customer_id='"+cid+"'");
String	url1=null;
if(rs.next())
{
   url1="editcprofile.jsp?cid="+cid;
%>
<center><h2><%=rs.getString(2)%>'s Profile</h2></center>
<table>
<tr><td>Username</td><td><%=rs.getString(2)%></td></tr>
<tr><td>Email</td><td><%=rs.getString(4)%></td></tr>
<tr><td>Gender</td><td><%=rs.getString(5)%></td></tr>
<tr><td>Place</td><td><%=rs.getString(6)%></td></tr>
<tr><td>Phone</td><td><%=rs.getString(7)%></td></tr>
<tr><td></td><td><a href="<%=url1%>"><input type=button value="Edit"></a></td></tr>
<%}%>