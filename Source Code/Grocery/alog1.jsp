<%@page import="java.sql.*,databaseconnection.*" %>
<%
String uname=request.getParameter("uname");
String pass=request.getParameter("pass");

Connection con=databasecon.getconnection();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from admin where uname='"+uname+"' and pass='"+pass+"'");
if(rs.next())
{
response.sendRedirect("admin.jsp");
}else
{
response.sendRedirect("msg.jsp?msg=Invalid Login Details");
}
%>