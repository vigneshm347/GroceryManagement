<%@page import="java.sql.*,databaseconnection.*" %>
<%
String email=request.getParameter("email");
String pass=request.getParameter("pass1");

Connection con=databasecon.getconnection();
Statement st=con.createStatement();
st.executeUpdate("update employee set pass='"+pass+"' where email='"+email+"'");
response.sendRedirect("msg.jsp?msg=Password changed successfully");
%>