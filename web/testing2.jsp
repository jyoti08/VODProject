<%-- 
    Document   : testing2
    Created on : 15/04/2017, 2:10:43 PM
    Author     : jyoti
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


 <%@include file="connection.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>


        <%
            
          String username = session.getAttribute("username").toString();
          username="sss@ss";
          
          String typeOfSubs = "";
          if(conn != null && username != null || !username.equals("")){
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from user where email=\'"+username+"\'");
            while(rs.next()){
                typeOfSubs = rs.getString("type");
                System.out.println("type = " + typeOfSubs);
            }
          }else{
              System.out.println("Database Connection Problem");
          }
           
        %>
        
              
        <% if(typeOfSubs.equalsIgnoreCase("SILVER")){   %>
        
                                 <h4>GOLD</h4> 
                                    Watch 100 videos 
                                    Download 30 videos<br>
           
                                    <form action="successPayment.jsp?type=GOLD" method="POST" style="border: solid 1px red;">
                                    <script
                                        src="https://checkout.razorpay.com/v1/checkout.js"
                                        data-key="rzp_test_96HeaVmgRvbrfT"
                                        data-amount="100000"
                                        data-buttontext="Upgrade Gold"
                                        data-name="Video On Demand"
                                        data-description="Thank You for purchaing Gold Package."
                                        data-image="images/gold.jpg"
                                        data-prefill.name="jyoti"
                                        data-prefill.email="jyoti.apr8@gmail.com"      
                                        data-theme.color="#286090"
                                    ></script>
                                    <input type="hidden" value="Hidden Element" name="hidden">
                                </form>


                                 <h4>PLATINUM</h4>
                                    Watch 200 videos 
                                    Download 50 videos<br>

                                    <form action="successPayment.jsp?type=PLATINUM" method="POST" style="border: solid 1px red;">
           
                                    <script
                                        src="https://checkout.razorpay.com/v1/checkout.js"
                                        data-key="rzp_test_96HeaVmgRvbrfT"
                                        data-amount="200000"
                                        data-buttontext="Upgrade Platinum"
                                        data-name="Video On Demand"
                                        data-description="Thank You for purchaing Platinum Package."
                                        data-image="images/patinum.jpg"
                                        data-prefill.name="jyoti"
                                        data-prefill.email="jyoti.apr8@gmail.com"      
                                        data-theme.color="#c9302c"
                                    ></script>
                                    <input type="hidden" value="Hidden Element" name="hidden">
                                </form>

                   
        
        <% }

        %>
        
    </body>
</html>
