<%@page import="java.sql.*" %>
<%@ page import="java.util.*"%>


<%
	

String db = "project";
String user = "root"; 
String password = "";

Connection con;       
ResultSet rs,rst;

Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, password);
Statement st= con.createStatement( );
PreparedStatement ps,pst;

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
            if(rs.getString("dest").equalsIgnoreCase(desti) ) 
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
        { 
            pst = con.prepareStatement("select * from driver where dstatus='Available' limit 1;") ;
            rst = pst.executeQuery();
            if(rst.next())
            {
                out.println("abc");
                out.println(mob);
                status =  "Accepted";
                out.println(rst.getString("dstatus"));
                String id = rst.getString("did"); 
                pst=con.prepareStatement("update driver set emob = "+ mob+ ",dest='" + desti + "',dstatus='Occupied' where did="+id+ ";");
                pst.executeUpdate();
                
                
            
            }
            else
            {
                status = "Rejected";

            }
    }

        out.println("-----------"); 
        out.println(status);

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>check</title>
</head>
<body>
    <jsp:include page="enquiry.jsp" >
        <jsp:param name="status" value="<%=status%>"/>
    </jsp:include>
</body>
</html>