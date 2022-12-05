<%@page import="java.sql.*" %>
<%@ page import="java.util.*"%>
 
<%
    if(request.getParameter("submit")!=null)
    {
        String adest = request.getParameter("adest");
		
        
		String db = "project";
     	String user = "root"; 
		String password = "";
        
		Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + db, user, password);
        pst = con.prepareStatement("INSERT INTO `destination`(`dest`) VALUES (?);");
        pst.setString(1,adest);
		pst.executeUpdate();
		
        
        out.println("Destination Added Successfully.");
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
    <title>Add Destination</title>
</head>
<body>
    <div>
        <form action="" method="post" class="adddestination">
            <center> <h2>Add Destination</h2></center>
             <center><table cellspacing="10">
                 <tr>
                    <td style="width: 600px;"><h4 style="margin-left: 150px;">Enter the destination that you want to add...</h4></td>
                 </tr>
                 <tr>
                    <td style="width: 600px;"><input style="margin-left: 210px;" type="text" name="adest" placeholder="Destinations"></td>
                 </tr>
                 <center><tr>
                    <td style="width: 600px;">
                         <input class="btn btn-primary" style="margin-left: 270px; margin-top: 10px;" type="submit" name="submit" >
                    </td>
                </tr></center>
             </table></center>
         </form>
    </div>
</body>
</html>