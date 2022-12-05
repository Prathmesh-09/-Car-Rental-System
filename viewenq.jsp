<%@page import="java.sql.*" %>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="style.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<title>Enquiry Details</title>
</head>
<body>
<center><h2>Enquiry Details</h2></center>
<br><br><br><br>
<table width="100%" border="1">
 <tr>
	<strong><td><center>Id</center></td>
	<td><center>Name</center></td>
	<td><center>Mobile</center></td>
	<td><center>Destination</center></td>
    <td><center>Date</center></td>
    <td><center>Time</center></td>
	<td><center>Remark</center></td>
	<td><center>Delete</center></td></strong>
 </tr>
 <%
	
		
		String db = "project";
     	String user = "root"; 
		String password = "";
        
		Connection con;       
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + db, user, password);
        Statement st= con.createStatement( );
		
        rs=st.executeQuery("select * from emp where remark='Accepted';");
		while(rs.next())
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
	<td><center><a href="delete.jsp?id=<%=id%>">Delete</a></center></td></strong>
 </tr>
 <%
		}
%>
</table>
</body>