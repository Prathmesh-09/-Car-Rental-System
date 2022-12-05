<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@ page import="java.util.*"%> 
 
 <%
    if(request.getParameter("submit")!=null)
    {
        String id = request.getParameter("id");
		String remark = request.getParameter("remark");
		
        
		String db = "project";
     	String user = "root";
		String password = "";
        
		Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, password);
        pst = con.prepareStatement("update emp set remark=? where id=?;");
		pst.setString(1, remark);
		pst.setString(2, id);
        
		
        pst.executeUpdate();
		
		out.println("Complaint Register Successfully.");
	}
%>
 <!DOCTYPE html>
<html>
<head>
	<title>Update</title>
</head>
<body>
<center><h3>Update</h3></center>
<center>
<form method="post">
<%
		Connection con;
		PreparedStatement pst;
        ResultSet rs;
		String id=request.getParameter("id");
        
		String db = "project";
     	String user = "root"; 
		String password = "";
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, password);
        Statement st = con.createStatement( );
		pst = con.prepareStatement("select * from emp where id=?;");
		
        
		pst.setString(1,id);
		rs=pst.executeQuery();
		while(rs.next())
		{
			
%>
<table border="1" width="40%">
	<tr>
	<strong><td><center><%=rs.getInt("id")%></center></td>
		<td><center><%=rs.getString("ename")%></center></td>
		<td><center><%=rs.getString("emob")%></center></td>
		<td><center><%=rs.getString("edest")%></center></td> 
		<td><center><%=rs.getString("date")%></center></td>
		<td><center><%=rs.getString("time")%></center></td></tr>
<tr>
<th>Remark</th>
<td><textarea name="remark" rows="3" cols="6"></textarea></td>
</tr>
<tr>
<center><td><input type="submit" name="submit"></td></center>
<td><input type="hidden" name="id" value="<%=rs.getString("id")%>"></td>
</tr>

</table>
</form>
</center>
<%
		}
	%>
</body>