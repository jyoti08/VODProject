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
            
            
            
        <a href="#" data-toggle="modal" data-target="#myModal">
            <img src="images/add.png" style="width: 25px;height: 25px"/>
        </a>
        
        <!--  start Modal pop up   -->
      
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Modal Header</h4>
      </div>
      <div class="modal-body">
        <!--   -->
        <form action="./MyMultiFileUploader" method="post" enctype="multipart/form-data">
            <div class="form-group">
                Enter category Name
                <input type="text" name="catName" class="form-control"/>
            </div>
            <div class="form-group">
                Enter Description
                <input type="text" name="desc" class="form-control"/>
            </div>
            <div class="form-group">
                Select Icon
                <input title='select file' type="file" onchange="readandpreview(this, 'fileImg')" name='fn1'/>
                <img src="" id="fileImg" style="width: 25px;height: 25px;">
                
            </div>
            <div class="form-group">
                <input type="submit" value="ADD" class="btn btn-primary"/>
            </div>
            
        </form>
        <!--  -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
        
        
        <!-- end Modal  -->
        
        <table class="table table-bordered">
            <tr>
                <th>CATEGORY_NAME</th>
                <th>DESCRIPTION</th>
                <th>ICON</th>
                <th>EDIT</th>
                <th>DELETE</th>
            </tr>
            <%@include file="connection.jsp" %>
                
            <%
                
            Statement stmt = conn.createStatement();
            ResultSet resultSet = stmt.executeQuery("select * from category");
            while(resultSet.next()){
            %>
                <tr>
                    <td><%=resultSet.getString("categoryName") %></td>
                    <td><%=resultSet.getString("description") %></td>
                    <td><%=resultSet.getString("icon") %></td>
                    <td><a href="EditCategory.jsp?categoryName=<%=resultSet.getString("categoryName") %>"><img src="images/edit.png" style="width: 25px;height: 25px"/></td>
                    
                    
                    <td><a href="DeleteCategory.jsp?categoryName=<%=resultSet.getString("categoryName") %>"><img src="images/delete.png" style="width: 25px;height: 25px"/></td></td>
                </tr>
                
            <%
            }
            %>
            
        </table>
                
        </div>
    </body>
</html>
