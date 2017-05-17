<%-- 
    Document   : PaymentProcess
    Created on : 13/04/2017, 5:01:21 PM
    Author     : jyoti
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String type = request.getParameter("subscriptiontype");
            String payment = "success";
if(payment.equals("success")){
    response.sendRedirect("successPayment.jsp?type="+type);
}else{
    response.sendRedirect("failurePayment.jsp");
}
            %>
        <h1>Hello World!</h1>
    </body>
</html>
