package controller.groupchat;

import javax.servlet.*;
import javax.servlet.http.*;

import utils.Constant;

import javax.servlet.annotation.*;
import java.io.*;
import java.net.URL;
import java.nio.charset.StandardCharsets;

@WebServlet(name = "DownloadFile", value = "/download-file")
public class DownloadFile extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = request.getParameter("pathUrl");
		String path = Constant.rootPath + "webapp/files/";
		url = path + url;
		int lastIndexOfSlash = url.lastIndexOf("/");
		String fileName = url.substring(lastIndexOfSlash + 1);

		// Set response content type
		response.setContentType("application/octet-stream");

		// Set the Content-Disposition header to force file download
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");

		try (FileInputStream fileInputStream = new FileInputStream(url);
				OutputStream out = response.getOutputStream()) {

			byte[] buffer = new byte[4096];
			int bytesRead;
			while ((bytesRead = fileInputStream.read(buffer)) != -1) {
				out.write(buffer, 0, bytesRead);
			}
		} catch (FileNotFoundException e) {
			response.setStatus(HttpServletResponse.SC_NOT_FOUND); // Set HTTP 404 status code if the file is not found
		} catch (IOException e) {
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // Set HTTP 500 status code for other IO
																				// errors
		}
	}
}
