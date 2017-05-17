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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author jyoti
 */
//@WebServlet(name = "UpdateCategoryFileUpload", urlPatterns = {"/UpdateCategoryFileUpload"})
@MultipartConfig
public class UpdateCategoryFileUpload extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
        
        try 
        {
            System.out.println("---------------in doPost-----------------------------");
            PrintWriter out = response.getWriter();
            Collection<Part> parts = request.getParts();
            String ans = "";

            String absolutepath = request.getServletContext().getRealPath("/myuploads");

            System.out.println(absolutepath+" complete path");
            
            int i=1;
            String filepath="";
            
            for (Part part : parts) 
            {
                String filename = vmm.FileUploader.savefileonserver(part, absolutepath);
           
              // String filename=vmm.FileUploader.savefileonserver(part,absolutepath,"hello"+(i++)+".jpg");
              //you can pass third paramater to change filename on serverside

                if (filename.equals("not-a-file")) 
                {
                    ans += "<br>" + "This is not file....This is some text data";
                } 
                else 
                {
                    ans += "<br>" + filename;
                    filepath = "./myuploads/"+filename;
                }
            }
            
            
            out.println("<h1>All Files Uploaded</h1>");
            out.println("<h2>" + ans + "</h2>");

            String catName = request.getParameter("catName");
            out.println("<h3>catName " + catName + "</h3>");

            String descNew = request.getParameter("descNew");
            out.println("<h3>desc " + descNew + "</h3>");
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/vod_db", "root", "");
            
            String sql = "update category set description= ?,icon = ? where categoryName = ?";
            PreparedStatement prep   = conn.prepareStatement(sql);
            prep.setString(1, descNew);
            prep.setString(2, filepath);
            prep.setString(3, catName);
            prep.executeUpdate(); 
                
            System.out.println("row updated -----------");
            
//            String s = request.getParameter("s1");
//            out.println("<h3>Size : "+s+"</h3>");
            
            
            out.println("</body>");
            out.println("</html>");
            response.sendRedirect("AddCategory.jsp");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
