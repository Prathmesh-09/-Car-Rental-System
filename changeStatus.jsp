<%@page import="java.sql.*" %>
<%@ page import="java.util.*"%>


<%
	

    String db = "project";
    String user = "root"; 
    String password = "";

    Connection con;       
    ResultSet rst;

    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + db, user, password);
    Statement st= con.createStatement( );
    PreparedStatement pst;
    String mobile = request.getParameter("mob");
    st.executeUpdate("update driver set dstatus='Available',emob='' where dmob="+mobile+";");

        
%>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="style.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <title>changeStatus</title>
</head>
<body>
    <div style="margin-left: 45%; margin-top: 20%;">
        <h2>Status changed to Available</h2>
        <h3>Click the button to login again...</h3>
        <button class="btn btn-primary" type="submit" onclick="window.location = 'login.jsp';">Login</button>
    </div>
    
</body>
</html>