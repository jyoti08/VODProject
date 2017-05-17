<%-- 
    Document   : SearchByCategory
    Created on : 10/04/2017, 11:57:48 PM
    Author     : jyoti
--%>
<%@include file="connection.jsp" %>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.css" rel="stylesheet"/>
        <script>
            function findListByCat(){
                var xhttp = new XMLHttpRequest();
                var categoryName = document.getElementById("categoryName").value;
                xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("res").innerHTML = this.responseText;
                }
                };
                xhttp.open("GET","getListByCat.jsp?categoryName="+categoryName,true);
                xhttp.send();  
            }
        </script>
    </head>
    <body>
         <!-- Navigation Bar -->
        <jsp:include page="navigation.jsp"></jsp:include>
        <div class="container">
            <h1> Search By Category</h1>
            Select category
            <select id ="categoryName" onchange="findListByCat()" class="form-control">
                    
            <%
            if(conn != null){
            Statement stmt = conn.createStatement();
            ResultSet rs=stmt.executeQuery("select * from category");
            if(rs != null){
            while(rs.next()){
                %>
                <option value="<%=rs.getString("categoryName") %>"><%=rs.getString("categoryName") %> </option>
                <%
            }
            }
}else{
%>
<h3>Database Connection Problem in SearchByCategory</h3>
<%
}
            %>
            </select>
            <br>
            <br>
            
            <div id="res"></div>
        </div>
    </body>
</html>
