<%@page import="java.sql.*,databaseconnection.*" %>
<%
String cid=request.getParameter("cid");
String uname=request.getParameter("uname");
String email=request.getParameter("email");
String gen=request.getParameter("gen");
String place=request.getParameter("place");
String mob=request.getParameter("mob");
try{
Connection con=databasecon.getconnection();
Statement st=con.createStatement();
int x=st.executeUpdate("update customer set uname='"+uname+"',email='"+email+"',gen='"+gen+"',place='"+place+"',mob='"+mob+"' where customer_id='"+cid+"'");
if(x!=0)
{
response.sendRedirect("cmsg.jsp?msg=Profile Updated");
}else
{
response.sendRedirect("cmsg.jsp?msg=Fails to Update");
}
}catch(Exception e){
	
System.out.println(e);
}
%>