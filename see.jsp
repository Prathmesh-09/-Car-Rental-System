<%@page import="java.sql.*" %>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="style.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<title>Ride Details</title>
</head>
<body>

 <%
	
		
		String db = "project";
     	String user = "root"; 
		String password = "";
        
		Connection con;       
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3307/" + db, user, password);
        Statement st= con.createStatement( );
		
		String mobile =request.getParameter("emob") ;

        rs=st.executeQuery("select * from emp where emob="+mobile+";");
		if(!rs.next())
		{
			response.sendRedirect("x.jsp");
		}
		else
		{ %>
			<center><h2 style="margin-top: 15%;">Ride Details</h2></center>
		<br><br>
		<table width="100%" border="1" cellspacing="10">
		 <tr>
			<strong><td><center>Id</center></td>
			<td><center>Name</center></td>
			<td><center>Mobile</center></td>
			<td><center>Destination</center></td>
			<td><center>Date</center></td>
			<td><center>Time</center></td>
			<td><center>Remark</center></td>
			
		 </tr>
			<% do
			{
				int id=rs.getInt("id");
	%>
 <tr>
	<strong><td><center><%=rs.getInt("id")%></center></td>
	<td><center><%=rs.getString("ename")%></center></td>
	<td><center><%=rs.getString("emob")%></center></td>
	<td><center><%=rs.getString("dest")%></center></td>
	<td><center><%=rs.getString("date")%></center></td>
	<td><center><%=rs.getString("time")%></center></td>
	<td><center><%=rs.getString("remark")%></center></td>
 </tr>
 <%
		}while(rs.next());}
%>
</table>
</body>