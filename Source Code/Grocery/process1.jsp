<%@page import="java.sql.*,databaseconnection.*" %>
<%
int eid=(Integer)session.getAttribute("eid");
int cid=Integer.parseInt(request.getParameter("cid"));
Connection con=databasecon.getconnection();
Statement st=con.createStatement();
st.executeUpdate("delete from status where cid='"+cid+"'");
st.executeUpdate("update itemorder set status='processedp' where cid='"+cid+"' and status='paid'");
st.executeUpdate("update itemorder set status='processednp' where cid='"+cid+"' and status='notpaid'");
st.executeUpdate("insert into notification value('"+cid+"','"+eid+"','Your Product Request has been accepted.Please conform your order','no',now())");
response.sendRedirect("emsg.jsp?msg=Order Accepted Successfully");
%>