<%@include file="customerhome.jsp" %>
<div style="position:absolute;top:200px;left:550px;">
<center><h2>Make Payment</h2>
<%@page import="java.sql.*,databaseconnection.*" %>
<%
int cid=(Integer)session.getAttribute("cid");
int tot=Integer.parseInt(request.getParameter("tot"));
String url="paycard.jsp?tot="+tot;
String url2="paypicup.jsp?tot="+tot;
%>

<h2>Total Cost:<%=tot %></h2>

Please Choose Payment Method<br><br>
<a href="<%=url%>"><input type=button value="Pay Now"></a>&nbsp&nbsp&nbsp<a href="<%=url2%>"><input type=button value="pay on Picup"></a>
  </center>