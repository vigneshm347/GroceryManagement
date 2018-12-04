<%@include file="customerhome.jsp" %>
<div style="position:absolute;top:200px;left:400px;">
<center><h2>Notifications</h2>
<%@page import="java.sql.*,databaseconnection.*" %>
<%
int cid=(Integer)session.getAttribute("cid");
Connection con=databasecon.getconnection();
Statement st=con.createStatement();
Statement st2=con.createStatement();
ResultSet rs=st.executeQuery("select * from notification where cid='"+cid+"' order by datee desc");
while(rs.next())
{
if(rs.getString(4).equals("no")){%><h3><font color=green><%=rs.getString(3)%></font></h3><%}else{%><h3><%=rs.getString(3)%></h3><%}
}

st2.executeUpdate("update notification set status='yes' where cid='"+cid+"'");
%>