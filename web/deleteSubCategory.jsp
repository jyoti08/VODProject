<%-- 
    Document   : deleteSubCategory
    Created on : 08/04/2017, 4:35:38 PM
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
        <div class="container">

<h1>
    <% String gid=request.getParameter("gid");
    System.out.println("Genre Id in subcategory Jsp Page = "+ gid);%>
</h1>
<%
    
            String  catNameUpdate = null;
            ResultSet rs;
            if(gid !=null && !gid.equals("")){
        try {
            System.out.println("-----------------delete QUERY start---------------");
            
            String query = "delete from genre where gid =\'"+ gid +"\'";
            PreparedStatement stmt = conn.prepareStatement(query);
            int deleted = stmt.executeUpdate();
        if(deleted == 1){
                
                System.out.println("##########row deleted");
            }else{
            System.out.println("genre not deleted Check SQL QUERY = " + query);
        }
        
        }catch(Exception e){
            e.printStackTrace();
        }
            }else{
                System.out.println("Genre id null or Empty");
            }
                %>
                <jsp:forward page="AddSubCategory.jsp"></jsp:forward>
        </div></body>
</html>
       