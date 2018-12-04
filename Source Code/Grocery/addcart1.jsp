<%@page import="java.sql.*,databaseconnection.*" %>
<%
int cid=(Integer)session.getAttribute("cid");
int iid=Integer.parseInt(request.getParameter("iid"));
int qua=Integer.parseInt(request.getParameter("qua"));
int qua2=Integer.parseInt(request.getParameter("qua2"));
if(qua2<qua)
{
	response.sendRedirect("cmsg.jsp?msg=Not Enought Items");
}else if(qua<1)
{
	response.sendRedirect("cmsg.jsp?msg=Can not Pass -ve Numbers");
}else
{
Connection con=databasecon.getconnection();
Statement st2=con.createStatement();
Statement st3=con.createStatement();
Statement st=con.createStatement();
ResultSet rs3=null;
ResultSet rs=st.executeQuery("select * from item where item_id='"+iid+"'");
if(rs.next())
{
	st2.executeUpdate("update item set qua='"+(rs.getInt(3)-qua)+"' where item_id='"+iid+"'");
	 
	rs3=st3.executeQuery("select * from itemorder where cid='"+cid+"' and iid='"+iid+"' and status='cart'");
	if(rs3.next())
	{ 
		st2.executeUpdate("update itemorder set qua='"+(rs3.getInt(5)+qua)+"' where order_id='"+rs3.getInt(1)+"'");
	}else
	{
	st2.executeUpdate("insert into itemorder(cid,iid,iname,qua,mes,cost,status,datee) values('"+cid+"','"+iid+"','"+rs.getString(2)+"','"+qua+"','"+rs.getString(4)+"','"+rs.getInt(5)+"','cart',now())");
	}
	response.sendRedirect("cmsg.jsp?msg=Item Added to Cart");
}}
%>