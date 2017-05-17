<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
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
         <script>
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

<h1>
    <% String catName=request.getParameter("categoryName"); %>
</h1>
<%
    
            String  catNameUpdate = null;
            String descUpdate = null;
            String iconUpdate= null; 
            ResultSet rs;
        try {
            System.out.println("-----------------EDIT QUERY start---------------");
            
            String query = "select * from category where categoryName ='"+ catName +"'";
            Statement stmt = conn.createStatement();
            rs = stmt.executeQuery(query);
        while(rs.next()){
                catNameUpdate = rs.getString("categoryName");
                descUpdate = rs.getString("description");
                iconUpdate = rs.getString("icon");
                //System.out.println("##########iconUpdate" + iconUpdate);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
                %>
                <form action="./UpdateCategoryFileUpload" method="post" enctype="multipart/form-data">
            <div class="form-group">
                Category Name
                <input type="text" disabled="true" name="catName" class="form-control" value="<%=catNameUpdate %>"/>
            </div>
            <div class="form-group">
                Description
                <input type="text" name="descNew" class="form-control" value="<%=descUpdate %>"/>
            </div>
            <div class="form-group">
                ICON
                <input type="file" title="Select Icon" name="iconNew" onchange="readandpreview(this, 'fileImg')" value="<%=iconUpdate %>"/>
                <img src="" id="fileImg" style="width: 25px;height: 25px;">
            </div>
            <div class="form-group">
                <input type="submit" value="Update Category" class="btn btn-primary"/>
            </div>
        </form>
        </div></body>
</html>
       