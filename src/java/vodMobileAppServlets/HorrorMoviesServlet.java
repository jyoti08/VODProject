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
public class HorrorMoviesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/json");
        PrintWriter out = response.getWriter();
        
        String sql = "SELECT * FROM videos where category = 'movies' and genre = (select gid from genre where genrename='HORROR');";
         JSONObject json = new JSONObject();
              JSONArray jsonArr = new JSONArray();
         Connection conn=null;
          try {
            Class.forName("com.mysql.jdbc.Driver");
           conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/vod_db", "root", "");
          //   conn = DriverManager.getConnection("jdbc:mysql://172.16.1.27:3306/vod_db", "root", "system");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            
            while(rs.next()){
                if(rs.getString("coverphoto") != null && !rs.getString("coverphoto").equals("")){
                    
                    JSONObject js1 = new JSONObject();
                    
                    js1.put("id", rs.getInt("id"));
                    js1.put("coverphoto", rs.getString("coverphoto"));
                    jsonArr.add(js1);
                }
                }
            json.put("getHorrorVideos", jsonArr);
          
          
        }catch(Exception e){
            e.printStackTrace();
        }
        
    out.print(json);
        System.out.println("Horror Json Object sent successfully" + json);
        
    }

        
    }


