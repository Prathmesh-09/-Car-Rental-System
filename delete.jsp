 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@ page import="java.util.*"%> 
 
 <%
    
        String id = request.getParameter("id");
		
		
        
		String db = "project";
     	String user = "root"; 
		String password = "";
        
		Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, password);
        pst = con.prepareStatement("delete from emp where ID="+id+";");
		
        
		
        pst.executeUpdate();
		
		response.sendRedirect("viewenq.jsp");
%>