<%@page import="java.sql.*,databaseconnection.*" %>
<%
int cid=(Integer)session.getAttribute("cid");
int iid=Integer.parseInt(request.getParameter("iid"));
int oid=Integer.parseInt(request.getParameter("oid"));
int qua=Integer.parseInt(request.getParameter("qua"));
int qua2=Integer.parseInt(request.getParameter("qua2"));

Connection con=databasecon.getconnection();
Statement st2=con.createStatement();
Statement st=con.createStatement();
Statement st3=con.createStatement();
Statement st4=con.createStatement();
ResultSet rs=null,rs4=null;int qua3=0;
if(qua2>qua)
{   qua3=qua2-qua;
	rs4=st4.executeQuery("select * from item where item_id='"+iid+"'");
	if(rs4.next())
	{
		if(rs4.getInt(3)<qua3)
		{
			response.sendRedirect("cmsg.jsp?msg=Required number of items are not Avaliable.Only  "+rs4.getInt(3)+ "available");
		}else
		{  
			st3.executeUpdate("update item set qua='"+(rs4.getInt(3)-qua3)+"' where item_id='"+iid+"'");
			st3.executeUpdate("update itemorder set qua='"+qua2+"' where order_id='"+oid+"'");
		   response.sendRedirect("cmsg.jsp?msg=Item Updated in Cart");
		}
	}

}else
{
	 rs=st.executeQuery("select * from item where item_id='"+iid+"'");
	if(rs.next())
	{ qua3=qua-qua2;
		st2.executeUpdate("update item set qua='"+(rs.getInt(3)+qua3)+"' where item_id='"+iid+"'");
		st2.executeUpdate("update itemorder set qua='"+qua2+"' where order_id='"+oid+"'");
	   response.sendRedirect("cmsg.jsp?msg=Item Updated in Cart");
	}

}

%>