<%@page import="java.sql.*" %>
<%@page import="java.util.*"%>
 
<%
	boolean ispost="POST".equals(request.getMethod());
	if(ispost)
    {
        String uname = request.getParameter("usname");
		String pass = request.getParameter("Pass");
		
		String db = "project";
     	String user = "root"; 
		String password = "";
        
		Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + db, user, password);
		if(uname.equalsIgnoreCase("admin"))
		{
			pst = con.prepareStatement("select passwd from admin where username=?;" );
			pst.setString(1, uname);
        	rs=pst.executeQuery();
			if(rs.next())
			{
				String passwd=rs.getString("passwd");
				if(pass.equals(passwd))
				{
					response.sendRedirect("apage.jsp");
				}
				else
				{
					out.println("Invalid Password");
				}
			}
		}
        else
		{
			pst = con.prepareStatement("select dmob from driver where dname=?;" );
			pst.setString(1, uname);
        	rs=pst.executeQuery();
			if(rs.next())
			{
				String passwd=rs.getString("dmob");
				if(pass.equals(passwd))
				{
					response.sendRedirect("dmob.jsp");
				}
				else
				{
					out.println("Invalid Password");
				}
			}
		}
	}
%>


<!DOCTYPE html>
<html>
<head>
	<title>Login</title>
	<link rel="stylesheet" type="text/css" href="my-login.css">
<link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet">
</head>
<body class="bdy">
	<div class="main">  	
	

			<div class="signup">
				<form method="post">
					<label for="chk" aria-hidden="true">Login</label>
					<input type="text" name="usname" placeholder="Username" required="">
					<input type="password" name="Pass" placeholder="Password" required="">
					<button type="submit" name="submit" value="Login">Login</button>
				</form>
			</div>

			
	</div>
</body>
</html>
