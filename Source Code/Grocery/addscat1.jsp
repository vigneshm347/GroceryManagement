<%@page import="java.sql.*,databaseconnection.*" %>
<%
String cid=request.getParameter("cat");
String scname=request.getParameter("scat");

try{
Connection con=databasecon.getconnection();
Statement st=con.createStatement();
int x=st.executeUpdate("insert into subcategory(cid,scname) values('"+cid+"','"+scname+"')");
if(x!=0)
{
response.sendRedirect("amsg.jsp?msg=Sub Category Added Successfully");
}else
{
response.sendRedirect("amsg.jsp?msg=Fails to AdD");
}
}catch(Exception e){
	
System.out.println(e);
}
%>