<%@include file="customerhome.jsp" %>

<head>
   <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="css/verticaldrop.css">
   <script src="js/jquery-latest.min.js" type="text/javascript"></script>
   <script src="script.js"></script>
   
</head>

<%@page import="java.sql.*,databaseconnection.*" %>
<%

Connection con=databasecon.getconnection();
Statement st=con.createStatement();
Statement st2=con.createStatement();
Statement st3=con.createStatement();
ResultSet rs2=null,rs3=null;
String url=null,url2=null;
ResultSet rs=st.executeQuery("select * from item");
int a=0;
int top=-100,left=100;
while(rs.next())
{
if(a%5==0){
	top=top+250;
	left=300;
}else
{
left=left+200;	
}
%>
<div style="position:absolute;top:<%=top%>px; left:<%=left%>;">
<form action="addcart1.jsp" >
<input type=hidden name=iid value=<%=rs.getInt(1)%>>
<input type=hidden name=qua2 value=<%=rs.getInt(3)%>>
<table>
<tr><td><img src="Items//<%=rs.getString(6)%>" width=100 height=100></td></tr>
<tr><td><h3><%=rs.getString(2)%></h3></td></tr>
<tr><td>
<table><tr><td>Available :</td><td><%=rs.getInt(3)%>&nbsp&nbsp<%=rs.getString(4)%></td></tr>
<tr><td>Price:</td><td><%=rs.getInt(5)%></td></tr>
<%if(rs.getInt(3)<=0){%>
	</table></td></tr><tr><td><b>Out of Stock</b></td></tr>
<%}else{%>
	<tr><td><input type=text size=6 name=qua ></td><td><input type=submit value="Add to Cart"></td></tr>
<% } %>

</table>
</td></tr>
</table>
</form>
</div>
<%a++;}
%>


<%
rs2=st2.executeQuery("select * from category");%>
<div style="position:absolute; top:150px; left:10px;">
<div id='cssmenu2'>
	<ul><li class='active'><a href='viewitems.jsp'><span>View All</span></a></li>
<%while(rs2.next())
{
	url="viewitems1.jsp?cat="+rs2.getInt(1);%>
	
	<li class='active has-sub'><a href='<%=url%>'><span><%=rs2.getString(2)%></span></a> <ul>
	<% rs3=st3.executeQuery("select * from subcategory where cid='"+rs2.getInt(1)+"'");
	 while(rs3.next())
	 {
		 url2="viewitems2.jsp?scat="+rs3.getInt(1);%>
		 
		
         <li><a href='<%=url2%>'><span><%=rs3.getString(3)%></span></a></li>
     
	<% }%>
	 </ul></li>
	<%}
%></ul></div>

</div>