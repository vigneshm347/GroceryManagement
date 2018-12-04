<%@page import="java.sql.*,databaseconnection.*" %>
<%
String eid=request.getParameter("eid");
String status=request.getParameter("status");

Connection con=databasecon.getconnection();
Statement st=con.createStatement();
st.executeUpdate("update employee set status='"+status+"' where employee_id='"+eid+"'");
response.sendRedirect("viewemp.jsp");
%>