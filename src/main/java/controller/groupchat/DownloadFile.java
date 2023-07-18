package controller.groupchat;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;
import java.net.URL;
import java.nio.charset.StandardCharsets;

@WebServlet(name = "DownloadFile", value = "/download-file")
public class DownloadFile extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getParameter("pathUrl");
        int lastIndexOfSlash = url.lastIndexOf("/");
        String filePath = url.substring(0, lastIndexOfSlash);
        String fileName = url.substring(lastIndexOfSlash + 1);
//        File file = new File(filePath, fileName);
        System.out.println(filePath);
        PrintWriter out = response.getWriter();


        // Set response content type
        response.setContentType("application/octet-stream");

        // Set the Content-Disposition header to force file download
        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");


        FileInputStream fileInputStream = new FileInputStream(url);

        int i;
        while ((i=fileInputStream.read()) != -1) {
            out.write(i);
        }
        fileInputStream.close();
        out.close();


        response.sendRedirect("group-chat.jsp");
    }
}
