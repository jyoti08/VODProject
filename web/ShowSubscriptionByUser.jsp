<%@include file="connection.jsp" %>
 



<%
            
          String username = session.getAttribute("username").toString();
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

                            else if(typeOfSubs.equalsIgnoreCase("GOLD")){ %>
                                <form action="successPayment.jsp?type=PLATINUM" method="POST">
                                    <h4><p>PLATINUM</p></h4>
                                    Watch 200 videos 
                                    Download 50 videos<br>

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


        
        
        <% }else if(typeOfSubs.equalsIgnoreCase("PLATINUM")){   %>
        
        
        <% }else {%>
                                <form action="successPayment.jsp?type=SILVER" method="POST">
                                    <h4><p>SILVER</p></h4> 
                                    Watch 50 Videos
                                    Download 10 videos<br>
<!--                                     Note that the amount is in paise = 50 INR 
                                    "amrinder@vmmeducation.com"  -->
                                    <script
                                        src="https://checkout.razorpay.com/v1/checkout.js"
                                        data-key="rzp_test_96HeaVmgRvbrfT"
                                        data-amount="50000"
                                        data-buttontext="Upgrade Silver"
                                        data-name="Video On Demand"
                                        data-description="Thank You for purchaing Silver Package."
                                        data-image="images/silver.png"
                                        data-prefill.name="jyoti"
                                        data-prefill.email="jyoti.apr8@gmail.com"      
                                        data-theme.color="#9acfea"
                                    ></script>
                                    <input type="hidden" value="Hidden Element" name="hidden">
                                </form>


                                <form action="successPayment.jsp?type=GOLD" method="POST">
                                    <h4><p>GOLD</p></h4> 
                                    Watch 100 videos 
                                    Download 30 videos<br>
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


                                <form action="successPayment.jsp?type=PLATINUM" method="POST">
                                    <h4><p>PLATINUM</p></h4>
                                    Watch 200 videos 
                                    Download 50 videos<br>

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

   
          <%  }%>
         