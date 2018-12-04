<%@include file="employeehome.jsp" %>
<div style="position:absolute; top:230px; left:550px;">
<%@page import="java.sql.*,databaseconnection.*" %>
<%
int eid=(Integer)session.getAttribute("eid");
Connection con=databasecon.getconnection();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from employee where employee_id='"+eid+"'");
String	url1=null;
if(rs.next())
{
   url1="editeprofile.jsp?eid="+eid;
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