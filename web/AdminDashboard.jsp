<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
        <!-- Navigation Bar -->
        <jsp:include page="navigation.jsp"></jsp:include>
        <div class="container">
        <%
            String adminName = request.getParameter("adminuser") ;
            session.setAttribute("ADMINNAME",adminName);
            
            %>
            <h1>Welcome <%=session.getAttribute("ADMINNAME") %> </h1>
            
            
                
        </div>
    </body>
</html>
