<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
     <body>
         <%@include file="connection.jsp" %>
    <%
       String req_username = request.getParameter("username");
       String req_password = request.getParameter("password");
       Statement stmt = null;
       ResultSet resultSet = null;
       boolean validUser = false;
       
       

        try {
            
            stmt = conn.createStatement();
            resultSet = stmt.executeQuery("select * from admin_login");
            while(resultSet.next()){
                if(resultSet.getString("username") != null
                        && req_username.equals(resultSet.getString("username"))
                        && resultSet.getString("password") != null
                        && req_password.equals(resultSet.getString("password"))){
                    validUser = true;
                    break;
                }
            }
            if(validUser){
                response.sendRedirect("AdminDashboard.jsp?adminuser="+req_username); 
            }else{
                response.sendRedirect( "index.jsp?msg=INVALID USERNAME or PASSWORD");
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
            %>
            <h1>ERROR</h1>
            
            <%
        }finally{
            stmt.close();
            conn.close();
}

     %>
   
       
    </body>
</html>
