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
Statement st2=con.createStatement();
ResultSet rs2=st2.executeQuery("select * from wallet where cid='"+cid+"'");
if(rs2.next())
{
	st.executeUpdate("update wallet set cash='"+(rs2.getInt(2)+cash)+"' where cid='"+cid+"'");
}


st.executeUpdate("insert into card(cid,noc,cnum,val,cvv) values('"+cid+"','"+noc+"','"+cnum+"','"+val+"','"+cvv+"')");
response.sendRedirect("cmsg.jsp?msg= Cash Added to Wallet");
}catch(Exception e){
	
System.out.println(e);
}
%>