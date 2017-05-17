<%@include file="connection.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
    </head>
    <body>
<%
    
String categoryName = request.getParameter("categoryName");
if(categoryName.equals("Movies") || categoryName.equals("movies")){
    %>
               <div class="form-group">
                    Enter Director
                    <input type="text"  name="director" class="form-control">
                </div>
                <div class="form-group">
                    Enter Producer
                    <input type="text" name="producer" class="form-control">
                </div>
                <div class="form-group">
                    Select Rating
                    <select name="rating" class="form-control">
                        <option value="UL">UL</option>
                    </select>
                </div>
                        
                        <div class="form-group">
                            Select Genre
                            <select name="genreName" class="form-control">
                                <%
                        if(conn != null){
                            Statement stmt2 = conn.createStatement();
                            ResultSet rs2 = stmt2.executeQuery("select * from genre");
                            if(rs2 != null){
                                while(rs2.next()){
                                    %>
                                    <option value="<%=rs2.getString("gid") %>"><%=rs2.getString("genrename") %>  </option>
                                    <%
                                }
                            }
                        }
                        
                        %>
                            </select>
                        </div>
                
                
   <%
}else{
%>
   <%
}
    %>
    </body></html>