<%@page import="java.sql.*,databaseconnection.*" %>
<%
String uname=request.getParameter("uname");
String pass=request.getParameter("pass");
try{
Connection con=databasecon.getconnection();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from employee where uname='"+uname+"' and pass='"+pass+"'");
if(rs.next())
{
	if(rs.getString(8).equals("yes"))
	{  session.setAttribute("eid",rs.getInt(1));
		response.sendRedirect("employee.jsp");
	}else
	{
		response.sendRedirect("msg.jsp?msg=Account Not Yet Acivated");
	}

}else
{
response.sendRedirect("msg.jsp?msg=Invalid Login Details");
}
}
catch(Exception e){
	System.out.println(e);
}

%>