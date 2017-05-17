<%-- 
    Document   : AddVideoOrTvShow
    Created on : 11/04/2017, 12:34:08 AM
    Author     : jyoti
--%>
<%@include file="connection.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Video Or Tv Show</title>
        <link href="css/bootstrap.css" rel="stylesheet"/>
        <script>
            function addMoviesContents(){
                var xhttp = new XMLHttpRequest();
                var categoryName = document.getElementById("catName").value;
                xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("res").innerHTML = this.responseText;
                }
                };
                xhttp.open("GET","getVideoForm.jsp?categoryName="+categoryName,true);
                xhttp.send();
            }
            function readandpreview(fileobj, imageid)
            {
                var firstfile = fileobj.files[0];
                var reader = new FileReader();
                reader.onload = (function (f)
                {
                    return function read12(e)
                    {
                        document.getElementById(imageid).src = e.target.result;
                    };
                })(firstfile);
                reader.readAsDataURL(firstfile);
            }
            </script>
    </head>
    <body>
         <!-- Navigation Bar -->
        <jsp:include page="navigation.jsp"></jsp:include>
        <div class="container">
            <p> <h1>Add Video or Tv Show</h1></p>
        <form action="./AddVideoOrTvShow" method="post" enctype="multipart/form-data">
            <div class="col-sm-6">
            <div class="form-group">
                Select Category
                <select name="categoryName" id="catName" onchange="addMoviesContents()" class="form-control">
                    <%
                        if(conn != null){
                            Statement stmt = conn.createStatement();
                            ResultSet rs = stmt.executeQuery("select * from category");
                            if(rs != null){
                                while(rs.next()){
                                    %>
                                    <option value="<%=rs.getString("categoryName") %>"><%=rs.getString("categoryName") %>  </option>
                                    <%
                                }
                            }
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
                    
                    <input type="file" name="coverPhoto" onchange="readandpreview(this, 'coverPhotoImage')" title="Select Cover Photo">
                    <img src="" id="coverPhotoImage" style="width: 25px;height: 25px;">
                    
                </div>
                <div class="form-group">
                    Enter time
                    <input type="time" name="time" class="form-control">
                </div>
            <div class="form-group">
                    Enter video
                    <input type="file" name="videoPath" onchange="readandpreview(this, 'videoPathImg')" title="select video" >
                     <img src="" id="videoPathImg" style="width: 25px;height: 25px;">
                </div>
                <div class="form-group">
                    Enter trailer
                    <input type="file" name="trailerPath" onchange="readandpreview(this, 'trailerPathImg')" title="select trailer">
                     <img src="" id="trailerPathImg" style="width: 25px;height: 25px;">
                </div>
                        
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                    Enter Full image
                    <input type="file" name="bigImagePath" onchange="readandpreview(this, 'fullImgPath')" title="select Full Image">
                     <img src="" id="fullImgPath" style="width: 25px;height: 25px;">
                </div>
                        <!--    -->
                        <div class="form-group">
                    Enter language
                    <select name="language" class="form-control">
                        <option>English</option>
                        <option>Hindi</option>
                    </select>
                </div>
                <div class="form-group">
                    Enter industry
                    <select name="industry" class="form-control">
                        <option>Bollywood</option>
                        <option>Hollywood</option>
                    </select>
                </div>
                        <!-- AJAX Response Div   -->
                <div id="res" ></div>
                 </div>
                <div class="form-group">
                 <input type="submit" value="ADD" class="btn btn-success">
                 </div>
        </form>
        </div>
    </body>
</html>
