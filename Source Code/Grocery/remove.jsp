<%@page import="java.sql.*,databaseconnection.*" %>
<%
int cid=(Integer)session.getAttribute("cid");
int iid=Integer.parseInt(request.getParameter("iid"));
int oid=Integer.parseInt(request.getParameter("oid"));
int qua=Integer.parseInt(request.getParameter("qua"));

Connection con=databasecon.getconnection();
Statement st2=con.createStatement();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from item where item_id='"+iid+"'");
if(rs.next())
{
	st2.executeUpdate("update item set qua='"+(rs.getInt(3)+qua)+"' where item_id='"+iid+"'");
	st2.executeUpdate("delete from itemorder where order_id='"+oid+"'");
   response.sendRedirect("cmsg.jsp?msg=Item Removed from Cart");
}
%>