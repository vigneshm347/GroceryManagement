<%@include file="adminhome.jsp" %>
<div style="position:absolute; top:200px; left:500px;">
<%@page import="java.sql.*,databaseconnection.*,mail.*" %>
<script>
function myFunction() {
var a=document.getElementById("cname").value;
if(a=="<--Item-->")
{
alert("Select Valid Item");
document.myform.cname.focus();
return false;
}
window.open("iedititem1.jsp?iid="+a,"_self");
}
</script>
<center><h2>Edit Item Including Image</h2></center>
<% 
try{
	Connection con=databasecon.getconnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from item");%>
	Select Item <select name=iname onChange="myFunction()" id="cname">
	<option><--Item--></option>
	<% while(rs.next())
	{%>
	<option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
	<%} %>
	</select><br><br>
   <%}catch(Exception e){System.out.println(e);}
	%>
	
