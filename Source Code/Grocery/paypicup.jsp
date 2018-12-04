<%@page import="java.sql.*,databaseconnection.*" %>
<%
int cid=(Integer)session.getAttribute("cid");
try{
Connection con=databasecon.getconnection();
Statement st=con.createStatement();
st.executeUpdate("update itemorder set status='notpaid' where cid='"+cid+"' and status='cart'");
response.sendRedirect("cmsg.jsp?msg=Please make the Payment at Time of Picup");
}catch(Exception e){
	
System.out.println(e);
}
%>