<%@page import="java.sql.*,databaseconnection.*" %>
<%
String cid=request.getParameter("cid");
String cname=request.getParameter("cat");

Connection con=databasecon.getconnection();
Statement st=con.createStatement();
st.executeUpdate("update category set cname='"+cname+"' where category_id='"+cid+"'");
response.sendRedirect("amsg.jsp?msg=Category Updated");
%>