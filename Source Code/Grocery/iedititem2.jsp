<%@page import="java.sql.*,databaseconnection.*" %>
<%
int iid=Integer.parseInt(request.getParameter("iid"));
String pname=request.getParameter("pname");
int qua=Integer.parseInt(request.getParameter("qua"));
String mes=request.getParameter("mes");
int cost=Integer.parseInt(request.getParameter("cost"));
int scat=Integer.parseInt(request.getParameter("scat"));
try{
Connection con=databasecon.getconnection();
Statement st=con.createStatement();
st.executeUpdate("update item set iname='"+pname+"',qua='"+qua+"',mes='"+mes+"',cost='"+cost+"',subcat='"+scat+"',datee=now() where item_id='"+iid+"'");
response.sendRedirect("amsg.jsp?msg=Item Updated Successfully");
}catch(Exception e){
	
System.out.println(e);
}
%>