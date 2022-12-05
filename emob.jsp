<%@page import="java.sql.*" %>
<%@ page import="java.util.*"%>
 
<%
    if(request.getParameter("submit")!=null)
    {
        String emob = request.getParameter("emob");
		
        
		String db = "project";
     	String user = "root"; 
		String password = "";
        
		Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + db, user, password);
        
	}
%>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="style.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <title>Check Status</title>
</head>
<body>
    <div class="adddestination">
    <center><h2 style="margin-left: 5%;">Status</h2></center>
    
    <form action="see.jsp" method="get">
       <center><table cellspacing="20">
            <tr>
                <td  style="width: 600px;"><h4 style="margin-left: 35%;">Enter your Mobile Number here...</h4></td>
            </tr>
            <tr>
                <td style="width: 600px;"><input style="margin-left:40%;" type="tel" maxlength="10" name="emob"></td>
            </tr>
            <tr>
                <td style="width: 600px;"><input class="btn btn-primary" style="margin-left: 300px; margin-top: 10px;" type="submit" name="submit" value="search"></td>
            </tr>
        </table></center> 
    </form>
</div>
</body>
</html>