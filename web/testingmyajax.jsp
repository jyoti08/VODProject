<%-- 
    Document   : testingmyajax
    Created on : 15/04/2017, 2:05:30 PM
    Author     : jyoti
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
      function subscriptionPage(){
          var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById("res").innerHTML = this.responseText;
                    }
                };
                xhttp.open("GET", "ShowSubscriptionByUser.jsp", true);
                xhttp.send();
          //window.location="Subscription.jsp";
      }
      
      </script>
  
        
    </head>
    <body>
        <h1>Hello World!</h1>
    
        <div id="res">
            
        </div>

        <input type="button" onclick="subscriptionPage()" value="Fetch" />
        
    </body>
</html>
