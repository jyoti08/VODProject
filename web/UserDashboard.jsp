<%@include file="connection.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Bootstrap Example</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="javascript/jquery-3.1.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <style>
            /* Remove the navbar's default margin-bottom and rounded borders */ 
            .navbar {
                margin-bottom: 0;
                border-radius: 0;
            }

            /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
            .row.content {height: 530px}
            /* Set carousel  100% height */
            .carousel-inner img {
                width: 100%; /* Set width to 100% */
                margin: auto;
                min-height:200px;
                max-height: 300px
            }

            /* Set gray background color and 100% height */
            .sidenav {
                padding-top: 20px;
                background-color: #f1f1f1;
                height: 100%;
            }

            /* Set black background color, white text and some padding */
            footer {
                background-color: #555;
                color: white;
                padding: 15px;
            }

            /* On small screens, set height to 'auto' for sidenav and grid */
            @media screen and (max-width: 767px) {
                .sidenav {
                    height: auto;
                    padding: 15px;
                }
                .row.content {height:auto;} 
            }
        </style>

        <script>
            function subscriptionPage(user,type) {
                if (type == 'SILVER') {
                    document.getElementById('silverDiv').hidden = true;
                } else if (type == 'GOLD') {
                    document.getElementById('silverDiv').hidden = true;
                    document.getElementById('goldDiv').hidden = true;
                } else if (type == 'PLATINUM'){
                    document.getElementById('silverDiv').hidden = true;
                document.getElementById('goldDiv').hidden = true;
                document.getElementById('platinumDiv').hidden = true;
            }else{
                
            }
            }
           function openVideoDescription(val){
               var valnew = document.getElementById(val.id).value;
               window.location="openVideoDescription.jsp?videoId="+valnew;
           }

        </script>


    </head>
    <%     String username = session.getAttribute("username").toString();
        String typeOfSubs = "";
        if (conn != null && username != null || !username.equals("")) {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from user where email=\'" + username + "\'");
            while (rs.next()) {
                typeOfSubs = rs.getString("type");
                System.out.println("type = " + typeOfSubs);
            }
        } else {
            System.out.println("Database Connection Problem");
        }

    %>




    <body onload="subscriptionPage('<%=username%>', '<%=typeOfSubs%>')">




        <%@include  file="navigationUser.jsp" %>
        
        
        <!--carosual -->
        
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
      <li data-target="#myCarousel" data-slide-to="4"></li>
      <li data-target="#myCarousel" data-slide-to="5"></li>
    </ol>

 <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
          <img src="myuploads/full_LAK.jpg" style="height: 300px;width: 100%;" alt="Image">
        <div class="carousel-caption">
          <p>text.</p>
        </div>      
      </div>

            
<%
    String sql = "select * from videos order by id desc LIMIT 6";
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(sql);
    while(rs.next()){
        if(rs.getString("bigimage") != null && !rs.getString("bigimage").equals("")){
           %>
           
                <div class="item">
          <img src="<%=rs.getString("bigimage") %>" style="height: 300px;width: 100%;" alt="Image">
        <div class="carousel-caption">
          <p>text</p>
        </div>      
      </div>     
                
           
           <%
        }
    }
    
    %>
     </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>
          
            <!--end carosual -->
        <div class="container-fluid text-center">    
            <div class="row content">
                <!--div class="col-sm-2 sidenav">
                  <p><a href="#">1</a></p>
                  <p><a href="#">2</a></p>
                  <p><a href="#">3</a></p>
                </div-->
                <div class="col-sm-10 text-left"> 
                    <h3>Latest Videos</h3>
                    <table><tr>
                    <%
                        String sql2 = "select * from videos order by id desc LIMIT 6";
                         ResultSet rs2 = stmt.executeQuery(sql2);
                         int i=1;
                         String videoId;
                             while(rs2.next()){
                                 
                                 
                                 videoId = "videoId"+i;
                                 %>
                                 <td>
                                     <input type="hidden" id="<%=videoId %>" value="<%=rs2.getInt("id") %>" >
                                     <img src="<%=rs2.getString("coverphoto") %>" id="<%=videoId %>" value="<%=rs2.getInt("id") %>" 
                                          class="img-responsive" onclick="openVideoDescription(this)"
                                               style="width: 150px; height: 150px; padding: 5px; border-color: #555; border: 2px;"/>
                                 
                                 
                                 </td>
                                 <%
                                     i++;
                             }
                        %>
                        </tr>
                    </table>
                </div>
                <div class="col-sm-2 sidenav">





                   <div class="well" id="silverDiv" style="background-color: #9acfea;">
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
                    </div>
                    
                    <div class="well" id="goldDiv" style="background-color: #286090;">
                        <h4>GOLD</h4> 
                        Watch 100 videos 
                        Download 30 videos<br>

                        <form action="successPayment.jsp?type=GOLD" method="POST">
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
                    </div>
                    <div class="well" id="platinumDiv" style="background-color: #c9302c;">

                        <h4>PLATINUM</h4>
                        Watch 200 videos 
                        Download 50 videos<br>

                        <form action="successPayment.jsp?type=PLATINUM" method="POST" >

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

                    </div>

                </div>
            </div>
        </div>


        <footer class="container-fluid text-center">
            <p>Footer Text</p>
        </footer>

    </body>
</html>
