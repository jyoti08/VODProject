/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vodMobileAppServlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jyoti
 */
@WebServlet(name = "CheckLoginServlet", urlPatterns = {"/CheckLoginServlet"})
public class CheckLoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        
            String user = request.getParameter("username");
            String pass = request.getParameter("password");
            
            
            
            System.out.println("%%%%%%%%%%%%%%%%%" + user + "  " + pass);
            
            Connection conn=null;
            boolean success_user = false;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/vod_db", "root", "");
            //  conn = DriverManager.getConnection("jdbc:mysql://172.16.1.27:3306/vod_db", "root", "system");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from user");
            
            while(rs.next()){
                 if(user.equalsIgnoreCase(rs.getString("email")) 
                && pass.equalsIgnoreCase(rs.getString("password"))){
                    success_user = true;
                    if(success_user){
                    break;
                    }
                    
                }else{
                     success_user = false;
                     
                    
            }
            }
        }catch(Exception e){
            e.printStackTrace();
            System.out.println("*********Database Connection Error***********");
        }
            if(success_user){
                
                out.print("Success");
                System.err.println("&&&&&&&&&&&&&success");
            }
            else{
                 out.print("Failure");
                 System.err.println("&&&&&&&&&&&&&failure");
            }
            

    }

}
