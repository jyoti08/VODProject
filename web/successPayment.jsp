<%-- 
    Document   : successPayment
    Created on : 13/04/2017, 5:10:33 PM
    Author     : jyoti
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@include  file="connection.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.css" rel="stylesheet"/>
    </head>
    <body>
        
        <%@include  file="navigationUser.jsp" %>
        <div class="container-fluid text-center">    
            <div class="row content">
                <div class="container text-center">    
                    
        <%
            String user = session.getAttribute("username").toString();
            String paymentType = request.getParameter("type");
            String sql = "update user set type=? where email=?";
            if(conn != null){
           PreparedStatement prep = conn.prepareStatement(sql);
           prep.setString(1, paymentType);
           prep.setString(2,user);
            int res = prep.executeUpdate();
            
            if(res == 1){
                System.out.println("user type updated successfully");
            }else{
                System.out.println("user type not updated");
            }
            }else{
                System.out.println("database not connected");
            }
        
        
        
        
        %>
        <h3>Payment has been done successfully</h3><br>
        <h3> Congratulation, Now you can enjoy your upgraded Services</h3>
       </div><br>
            </div>
        </div>

        <footer class="container-fluid text-center">
            <p>Footer Text</p>
        </footer>

    </body>
</html>
