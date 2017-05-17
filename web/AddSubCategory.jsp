<%-- 
    Document   : AddSubCategory
    Created on : 08/04/2017, 3:44:56 PM
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
         <script>
        $('#edit-modal').on('show.bs.modal', function(e) {
            
            var $modal = $(this),
                esseyId = e.relatedTarget.id;
            
//            $.ajax({
//                cache: false,
//                type: 'POST',
//                url: 'backend.php',
//                data: 'EID='+essay_id,
//                success: function(data) 
//                {
                    $modal.find('.gName').html(esseyId);
//                }
//            });
            
        })
    </script>
        <script>
            function addGenre(){
                var xhttp = new XMLHttpRequest();
                var genreName = document.getElementById("genreName").value;
                xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("res").innerHTML = this.responseText;
                }
                };
                xhttp.open("GET","saveSubCategory.jsp?genreName="+genreName,true);
                xhttp.send();
            }
             function editGenre(){
                var xhttp = new XMLHttpRequest();
                var gid = document.getElementById("gid").value;
                var genreName = document.getElementById("genreName").value;
                xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("res").innerHTML = this.responseText;
                }
                };
                xhttp.open("GET","updateSubCategory.jsp?genreName="+genreName+"&GID="+gid,true);
                xhttp.send();
            }
            </script>
    </head>
    <body>
        <!-- Navigation Bar -->
        <jsp:include page="navigation.jsp"></jsp:include>
        <div class="container">
        <h1>Add New Genre</h1>
            <div class="form-group">
                Enter Genre Name
                <input type="text" id="genreName" class="form-control" />
            </div>
             <div class="form-group">
                 <input type="button" value="Add Genre" onclick="addGenre()" class="btn btn-success" />
            </div>
         <div id="res">
        <table class="table table-bordered">
            <tr>
                <th>Genre ID</th>
                <th>Genre Name</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
            
       
        <%
            String sql = "select * from genre";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            
            while(rs.next()){
                %>
               
                <tr>
                    <td><%=rs.getInt("gid") %></td>
                    <td><%=rs.getString("genrename") %></td>
                    <td>                       
                        <a href="#" data-toggle="modal" id="1" data-target="#edit-modal" ><span class="glyphicon glyphicon-edit"/></a> </td>
                    <td><a href="deleteSubCategory.jsp?gid=<%=rs.getInt("gid") %>" ><span class="glyphicon glyphicon-remove"/></a> </td>
                </tr>
                
                <%
            }
            
            %>
           
        </table>
            
             <!--  start Modal pop up   -->
      
<div id="edit-modal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Modal Header</h4>
      </div>
      <div class="modal-body edit-content">
        <!--   -->
            <div class="form-group">
                Enter Genre name
                <input type="text" class="gid" class="form-control"/>
                <input type="text" class="gName"  class="form-control"/>
            </div>
            <div class="form-group">
                <input type="button" onclick="editGenre()" value="Update" class="btn btn-primary"/>
            </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
        <!-- end Modal  -->
       
             </div>
        </div>
    </body>
</html>
