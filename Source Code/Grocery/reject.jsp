<%@page import="java.sql.*,databaseconnection.*" %>
<%
int eid=(Integer)session.getAttribute("eid");
int cid=Integer.parseInt(request.getParameter("cid"));
int wallet=0;
Connection con=databasecon.getconnection();
Statement st=con.createStatement();
Statement st2=con.createStatement();
Statement st3=con.createStatement();
Statement st4=con.createStatement();
Statement st5=con.createStatement();
Statement st6=con.createStatement();
Statement st7=con.createStatement();
ResultSet rs3=null,rs5=null,rs6=null;
ResultSet rs2=st2.executeQuery("select * from itemorder where cid='"+cid+"' and status='paid' or status='notpaid'");
while(rs2.next())
{
	rs3=st3.executeQuery("select * from item where item_id='"+rs2.getInt(3)+"'");
	if(rs3.next())
	{
		st4.executeUpdate("update item set qua='"+(rs3.getInt(3)+rs2.getInt(5))+"' where item_id='"+rs3.getInt(1)+"'");
	}

}

rs5=st5.executeQuery("select * from itemorder where cid='"+cid+"' and status='paid'");
while(rs5.next())
{
wallet=wallet+(rs5.getInt(5)*rs5.getInt(7));	
}

rs6=st6.executeQuery("select * from wallet where cid='"+cid+"'");
while(rs6.next())
{
	st7.executeUpdate("update wallet set cash='"+(rs6.getInt(2)+wallet)+"' where cid='"+cid+"'");
	st7.executeUpdate("insert into notification value('"+cid+"','"+eid+"','Your Cash is returned to Your Wallet','no',now())");
}

st.executeUpdate("delete from status where cid='"+cid+"'");
st.executeUpdate("update itemorder set status='rejectedp',datee=now() where cid='"+cid+"' and status='paid'");
st.executeUpdate("update itemorder set status='rejectednp',datee=now() where cid='"+cid+"' and status='notpaid'");
st.executeUpdate("insert into notification value('"+cid+"','"+eid+"','Your Product Request has been Rejected.','no',now())");
response.sendRedirect("emsg.jsp?msg=Order Rejected Successfully");
%>