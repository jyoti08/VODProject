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
            String sql = "update category set desc= ? and icon = ? where categoryName = ?";
            PreparedStatement prep   = conn.prepareStatement(sql);
            prep.setString(1, request.getParameter("descNew"));
            prep.setString(2, request.getParameter("iconNew"));
            prep.setString(3, request.getParameter("catName"));
            prep.executeUpdate();
            %>
        <h1>Hello World!</h1>
    </body>
</html>
