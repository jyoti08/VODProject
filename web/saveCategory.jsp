<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   String catName = request.getParameter("catName");
   String desc = request.getParameter("desc");
   String iconPath = request.getParameter("icon");
     
   try
    {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/vod_db", "root", "");
            String insertSql = "insert into category values(?,?,?)";
            
            PreparedStatement stmt = conn.prepareStatement(insertSql);
             stmt.setString(1,catName);
             stmt.setString(2,desc);
             stmt.setString(3,iconPath);
             int i = stmt.executeUpdate();  
                
            System.out.println("row inserted -----------"+ i);
           
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        

    %>