/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vod;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Collection;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author jyoti
 */
@MultipartConfig
public class AddVideoOrTvShow extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("----------------in Save Video Servlet-----------------------");
        response.setContentType("text/html;charset=UTF-8");
        
        try 
        {
            System.out.println("---------------in save video-----------------------------");
            PrintWriter out = response.getWriter();
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MyFileUploader</title>");
            out.println("</head>");
            out.println("<body>");

            
            //Part part1= request.getPart("fn");
            Collection<Part> parts = request.getParts();
            String ans = "";
            System.out.println("Servlet---------------------------------");

            String absolutepath = request.getServletContext().getRealPath("/myuploads");

            System.out.println(absolutepath+" complete path");
            
            Part coverPhoto = request.getPart("coverPhoto");
            Part videoPath = request.getPart("videoPath");
            Part trailerPath = request.getPart("trailerPath");
            Part bigImagePath = request.getPart("bigImagePath");
            
            String coverPhotoFileName = vmm.FileUploader.savefileonserver(coverPhoto, absolutepath);
            String videoFileName = vmm.FileUploader.savefileonserver(videoPath, absolutepath);
            String trailerFileName = vmm.FileUploader.savefileonserver(trailerPath, absolutepath);
            String bigImageFileName = vmm.FileUploader.savefileonserver(bigImagePath, absolutepath);
            
            String coverPhotoFilePath = "./myuploads/"+coverPhotoFileName;
            String videoFilePath = "./myuploads/"+videoFileName;
            String trailerFilePath = "./myuploads/"+trailerFileName;
            String bigImageFilePath = "./myuploads/"+bigImageFileName;
            
            
            
            
            
           // int i=1;
           // String filepath="";
            
           // for (Part part : parts) 
           // {
              //  String filename = vmm.FileUploader.savefileonserver(part, absolutepath);
           
              // String filename=vmm.FileUploader.savefileonserver(part,absolutepath,"hello"+(i++)+".jpg");
              //you can pass third paramater to change filename on serverside

              //  if (filename.equals("not-a-file")) 
              //  {
                 //   ans += "<br>" + "This is not file....This is some text data";
               // } 
               // else 
                //{
                   // ans += "<br>" + filename;
                   // filepath = "./myuploads/"+filename;
                //}
            //}
            
            
            out.println("<h1>All Files Uploaded</h1>");
            out.println("<h2>" + ans + "</h2>");

            /*String title = request.getParameter("title");
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
*/
            String title = request.getParameter("title");
            out.println("<h2>title " + title + "</h2>");
            String releaseDate = request.getParameter("releaseDate");
            out.println("<h3>releaseDate " + releaseDate + "</h3>");
            String categoryName = request.getParameter("categoryName");
            out.println("<h3>categoryName " + categoryName + "</h3>");
            //String coverPhoto = request.getParameter("coverPhotoFilePath");
            out.println("<h3>coverPhoto " + coverPhotoFilePath + "</h3>");
            String director = request.getParameter("director");
            out.println("<h3>director " + director + "</h3>");
            String producer = request.getParameter("producer");
            out.println("<h3>producer " + producer + "</h3>");
            String timeofVideo = request.getParameter("time");
            out.println("<h3>time " + timeofVideo + "</h3>");
            int genreId = Integer.parseInt(request.getParameter("genreName"));
            out.println("<h3>genreId " + genreId + "</h3>");
            String rating = request.getParameter("rating");
            out.println("<h3>rating " + rating + "</h3>");
            //String videoPath = request.getParameter("video");
            out.println("<h3>video " + videoFilePath + "</h3>");
            //String trailerPath = request.getParameter("trailer");
            out.println("<h3>trailer " + trailerFilePath + "</h3>");
            String language = request.getParameter("language");
            out.println("<h3>language " + language + "</h3>");
            String industry = request.getParameter("industry");
            out.println("<h3>industry " + industry + "</h3>");
            System.out.println("in insert videos ---------------------------------");
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/vod_db", "root", "");
           //  Connection conn = DriverManager.getConnection("jdbc:mysql://172.16.1.27:3306/vod_db", "root", "");
            String insertSql = "insert into videos values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            
            PreparedStatement stmt = conn.prepareStatement(insertSql);
             stmt.setString(1,null);
             stmt.setString(2,title);
             stmt.setString(3,releaseDate);
             stmt.setString(4,categoryName);
             stmt.setString(5,coverPhotoFilePath);
             stmt.setString(6,director);
             stmt.setString(7,producer);
             stmt.setString(8,timeofVideo); 
             stmt.setInt(9,genreId);
             stmt.setString(10,rating);
             stmt.setString(11,videoFilePath);
             stmt.setString(12,trailerFilePath);
             stmt.setString(13,language);
             stmt.setString(14,industry);
             stmt.setString(15,bigImageFilePath);
             
             
            
            
           
             int m = stmt.executeUpdate();  
                
            System.out.println("row inserted -----------"+ m);
            
//            String s = request.getParameter("s1");
//            out.println("<h3>Size : "+s+"</h3>");
            
            
            out.println("</body>");
            out.println("</html>");
            response.sendRedirect("AddVideoOrTvShow.jsp");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

   
}
