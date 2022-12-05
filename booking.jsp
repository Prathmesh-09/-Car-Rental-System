<%@page import="java.sql.*" %>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="style.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <title>Customer Details</title>
</head>
<body>
    <center><h2 style="margin-top: 15%;">Customer Details</h2></center>

<table style="margin-top: 3%; margin-left: 20px;" width="97%" border="1" cellspacing="10">
 <tr>
	<strong><td><center>Id</center></td>
	<td><center>Name</center></td>
	<td><center>Mobile</center></td>
	<td><center>Destination</center></td>
	<td><center>Status</center></td></strong>
	
	
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
		
		String mobile =request.getParameter("emob") ;

        rs=st.executeQuery("select * from emp where emob="+mobile+";");
		while(rs.next())
		{
			int id=rs.getInt("ID");
%>
<tr>
	<strong><td><center><%=rs.getInt("ID")%></center></td>
	<td><center><%=rs.getString("ename")%></center></td>
	<td><center><%=rs.getString("emob")%></center></td>
	<td><center><%=rs.getString("dest")%></center></td>

 </tr>
 <%
		}
%>
</body>
</html>