<%-- 
    Document   : getListByCat
    Created on : 11/04/2017, 12:11:51 AM
    Author     : jyoti
--%>
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
        <div class="container">
            <table class="table table-bordered active">
                <%                    String catName = request.getParameter("categoryName");
               
                    if (catName.equalsIgnoreCase("movies")) {
                        %>
                                       <tr>
                    <th>ID </th>
                    <th>Title </th>
                    <th>Release Year </th>
                    <th>Category </th>
                    <th>Cover Photo </th>
                    <th>Director </th>
                    <th>Producer </th>
                    <th>Time </th>
                    <th>Genre</th>
                     <th>Rating </th>
                     <th>Video Path </th>
                    <th>Trailer Path </th>
                    <th>Language</th>
                    <th>Industry </th>
                    <th>Edit </th>
                    <th>Delete</th>
                    
                   

                </tr>
                        <%

                        if (conn != null && catName != null & catName != "") {
                            Statement stmt = conn.createStatement();
                            ResultSet rs = stmt.executeQuery("select * from videos where category='" + catName + "'");
                            System.out.println("catName ==" + catName + "  rs = " + rs);
                            if (rs != null) {
                                while (rs.next()) {
                %>


                <tr>
                    <td><%=rs.getString(1)%> </td>
                    <td><%=rs.getString(2)%> </td>
                    <td><%=rs.getString(3)%> </td>
                    <td><%=rs.getString(4)%> </td>
                    <td><%=rs.getString(5)%> </td>
                    <td><%=rs.getString(6)%> </td>
                    <td><%=rs.getString(7)%> </td>
                    <td><%=rs.getString(8)%> </td>
                    <td><%=rs.getString(9)%> </td>
                    <td><%=rs.getString(10)%> </td>
                    <td><%=rs.getString(11)%> </td>
                    <td><%=rs.getString(12)%> </td>
                    <td><%=rs.getString(13)%> </td>
                    <td><%=rs.getString(14)%> </td>
                    <th><a href="EditVideo.jsp?id=<%=rs.getString(1) %>"><span class="glyphicon glyphicon-edit"/></a> </th>
                    <th><a href="DeleteVideo.jsp?id=<%=rs.getString(1) %>"><span class="glyphicon glyphicon-remove"/></a> </th>

                </tr>

                <%

                            }
                        }
                    }
                } else {
                %>
                <tr>
                    <th>ID </th>
                    <th>Title </th>
                    <th>Release Year </th>
                    <th>Category </th>
                    <th>Cover Photo </th>
                    <th>Time </th>
                    <th>Video Path </th>
                    <th>Trailer Path </th>
                    <th>Language</th>
                    <th>Industry </th>
                    <th>Edit</th>
                    <th>Delete </th>

                </tr>

                <%
                    Statement stmt = conn.createStatement();
                    ResultSet rs1 = stmt.executeQuery("select * from videos where category='" + catName + "'");
                    System.out.println("catName ==" + catName + "  rs = " + rs1);
                    if (rs1 != null) {
                        while (rs1.next()) {
                %>
                <tr>
                <% if(rs1.getString(1) != null)   { %>    <td><%=rs1.getString(1)%> </td><%}%>
                <%    if(rs1.getString(2) != null){ %> <td><%=rs1.getString(2)%> </td><%}%>
                <%    if(rs1.getString(3) != null){ %> <td><%=rs1.getString(3)%> </td><%}%>
                 <%   if(rs1.getString(4) != null){ %> <td><%=rs1.getString(4)%> </td><%}%>
                 <%   if(rs1.getString(5) != null){ %> <td><%=rs1.getString(5)%> </td><%}%>
                 <%   if(rs1.getString(6) != null){ %> <td><%=rs1.getString(6)%> </td><%}%>
                 <%   if(rs1.getString(7) != null){ %> <td><%=rs1.getString(7)%> </td><%}%>
                 <%   if(rs1.getString(8) != null){ %> <td><%=rs1.getString(8)%> </td><%}%>
                 <%   if(rs1.getString(9) != null){ %> <td><%=rs1.getString(9)%> </td><%}%>
                 <%   if(rs1.getString(10) != null){ %> <td><%=rs1.getString(10)%> </td><%}%>
                 <%   if(rs1.getString(11) != null){ %> <td><%=rs1.getString(11)%> </td><%}%>
                 <%   if(rs1.getString(12) != null){ %> <td><%=rs1.getString(12)%> </td><%}%>
                 <%   if(rs1.getString(13) != null){ %> <td><%=rs1.getString(13)%> </td><%}%>
                 <%   if(rs1.getString(14) != null){ %> <td><%=rs1.getString(14)%> </td><%}%>
                    <th><a href="EditVideo.jsp?id=<%=rs1.getString(1) %>"><span class="glyphicon glyphicon-edit"/></a> </th>
                    <th><a href="DeleteVideo.jsp?id=<%=rs1.getString(1) %>"><span class="glyphicon glyphicon-remove"/></a> </th>
                </tr>
                    
                    
                    
                    
                              
                <%
                            }
                        }
                    }


                %>





            </table>
        </div>
    </body>
</html>
