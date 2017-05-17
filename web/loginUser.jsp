<%-- 
    Document   : loginUser
    Created on : 12/04/2017, 4:52:32 PM
    Author     : jyoti
--%>
<%@include file="connection.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
        <%
            String username = request.getParameter("username");
            String pass = request.getParameter("password");
            
            System.out.println("%%%%%%%%%%%%%%%%%" + username + "  " + pass);
            
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from user");
            boolean success_user = false;
            while(rs.next()){
                 if(username.equalsIgnoreCase(rs.getString("email")) 
                && pass.equalsIgnoreCase(rs.getString("password"))){
                    success_user = true;
                    if(success_user){
                    break;
                    }
                    System.err.println("&&&&&&&&&&&&&success");
                }else{
                     success_user = false;
                     System.err.println("&&&&&&&&&&&&&failure");
                    
            }
            }
            if(success_user){
                session.setAttribute("username", rs.getString("email"));
                response.sendRedirect("UserDashboard.jsp?username="+rs.getString("email"));
            }
            else{
                response.sendRedirect("index.jsp?msg=InvalidUser"); 
            }
            

            %>
    </body>
</html>
