<%@page import="java.sql.*,databaseconnection.*" %>
<%
String eid=request.getParameter("eid");
String uname=request.getParameter("uname");
String email=request.getParameter("email");
String gen=request.getParameter("gen");
String place=request.getParameter("place");
String mob=request.getParameter("mob");
try{
Connection con=databasecon.getconnection();
Statement st=con.createStatement();
int x=st.executeUpdate("update employee set uname='"+uname+"',email='"+email+"',gen='"+gen+"',place='"+place+"',mob='"+mob+"' where employee_id='"+eid+"'");
if(x!=0)
{
response.sendRedirect("emsg.jsp?msg=Profile Updated");
}else
{
response.sendRedirect("emsg.jsp?msg=Fails to Update");
}
}catch(Exception e){
	
System.out.println(e);
}
%>