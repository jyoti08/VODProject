<%-- 
    Document   : EditVideo
    Created on : 12/04/2017, 3:19:10 PM
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
        <link href="css/bootstrap.css" rel="stylesheet"/>
    </head>
    <body>
            
            
            <!-- Navigation Bar -->
        <jsp:include page="navigation.jsp"></jsp:include>
        <div class="container">
            <form action="updateVideo.jsp" method="post">
                <%
            String id = request.getParameter("id");
           // String sql = "update videos set title=?,releaseyear=?";
           // PreparedStatement prep = conn.prepareStatement(sql);
           if(conn != null){
           Statement stmt = conn.createStatement();
           ResultSet rs = stmt.executeQuery("select * from videos where id="+id);
           while(rs.next()){
              
               %>
               <div class="form-group">
                   Category
                   <input type="text" name="category" value="<%=rs.getString("category") %>"/>
               </div>
               
               
               
               <%
               
               
           }
           
           
           
           }else{
               System.out.println("Database not connected");
           }
            %>
        
            </form>
        </div>
    </body>
</html>
