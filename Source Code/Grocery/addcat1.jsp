<%@page import="java.sql.*,databaseconnection.*" %>
<%
String cname=request.getParameter("cat");

try{
Connection con=databasecon.getconnection();
Statement st=con.createStatement();
int x=st.executeUpdate("insert into category(cname) values('"+cname+"')");
if(x!=0)
{
response.sendRedirect("amsg.jsp?msg=Category Added Successfully");
}else
{
response.sendRedirect("amsg.jsp?msg=Fails to AdD");
}
}catch(Exception e){
	
System.out.println(e);
}
%>