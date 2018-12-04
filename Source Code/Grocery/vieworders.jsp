<%@include file="employeehome.jsp" %>
<div style="position:absolute;top:200px;left:550px;">
<center><h2>Customer Orders</h2></center>
<%@page import="java.sql.*,databaseconnection.*" %>
<%
int cid=0,count=0;
String url=null,status=null,status2=null;
Connection con=databasecon.getconnection();
Statement st=con.createStatement();
Statement st2=con.createStatement();
Statement st3=con.createStatement();
Statement st4=con.createStatement();
ResultSet rs2=null,rs3=null,rs4=null;
ResultSet rs=st.executeQuery("select DISTINCT cid from itemorder where status='paid' or status='notpaid'  order by datee desc");%>
<table border=1><tr><td>Customer</td><td>Items</td><td>status</td></tr>
<% while(rs.next())
{   
	rs2=st2.executeQuery("select * from customer where customer_id='"+rs.getInt(1)+"'");
	if(rs2.next())
	{    url="process.jsp?cid="+rs.getInt(1);
		rs3=st3.executeQuery("select * from itemorder where cid='"+rs.getInt(1)+"' and (status='paid' or status='notpaid')");
		while(rs3.next())
		{
			count++;
			status=rs3.getString(8);
		}
		rs4=st4.executeQuery("select * from status where cid='"+rs.getInt(1)+"'");
		if(rs4.next())
		{
			status2=rs4.getString(4);
			
		}else{
			
			status2="Process";
		}
		%>
		<tr><td><%=rs2.getString(2)%></td><td><%=count%></td><td><%if(status2.equals("Processing")){%><input type=button value="Processing"><%}else{%><a href="<%=url%>"><input type=button value="Process"></a></td><%} %>
		
		</tr>
	<% count=0;}
}
%>