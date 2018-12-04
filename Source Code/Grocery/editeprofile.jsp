<%@include file="employeehome.jsp" %>
<div style="position:absolute; top:230px; left:550px;">
<script>
function myformvalidation()
{
var a=document.myform.uname.value;
if(a=="")
{
alert("Choose Username");
document.myform.uname.focus();
return false;
}

var c=document.myform.email.value;
if(c=="")
{
alert("Enter  Email");
document.myform.email.focus();
return false;
}
var d=document.myform.gen.value;
if(d=="")
{
alert("Please Select Gender");
document.myform.email.focus();
return false;
}
var e=document.myform.place.value;
if(e=="")
{
alert("Enter Place");
document.myform.place.focus();
return false;
}
var f=document.myform.mob.value;
if(f=="")
{
alert("Enter Phone");
document.myform.mob.focus();
return false;
}
}
</script>
<%@page import="java.sql.*,databaseconnection.*" %>
<%
int eid=(Integer)session.getAttribute("eid");
Connection con=databasecon.getconnection();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from employee where employee_id='"+eid+"'");
String	url1=null;
if(rs.next())
{%>
<center><h2><%=rs.getString(2)%>'s Profile Edit</h2></center>
<form action="editeprofile1.jsp" name="myform" onsubmit="return myformvalidation();">
<table>
<input type=hidden name=eid value="<%=rs.getString(1)%>">
<tr><td>Username</td><td><input type=text name=uname autofocus value="<%=rs.getString(2)%>" ></td></tr>
<tr><td>Email</td><td><input type=email name=email  value="<%=rs.getString(4)%>"></td></tr>
<tr><td>Gender</td><td><input type=radio name=gen value=Male <%if(rs.getString(5).equals("Male")){%>checked<%} %>>Male &nbsp&nbsp<input type=radio name=gen value=Female <%if(rs.getString(5).equals("Female")){%>checked<%} %>>Female</td></tr>
<tr><td>Place</td><td><input type=text name=place   value="<%=rs.getString(6)%>"></td></tr>
<tr><td>Phone</td><td><input type=number name=mob value="<%=rs.getString(7)%>"></td></tr>
<tr><td></td><td><input type=submit value="Update"></td></tr>
</table>
</form>
<%} %>