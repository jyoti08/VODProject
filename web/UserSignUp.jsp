<%-- 
    Document   : UserSignUp
    Created on : 12/04/2017, 4:16:04 PM
    Author     : jyoti
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.css" rel="stylesheet"/>
        <script>
            function validatePhn(val){
                
            }
            </script>
    </head>
    <body>
        <div class="container">
            <h2> User Sign Up</h2>
            <form action="SaveUser.jsp" method="post">
                <div class="form-group">
                    Name
                    <input type="text" name="name" required="true" class="form-control">
                </div>
                <div class="form-group">
                    Email
                    <input type="email" name="email" required="true" class="form-control">
                </div>
                <div class="form-group">
                    Password
                    <input type="password" name="password" required="true" class="form-control">
                </div>
                <div class="form-group">
                    Confirm Password
                    <input type="password" name="confirmPwd" required="true" class="form-control">
                </div>
                <div class="form-group">
                    Phone
                    <input type="text" name="phone" onkeyup="validatePhn(this.value)" maxlength="10" required="true" class="form-control">
                </div>
                <div class="form-group">
                    <input type="submit" value="submit" class="btn btn-success">
                </div>
            </form>
            
            
        </div>
    </body>
</html>
