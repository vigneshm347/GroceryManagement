<%@page import="java.sql.*,databaseconnection.*" %>
<%
String uname=request.getParameter("uname");
String pass=request.getParameter("pass");
try{
Connection con=databasecon.getconnection();
Statement st=con.createStatement();
Statement st2=con.createStatement();
Statement st3=con.createStatement();
ResultSet rs2=null;
ResultSet rs=st.executeQuery("select * from customer where uname='"+uname+"' and pass='"+pass+"'");
if(rs.next())
{       
	    rs2=st2.executeQuery("select * from wallet where cid='"+rs.getInt(1)+"'");
	    if(rs2.next())
	    {
	    	
	    }else
	    {
	    	st3.executeUpdate("insert into wallet values('"+rs.getInt(1)+"',0)");
	    }
	    session.setAttribute("cid",rs.getInt(1));
		response.sendRedirect("customer.jsp");
	
}else
{
response.sendRedirect("msg.jsp?msg=Invalid Login Details");
}
}
catch(Exception e){
	System.out.println(e);
}

%>