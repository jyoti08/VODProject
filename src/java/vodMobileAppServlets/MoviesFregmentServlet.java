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
public class MoviesFregmentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String type = request.getParameter("getListofType");
        response.setContentType("text/json");
        PrintWriter out = response.getWriter();

        JSONObject json = new JSONObject();
        JSONArray jsonArr = new JSONArray();

        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/vod_db", "root", "");
          // conn = DriverManager.getConnection("jdbc:mysql://172.16.1.27:3306/vod_db", "root", "system");
            Statement stmt = conn.createStatement();

            if(type.equals("COMMON")) {
                String sql = "select * from videos order by id desc LIMIT 6";
                ResultSet rs = stmt.executeQuery(sql);
                while (rs.next()) {
                    if (rs.getString("bigimage") != null && !rs.getString("bigimage").equals("")) {
                        JSONObject js1 = new JSONObject();
                        js1.put("id", rs.getInt("id"));
                        js1.put("bigimage", rs.getString("bigimage"));
                        jsonArr.add(js1);
                    }
                }
                json.put("getLatesVideos", jsonArr);
            }else if(type.equals("HORROR")){
                String sqlHorror = "SELECT * FROM videos where category = 'movies' and genre = (select gid from genre where genrename='HORROR');";
                ResultSet rs = stmt.executeQuery(sqlHorror);
                while (rs.next()) {
                    if (rs.getString("coverphoto") != null && !rs.getString("coverphoto").equals("")) {
                        JSONObject js1 = new JSONObject();
                        js1.put("id", rs.getInt("id"));
                        js1.put("coverphoto", rs.getString("coverphoto"));
                        jsonArr.add(js1);
                    }
                }
                json.put("getHorrorVideos", jsonArr);
            } else if (type.equals("COMEDY")) {
                String sqlHorror = "SELECT * FROM videos where category = 'movies' and genre = (select gid from genre where genrename='COMEDY');";
                ResultSet rs = stmt.executeQuery(sqlHorror);
                while (rs.next()) {
                    if (rs.getString("coverphoto") != null && !rs.getString("coverphoto").equals("")) {
                        JSONObject js1 = new JSONObject();
                        js1.put("id", rs.getInt("id"));
                        js1.put("coverphoto", rs.getString("coverphoto"));
                        jsonArr.add(js1);
                    }
                }
                json.put("getComedyVideos", jsonArr);
            } else if (type.equals("ROMANCE")) {
                String sqlHorror = "SELECT * FROM videos where category = 'movies' and genre = (select gid from genre where genrename='Romance');";
                ResultSet rs = stmt.executeQuery(sqlHorror);
                while (rs.next()) {
                    if (rs.getString("coverphoto") != null && !rs.getString("coverphoto").equals("")) {
                        JSONObject js1 = new JSONObject();
                        js1.put("id", rs.getInt("id"));
                        js1.put("coverphoto", rs.getString("coverphoto"));
                        jsonArr.add(js1);
                    }
                }
                json.put("getRomanticVideos", jsonArr);
            }else if (type.equals("ACTION")) {
                String sqlHorror = "SELECT * FROM videos where category = 'movies' and genre = (select gid from genre where genrename='ACTION');";
                ResultSet rs = stmt.executeQuery(sqlHorror);
                while (rs.next()) {
                    if (rs.getString("coverphoto") != null && !rs.getString("coverphoto").equals("")) {
                        JSONObject js1 = new JSONObject();
                        js1.put("id", rs.getInt("id"));
                        js1.put("coverphoto", rs.getString("coverphoto"));
                        jsonArr.add(js1);
                    }
                }
                json.put("getActionVideos", jsonArr);
            }else if (type.equals("FAMILY")) {
                String sqlHorror = "SELECT * FROM videos where category = 'movies' and genre = (select gid from genre where genrename='Family');";
                ResultSet rs = stmt.executeQuery(sqlHorror);
                while (rs.next()) {
                    if (rs.getString("coverphoto") != null && !rs.getString("coverphoto").equals("")) {
                        JSONObject js1 = new JSONObject();
                        js1.put("id", rs.getInt("id"));
                        js1.put("coverphoto", rs.getString("coverphoto"));
                        jsonArr.add(js1);
                    }
                }
                json.put("getFamilyVideos", jsonArr);
            }else if (type.equals("CRIME")) {
                String sqlHorror = "SELECT * FROM videos where category = 'movies' and genre = (select gid from genre where genrename='Crime');";
                ResultSet rs = stmt.executeQuery(sqlHorror);
                while (rs.next()) {
                    if (rs.getString("coverphoto") != null && !rs.getString("coverphoto").equals("")) {
                        JSONObject js1 = new JSONObject();
                        js1.put("id", rs.getInt("id"));
                        js1.put("coverphoto", rs.getString("coverphoto"));
                        jsonArr.add(js1);
                    }
                }
                json.put("getCrimeVideos", jsonArr);
            }else if (type.equals("THRILLER")) {
                String sqlHorror = "SELECT * FROM videos where category = 'movies' and genre = (select gid from genre where genrename='Thriller');";
                ResultSet rs = stmt.executeQuery(sqlHorror);
                while (rs.next()) {
                    if (rs.getString("coverphoto") != null && !rs.getString("coverphoto").equals("")) {
                        JSONObject js1 = new JSONObject();
                        js1.put("id", rs.getInt("id"));
                        js1.put("coverphoto", rs.getString("coverphoto"));
                        jsonArr.add(js1);
                    }
                }
                json.put("getThrillerVideos", jsonArr);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        out.print(json);
    }
}
