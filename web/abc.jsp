<%-- 
    Document   : AddVideo
    Created on : 09/04/2017, 12:22:51 AM
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
        <link href="css/bootstrap.min.css" rel="stylesheet" />
        <script src="javascript/jquery-3.1.1.min.js" ></script>
        <script src="js/bootstrap.min.js" ></script>
        
     </head>
    <body>
        <div class="container">
            
            <h3> Add Video</h3>
            <form actiion="./SaveVideoServlet" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    Select category
                    <select name="categoryName" class="form-control">
                     <%     String sql = "select * from category";
                            Statement stmt = conn.createStatement();
                            ResultSet rs = stmt.executeQuery(sql);
                            while(rs.next()){
                             %>
                             <option value="<%=rs.getString("categoryName") %>"><%=rs.getString("categoryName") %></option>
                             <%
                                }
                            %>
                 </select>
                
                </div>
                <div class="form-group">
                    Enter video Title
                    <input type="text" name="title" class="form-control">
                </div>
                <div class="form-group">
                    Enter Release Date
                    <input type="date" name="releaseDate" class="form-control">
                </div>
                <div class="form-group">
                    Select Cover photo 
                    <input type="file" name="coverPhoto" title="Select Cover Photo">
                </div>
                <div class="form-group">
                    Enter Director
                    <input type="text" id="director" name="director" class="form-control">
                </div>
                <div class="form-group">
                    Enter Producer
                    <input type="text" name="producer" class="form-control">
                </div>
                <div class="form-group">
                    Enter time
                    <input type="time" name="time" class="form-control">
                </div>
                <div class="form-group">
                    Enter Genre
                    <select name="genreName" class="form-control">
                        
                   
                        <option value="2">action</option>
             
                 </select>
                

                </div>
                <div class="form-group">
                    Enter rating
                    <select name="rating" class="form-control">
                        <option>UL</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                    </select>
                </div>
                <div class="form-group">
                    Enter video
                    <input type="file" name="video" title="select video" >
                </div>
                <div class="form-group">
                    Enter trailer
                    <input type="file" name="trailer" title="select trailer">
                </div>
                <div class="form-group">
                    Enter language
                    <select name="language" class="form-control">
                        <option>English</option>
                        <option>Hindi</option>
                    </select>
                </div>
                <div class="form-group" class="form-control">
                    Enter industry
                    <select name="industry">
                        <option>Bollywood</option>
                        <option>Hollywood</option>
                    </select>
                </div>
                <div class="form-group">
                    <input type="submit" value="submit" class="btn btn-success" >
                </div>
              </form>
        </div>
    </body>
</html>
