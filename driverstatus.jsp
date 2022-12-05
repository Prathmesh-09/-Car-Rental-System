<%@page import="java.sql.*" %>
<%@ page import="java.util.*"%>




<!DOCTYPE html>
<html>
<head>
	<title>Ride Details</title>
	<script language="javascript" type="text/javascript">
		function MyFunction()
		{
			alert("Status changed to Available");
			location.href = "changeStatus.jsp";
			submit();
		}
	</script>
</head>

<body>
	
	<!-- <script language="javascript" type="text/javascript">
		function MyFunction()
		{
			alert("Status changed to Available");
			location.href = "changeStatus.jsp";
			submit();
		}
	</script> -->
<center><h3>Ride Details</h3></center>
<br><br><br><br>
<table width="100%" border="1" cellspacing="10">
 <tr>
	<strong><td><center>Id</center></td>
	<td><center>Name</center></td>
	<td><center>Mobile</center></td>
	<td><center>Customer Mobile</center></td>
	<td><center>Destination</center></td>
	<td><center>Status</center></td>
	<td><center>Edit</center></td>
	
 </tr> 
 <%
	
		
		String db = "project";
     	String user = "root"; 
		String password = "";
        
		Connection con;       
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, password);
        Statement st= con.createStatement( );
		
		String mobile =request.getParameter("dmob") ;
		String emob=request.getParameter("emob");
		{ %>
            <!-- <jsp:include page="booking.jsp" >
                <jsp:param name="emob" value="<%=emob%>"/>
            </jsp:include> -->
       <% }

        rs=st.executeQuery("select * from driver where dmob="+mobile+";");
		while(rs.next())
		{
			int id=rs.getInt("did");
%>
 <tr>
	<strong><td><center><%=rs.getInt("did")%></center></td>
	<td><center><%=rs.getString("dname")%></center></td>
	<td><center><%=rs.getString("dmob")%></center></td>
	<td><center><%=rs.getString("emob")%></center></td>
	<td><center><%=rs.getString("dest")%></center></td>
	<td><center><%=rs.getString("dstatus")%></a></center></td>
	<form action="changeStatus.jsp" method="post">
		<td><center><button type="submit" name="mob" value="<%=mobile%>">Change Status</button></a></center></td>

	</form>
	<!-- <td><input type="submit" value="Change Status"></td> --> 
	<!-- rs=st.executeUpdate("update driver set dstatus='Available' where dmob="+mobile+";"); -->
 </tr>
 <%
		}
%>
</table>

</body>