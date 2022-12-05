<%@page import="java.sql.*" %>
<%@ page import="java.util.*"%>
 
<%
    if(request.getParameter("submit")!=null)
    {
        String dmob = request.getParameter("dmob");
	
        
		String db = "project";
     	String user = "root"; 
		String password = "";
        
		Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, password);
        
	}
%>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Check Status</title>
</head>
<body>
    <center><h2>Status</h2></center>
    <br><br><br><br>
    <form action="driverstatus.jsp" method="get">
       <center><table cellspacing="20">
            <tr>
                <td>Mobile Number</td>
                <td><input type="tel" maxlength="10" name="dmob"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" name="submit" value="search"></td>
            </tr>
        </table></center> 
    </form>
</body>
</html>