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
        
        <%
            String genreName = request.getParameter("genreName");
            String sql = "insert into genre values(?,?)";
            PreparedStatement prep= conn.prepareStatement(sql);
            prep.setString(1,null);
            prep.setString(2,genreName);
            int inserted = prep.executeUpdate();
            if(inserted == 1){
                
                System.out.println("%%%%%%%%%%%%subcategory inserted%%%%%%%%%%%%%%");
                String sql2 = "select * from genre";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql2);
            %>
             <table class="table table-bordered">
            <tr>
                <th>Genre ID</th>
                <th>Genre Name</th>
            </tr>
            <%
            while(rs.next()){
                %>
                <tr>
                    <td><%=rs.getInt("GID") %></td>
                    <td><%=rs.getString("GENRENAME") %></td>
                </tr>
                <%
            }
            }
            
            %>
             </table>
        </div>
    </body>
</html>
