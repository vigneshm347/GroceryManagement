<%@page import="java.sql.*,databaseconnection.*" %>
<%
String uname=request.getParameter("uname");
String pass=request.getParameter("pass");
String email=request.getParameter("email");
String gen=request.getParameter("gen");
String place=request.getParameter("place");
String mob=request.getParameter("mob");
try{
Connection con=databasecon.getconnection();
Statement st=con.createStatement();
int x=st.executeUpdate("insert into employee(uname,pass,email,gen,place,mob,status) values('"+uname+"','"+pass+"','"+email+"','"+gen+"','"+place+"','"+mob+"','no')");
if(x!=0)
{
response.sendRedirect("msg.jsp?msg=Registration Success");
}else
{
response.sendRedirect("msg.jsp?msg=Employee Already Exist");
}
}catch(Exception e){
	
System.out.println(e);
response.sendRedirect("msg.jsp?msg=Employee Already Exist");
}
%>