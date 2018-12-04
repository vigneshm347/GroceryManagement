<%@page import="java.sql.*,databaseconnection.*" %>
<%

int cid=Integer.parseInt(request.getParameter("cid"));
Connection con=databasecon.getconnection();
Statement st=con.createStatement();
st.executeUpdate("update itemorder set status='completed',datee=now() where cid='"+cid+"' and status='processedp'");
st.executeUpdate("update itemorder set status='completed',datee=now() where cid='"+cid+"' and status='processednp'");
st.executeUpdate("insert into notification value('"+cid+"','"+cid+"','Thank you For using our services','no',now())");
response.sendRedirect("cmsg.jsp?msg=Order Purchased Successfully");
%>