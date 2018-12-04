<%@include file="adminhome.jsp" %>
<div style="position:absolute; top:200px; left:500px;">
<%@page import="java.sql.*,databaseconnection.*,mail.*" %>
<script>
function myFunction() {
var a=document.getElementById("cname").value;
if(a=="<--Category-->")
	{
    alert("Select Valid Category");
	document.myform.cname.focus();
	return false;
	}
window.open("additem1.jsp?catid="+a,"_self");
}
</script>
<center><h2>Add New Item</h2></center>
<% 
try{
	Connection con=databasecon.getconnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from category");%>
	Select Category <select name=cname onChange="myFunction()" id="cname">
	<option><--Category--></option>
	<% while(rs.next())
	{%>
	<option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
	<%} %>
	</select><br><br>
   <%}catch(Exception e){System.out.println(e);}
	%>
	
