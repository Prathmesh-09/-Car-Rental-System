<%@page import="java.sql.*" %>
<%@ page import="java.util.*"%>
 
<%
    if(request.getParameter("submit")!=null)
    {
        String ename = request.getParameter("ename");
		
		String emob = request.getParameter("emob");
		String edest = request.getParameter("dest");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        
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
            pst = con.prepareStatement("insert into emp(ename,emob,dest,date,time,remark) values (?, ? , ?, ?, ?,? );");
            pst.setString(1, ename);
            pst.setString(2, emob);
            pst.setString(3, edest); 
            pst.setString(4, date);
            pst.setString(5, time);
            pst.setString(6,status);
            pst.executeUpdate();
        
		out.println("Enquiry Registered Successfully.");
	}
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enquiry
        
    </title>
</head>
<body>
    <center><h2>Driver Enquiry</h2></center>
    <form action="check.jsp" method="GET">
    <center>
        <table>
            <tr><td>
    <table cellspacing="10">
        
        <tr>
            <td>Name</td>
            <td><input type="text" name="ename"></td>   
        </tr>
        <tr>
            <td>Mobile Number</td>
            <td><input type="tel" name="emob" maxlength="10"></td>   
        </tr>
        <tr>
            <td>Destination</td>
            <td><input type="text" name="dest"></td>   
        </tr>
        <tr>
            <td>Date</td>
            <td><input type="date" name="date" placeholder="yyyy-mm-dd"></td>   
        </tr>
        <tr>
            <td>Time</td>
            <td><input type="time" name="time" placeholder="hh-mm-ss"></td>   
        </tr>
        <tr>
            <td></td>
            <td>
                <input type="submit" name="submit" >
            </td>
            <td></td>
        </tr>
        
        
    </tr>
    </table>
    </center></td></tr></table>

    

</form>
</body>
</html>