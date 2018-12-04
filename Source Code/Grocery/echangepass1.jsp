<%@page import="java.sql.*,databaseconnection.*" %>
<%
int eid=(Integer)session.getAttribute("eid");
String pass=request.getParameter("pass1");

Connection con=databasecon.getconnection();
Statement st=con.createStatement();
st.executeUpdate("update employee set pass='"+pass+"' where employee_id='"+eid+"'");
response.sendRedirect("emsg.jsp?msg=Password changed successfully");
%>