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
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jyoti
 */
public class SignUpServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");

        //USER SIGN UP  TYPE = FREE (Default Value)
        String typeOfUser = "FREE";

        Connection conn = null;
        boolean success_user = false;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/vod_db", "root", "");
            // conn = DriverManager.getConnection("jdbc:mysql://172.16.1.27:3306/vod_db", "root", "system");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from user");

            String sql = "insert into user values(?,?,?,?,?)";
            PreparedStatement prep = conn.prepareStatement(sql);
            prep.setString(1, email);
            prep.setString(2, password);
            prep.setString(3, name);
            prep.setString(4, phone);
            prep.setString(5, typeOfUser);
            prep.executeUpdate();

            System.out.println("user has been inserted successfully");

            out.print("user has been saved successfully");
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
