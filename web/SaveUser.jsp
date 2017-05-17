<%-- 
    Document   : SaveUser
    Created on : 12/04/2017, 4:32:46 PM
    Author     : jyoti
--%>
<%@page import="java.sql.PreparedStatement"%>
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
            String name=request.getParameter("name");
            String email=request.getParameter("email");
            String password=request.getParameter("password");
            String phone=request.getParameter("phone");
            
            //USER SIGN UP  TYPE = FREE (Default Value)
            String typeOfUser ="FREE"; 
            
            
            if(conn != null){
            String sql ="insert into user values(?,?,?,?,?)";
           PreparedStatement prep = conn.prepareStatement(sql);
           prep.setString(1, email);
           prep.setString(2, password);
           prep.setString(3, name);
           prep.setString(4, phone);
           prep.setString(5, typeOfUser);
           prep.executeUpdate();
           
                System.out.println("user has been inserted successfully");
            }else{
                System.out.println("Database Connection problem");
            }
            response.sendRedirect("index.jsp?msg=success");
            
            %>
    </body>
</html>
