<%@page import="java.sql.*,databaseconnection.*" %>
<%
int cid=(Integer)session.getAttribute("cid");
String pass=request.getParameter("pass1");

Connection con=databasecon.getconnection();
Statement st=con.createStatement();
st.executeUpdate("update customer set pass='"+pass+"' where customer_id='"+cid+"'");
response.sendRedirect("cmsg.jsp?msg=Password changed successfully");
%>