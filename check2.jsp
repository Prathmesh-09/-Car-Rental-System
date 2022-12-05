<%@page import="java.sql.*" %>
<%@ page import="java.util.*"%>


<%
	

    String db = "project";
    String user = "root"; 
    String password = "";

    Connection con;       
    ResultSet rst,rs;

    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, password);
    Statement st= con.createStatement( );
    PreparedStatement pst,ps;
    String desti = request.getParameter("desti");
    String emob = request.getParameter("mob");
    out.println(emob);
    out.println(desti);
    pst = con.prepareStatement("select * from driver where dstatus='Available' limit 1;") ;
    rst = pst.executeQuery();
    String status="Rejected";
    if(rst.next())
    {
        out.println("abc");
        out.println(emob);
        status="Accepted";
        String id = rst.getString("did"); 
        pst=con.prepareStatement("update driver set emob = "+ emob+ ",dest='" + desti + "',dstatus='Occupied' where did="+id+ ";");
        pst.executeUpdate();
        ps=con.prepareStatement("update emp set remark='Accepted' where emob="+emob+";");
        ps.executeUpdate();
       
    }
    else
    {
        out.println(emob);
        ps=con.prepareStatement("update emp set remark='Rejected' where emob="+emob+";");
        ps.executeUpdate();
    }
    
      
%>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <jsp:include page="enquiry.jsp" >
        <jsp:param name="status" value="<%=status%>"/>
    </jsp:include>
</body>
</html>