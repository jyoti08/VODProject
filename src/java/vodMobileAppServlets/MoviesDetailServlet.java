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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author jyoti
 */
public class MoviesDetailServlet extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            PrintWriter out = response.getWriter();
        
            String id = request.getParameter("id");
            
            Connection conn=null;
          JSONObject obj = new JSONObject();
          //  JSONArray jsonArr = new JSONArray();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/vod_db", "root", "");
            Statement stmt = conn.createStatement();
           ResultSet rs = stmt.executeQuery("select * from videos where id="+id);
            
                  
                  JSONObject js1 = new JSONObject();
            while(rs.next()){
                     
                   
                  
                        js1.put("id", rs.getInt("id"));
                        js1.put("title", rs.getString("title"));
                        js1.put("releaseyear", rs.getString("releaseyear"));
                        js1.put("director", rs.getString("director"));
                        js1.put("production", rs.getString("production"));
                        js1.put("time", rs.getString("time"));
                        js1.put("rating", rs.getString("rating"));
                        js1.put("videopath", rs.getString("videopath"));
                        js1.put("trailorpath", rs.getString("trailorpath"));
                        js1.put("language", rs.getString("language"));
                        js1.put("bigimage", rs.getString("bigimage"));
                        js1.put("coverphoto", rs.getString("coverphoto"));
                        //jsonArr.add(js1);
                   
                    
            
            }
            obj.put("movieDeatil", js1);
            System.out.println("data from server" + js1);
            
        }catch(Exception e){
            e.printStackTrace();
        }
            out.print(obj);
    }

}
