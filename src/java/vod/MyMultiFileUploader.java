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

@MultipartConfig
public class MyMultiFileUploader extends HttpServlet 
{

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
        
        try 
        {
            System.out.println("---------------in doPost-----------------------------");
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
            out.println("<h2>catName " + catName + "</h2>");

            String desc = request.getParameter("desc");
            out.println("<h3>desc " + desc + "</h3>");
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/vod_db", "root", "");
            String insertSql = "insert into category values(?,?,?)";
            
            PreparedStatement stmt = conn.prepareStatement(insertSql);
             stmt.setString(1,catName);
             stmt.setString(2,desc);
             stmt.setString(3,filepath);
             int m = stmt.executeUpdate();  
                
            System.out.println("row inserted -----------"+ m);
            
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
