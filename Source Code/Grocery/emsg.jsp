<%@include file="employeehome.jsp" %>
<div style="position:absolute;top:250px;left:500px;">
<%
String msg=request.getParameter("msg");%>

<h class="display"><%=msg%></h>
