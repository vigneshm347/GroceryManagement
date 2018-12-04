<%@page import="java.sql.*,databaseconnection.*,mail.*" %>
<%
String email=request.getParameter("email");

String msg ="click the following link to reset Your Password  http://localhost:2016/Grocery/ereset.jsp?email="+email;

Connection con=databasecon.getconnection();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from employee where email='"+email+"'");
if(rs.next())
{
	boolean status=Mail.mailsend(email, msg);
	if(status==true)
	{
	response.sendRedirect("msg.jsp?msg=Please Check your Email");
	}else
	{
		response.sendRedirect("msg.jsp?msg=Fails to send Email");
	}
}
else
{
	response.sendRedirect("msg.jsp?msg=Invalid Email Address");
}

%>