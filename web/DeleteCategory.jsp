<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@include file="connection.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.css" rel="stylesheet"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <script src="javascript/jquery-3.1.1.min.js" ></script>
        <script src="js/bootstrap.min.js" ></script>
         
    </head>
    <body>
        <div class="container">

<h1>
    <% String catName=request.getParameter("categoryName"); %>
</h1>
<%
    
            String  catNameUpdate = null;
            ResultSet rs;
        try {
            System.out.println("-----------------delete QUERY start---------------");
            
            String query = "delete from category where categoryName ='"+ catName +"'";
            PreparedStatement stmt = conn.prepareStatement(query);
            int deleted = stmt.executeUpdate();
        if(deleted == 1){
                
                System.out.println("##########row deleted");
            }
        }catch(Exception e){
            e.printStackTrace();
        }
                %>
                <jsp:forward page="AddCategory.jsp"></jsp:forward>
        </div></body>
</html>
       