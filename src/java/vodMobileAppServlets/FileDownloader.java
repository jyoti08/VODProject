/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vodMobileAppServlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jyoti
 */
public class FileDownloader extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //PrintWriter out=response.getWriter();
System.out.println("start filedownloading servlet");
       // String filepath = request.getParameter("filepath");

        String filepath="/myuploads/new.mp4";
        String filename;// = "new.mp4";

        if (filepath == null) 
        {
            System.out.println("parameter missing");
            response.setContentType("text/plain");
            
            PrintWriter out = response.getWriter();
            out.println("filepath parameter missing");
        } 
        else //parameter found
        {
            int pos = filepath.lastIndexOf("/");
            filename = filepath.substring(pos+1);
            String abspath = getServletContext().getRealPath(filepath);

            if (abspath == null) //real path of file do not exists
            {
                System.out.println("file not found on server");
                response.setContentType("text/plain");
            
                PrintWriter out = response.getWriter();
                out.println("file not found on server");
            } 
            else         //path found, force download logic
            {
                System.out.println("file found on server, now sending");
                File f = new File(abspath);
                if (f == null) 
                {

                } 
                else 
                {
                    System.out.println("start sending"  );
                    long filesize = f.length();
                    System.out.println("size of file = " + filesize  );

                    response.setContentType("application/force-download");
                    response.setContentLength((int) (filesize));
                    //response.setContentLength(-1);
                    response.setHeader("Content-Transfer-Encoding", "binary");
                    response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");//fileName);

                    FileInputStream fis = new FileInputStream(f);
                    OutputStream os = response.getOutputStream();
                    System.out.println("object created");

                    long count = 0;
                    int r;
                    byte b[] = new byte[10000];
System.out.println("before while loop");
                    while (true) {
                        r = fis.read(b, 0, 10000);
                        os.write(b, 0, r);
                        count = count + r;
                        if (count == filesize) {
                            break;
                        }
                    }
System.out.println("end sending");
                    os.flush();
                    fis.close();
                    os.close();
                }
            }

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


}
