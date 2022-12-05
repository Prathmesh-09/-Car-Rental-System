<%@page import="java.sql.*" %>
<%@ page import="java.util.*"%>


<%
	

String db = "project";
String user = "root"; 
String password = "";

Connection con;       
ResultSet rs;

Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, password);
Statement st= con.createStatement( );
PreparedStatement ps;

String desti = request.getParameter("dest");
String mob = request.getParameter("emob");
out.println(desti);
out.println("-----------");

ps=con.prepareStatement("select dest from destination where id=1;");
        rs = ps.executeQuery();
        int i = 2;
        String status = "Rejected";
        while(rs.next())
        {
            out.println(rs.getString("dest"));
            if(rs.getString("dest").equalsIgnoreCase(desti)) 
            {
                status =  "Accepted"; 
                break;
            }
            ps=con.prepareStatement("select dest from destination where id="+i+";");
            rs = ps.executeQuery();
            i++;

        }
        out.println(status);
        out.println(desti);
        if(status.equals("Accepted"))
        { %>
            <jsp:include page="check2.jsp" >
                <jsp:param name="desti" value="<%=desti%>"/>
                <jsp:param name="mob" value="<%=mob%>"/>
            </jsp:include>
       <% }

       
        status = request.getParameter("status");
        out.println("-----------"); 
        out.println(status);

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
</body>
</html>