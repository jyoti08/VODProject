<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
        <title>Admin Login</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet"/>
        <script>
             function showMsg(){
                 if(document.getElementById("key").value!=null && document.getElementById("key").value!=""){
                     var key=document.getElementById("key").value;
                     alert(key);
                    // document.getElementById('errorMsg').innerHtml(key);
                 }
                 
           }
        </script>
  </head>
  <body onload="showMsg()">
     
    
       <div class="container">
           <div class="col-sm-6">
            <h2>  ADMIN LOGIN  </h2>
            <form action="CheckAdminLogin.jsp" method="post">
                
                <div class="form-group">
                    Username
                    <input type="text" name="username" class="form-control"/>
                </div>
                <div class="form-group">
                    Password
                    <input type="password" name="password" class="form-control"/>
                </div> 
                <div class="form-group">
                    
                    <input type="submit" value="submit" class="btn btn-success"/>
                </div>
                <div class="form-group">
                    
                    <a href="ForgetAdmin.jsp">Forget UserName/Password</a>
                </div>
            </form>
            <%
                String msg="";
                
                if(request.getParameter("msg")!= null){
                        msg=request.getParameter("msg").toString();
                        
                }
            %>
            <input type="hidden" id="key" value="<%=msg%>"/>
            <p id="errorMsg"/>
            
            </div>
            
            
            <div class="col-sm-6">
                <h2>User Login</h2>
                <form action="loginUser.jsp" method="post">
                    <div class="form-group">
                        Username
                        <input type="text" name="username" class="form-control">
                    </div>
                    <div class="form-group">
                        Password
                        <input type="password" name="password" class="form-control">
                    </div>
                    <div class="form-group">
                        <input type="submit" value="Login" class="btn btn-success">
                    </div>
                </form>
                
                <a href="UserSignUp.jsp">User Sign Up</a>
            </div>
        </div>
    </body>
</html>
