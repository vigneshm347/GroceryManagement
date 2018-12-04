<%@page import="java.sql.*,databaseconnection.*" %>
<%
int cid=(Integer)session.getAttribute("cid");
int cash=Integer.parseInt(request.getParameter("cash"));
String noc=request.getParameter("noc");
String cnum=request.getParameter("cnum");
String val=request.getParameter("val");
String cvv=request.getParameter("cvv");

try{
Connection con=databasecon.getconnection();
Statement st=con.createStatement();
st.executeUpdate("update card set noc='"+noc+"',cnum='"+cnum+"',val='"+val+"',cvv='"+cvv+"' where cid='"+cid+"'");
st.executeUpdate("update itemorder set status='paid' where cid='"+cid+"' and status='cart'");
response.sendRedirect("cmsg.jsp?msg=Payment Done");
}catch(Exception e){
	
System.out.println(e);
}
%>