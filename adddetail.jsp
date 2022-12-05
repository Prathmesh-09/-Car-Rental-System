<%@page import="java.sql.*" %>
<%@ page import="java.util.*"%>
 
<%
    if(request.getParameter("submit")!=null)
    {
        String dname = request.getParameter("dname");
		
		String dmob = request.getParameter("dmob");
		
        
		String db = "project";
     	String user = "root"; 
		String password = "";
        
		Connection con;
        PreparedStatement ps;
        ResultSet rs;
        
        
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, password);
        

        String status = request.getParameter("status") ;
        
        PreparedStatement pst;
            pst = con.prepareStatement("insert into driver(dname,dmob,dstatus) values (?, ?,'Available');");
            pst.setString(1, dname);
            pst.setString(2, dmob);
            pst.executeUpdate();
        
		out.println("Added Successfully.");
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
    <title>Admin</title>
</head>
<body>
    <center><h2>Add Driver Details</h2></center>
    <br><br><br><br>
   <center> <form method="post">
        <table width="30%" cellspacing="15">
            <tr>
                <td>Name</td>
                <td><input type="text" name="dname"></td>   
            </tr>
            
            <tr>
                <td>Mobile Number</td>
                <td><input type="tel" name="dmob" maxlength="10"></td>   
            </tr>

            <tr>
                <td></td>
               <center> <td><input type="submit" name="submit" value="Submit"></td> </center>  
               <td></td>
            </tr>
        </table></center>
    </form>
</body>
</html>