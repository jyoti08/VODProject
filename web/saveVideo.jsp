<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title></title>
    </head>
    <body>
        
    
<%
  
   String title = request.getParameter("title");
   long releaseDate = Long.parseLong(request.getParameter("releaseDate"));
   String categoryName = request.getParameter("categoryName");
   String coverPhoto = request.getParameter("coverPhoto");
   String director = request.getParameter("director");
   String producer = request.getParameter("producer");
   String timeofVideo = request.getParameter("time");
   int genreId = Integer.parseInt(request.getParameter("genreId"));
   String rating = request.getParameter("rating");
   String videoPath = request.getParameter("video");
   String trailerPath = request.getParameter("trailer");
   String language = request.getParameter("language");
   String industry = request.getParameter("industry");
   try
    {
        System.out.println("in Save Video");
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/vod_db", "root", "");
            String insertSql = "insert into videos values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            
            PreparedStatement stmt = conn.prepareStatement(insertSql);
             stmt.setString(1,null);
             stmt.setString(2,title);
             stmt.setDate(3,new Date(releaseDate));
             stmt.setString(4,categoryName);
             stmt.setString(5,coverPhoto);
             stmt.setString(6,director);
             stmt.setString(7,producer);
             stmt.setString(8,timeofVideo); 
             stmt.setInt(9,genreId);
             stmt.setInt(10,genreId);
             stmt.setString(11,videoPath);
             stmt.setString(12,trailerPath);
             stmt.setString(13,language);
             stmt.setString(14,industry);
                        
                  System.out.println("????????????insertS"+ insertSql);
             int i = stmt.executeUpdate();  
                
            System.out.println("row inserted -----------"+ i);
           
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        

    %>
    <h1> inseted</h1>
    </body>
</html>