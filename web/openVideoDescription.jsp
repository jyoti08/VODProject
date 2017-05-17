<%-- 
    Document   : openVideoDescription
    Created on : 17/04/2017, 4:46:40 PM
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
        <link href="resources/design.css" rel="stylesheet">
    </head>
    <%        String path = "";
        String coverPhoto = "";
        String videoPath = "";
        String id = request.getParameter("videoId");
        String sql = "select * from videos where id=" + id;
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()) {

            path = rs.getString("bigimage");
            coverPhoto = rs.getString("coverphoto");
            videoPath = rs.getString("videopath");
            System.out.println("value of image" + path);
            break;

        }
    %>
    <body style="background-image: url(<%=path%>)">
        <div class="container" id="desc">
            <div class="col-sm-3">
                <img src="<%=coverPhoto%>" class="img-responsive">
               <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Play Video</button>

                <!-- Modal -->
                <div id="myModal" class="modal fade" role="dialog">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Modal Header</h4>
                            </div>
                            <div class="modal-body">
                                <h1>path <%=videoPath %></h1>
                                <div align="centre" class="embed-responsive embed-responsive-16by9">
                                    <video  class="embed-responsive-item" controls autoplay>
                                        <!--source src="" type="video/mp4"-->
                                        <source src="./myuploads/KMKJ.mp4" type="video/mp4">
                                        
                                    </video>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>

                    </div>
                </div>
 <!-- end Modal -->














            </div>
            <div class="col-sm-9">

            </div>
        </div>



    </body>
</html>
