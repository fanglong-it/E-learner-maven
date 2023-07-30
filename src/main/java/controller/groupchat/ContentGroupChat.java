/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.groupchat;

import dao.AccountDAO;
import dao.GroupChatDAO;
import dao.MemberDAO;
import dao.MessageDAO;
import dto.BadWord;
import model.Account;
import model.GroupChat;
import model.Message;
import utils.Constant;
import utils.Util;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author DW
 */
@WebServlet(name = "ContentGroupChat", urlPatterns = { "/chat-content" })
public class ContentGroupChat extends HttpServlet {

	/**
	 * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
	 * methods.
	 *
	 * @param request  servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			/* TODO output your page here. You may use following sample code. */
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet ContentGroupChat</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<h1>Servlet ContentGroupChat at " + request.getContextPath() + "</h1>");
			out.println("</body>");
			out.println("</html>");
		}
	}

	// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
	// + sign on the left to edit the code.">

	/**
	 * Handles the HTTP <code>GET</code> method.
	 *
	 * @param request  servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "";
		GroupChatDAO groupChatDAO = new GroupChatDAO();
		MessageDAO messageDAO = new MessageDAO();
		try {

			HttpSession session = request.getSession();
			Account account = (Account) session.getAttribute("account");
			String groupChatId = request.getParameter("groupChatId") == null ? "" : request.getParameter("groupChatId");
			String rows = request.getParameter("rows");
			if (account != null) {
				List<GroupChat> groupChats = groupChatDAO.getAllGroupChatByUserId(account.getId());
				MemberDAO memberDAO = new MemberDAO();
				AccountDAO accountDAO = new AccountDAO();
				for (GroupChat groupChat : groupChats) {
					groupChat.setMember(memberDAO.countTotalMemberByGroupChatId(groupChat.getId()));
					groupChat.setAccounts(accountDAO.getListAccountByGroupChatId(groupChat.getId()));
				}
				request.setAttribute("groupChats", groupChats);
				// Default get the chat content;

				List<Message> messages = messageDAO.getAllMessageFromGroupId(Integer.parseInt(groupChatId),
						Integer.parseInt(rows));
				Collections.reverse(messages);

				// get list bad word
				String filePath = Constant.rootPath + "resources/badword.txt"; // Specify the path to your text file

				// get list badwords
				List<BadWord> badWordList = new ArrayList<>();

				try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
					String line;
					while ((line = br.readLine()) != null) {
						BadWord badWord = Util.mapLineToBadWord(line);
						if (badWord != null) {
							badWordList.add(badWord);
						}
					}
				} catch (IOException e) {
					e.printStackTrace();
				}

				List<String> badwordContent = new ArrayList<>();
				for (BadWord b : badWordList) {
					badwordContent.add(b.getBadWord());
				}

				for (Message mess : messages) {
					String allowMess = Util.censorBadWords(mess.getContent(), badwordContent);
					mess.setContent(allowMess);
				}

				request.setAttribute("path", Constant.rootPath + "webapp/files");
				request.setAttribute("messages", messages);
				request.setAttribute("groupChatId", groupChatId);
				request.setAttribute("rows", rows);
				url = "group-chat.jsp";
			} else {
				url = "Login.jsp";
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			request.getRequestDispatcher(url).forward(request, response);
		}
	}

	/**
	 * Handles the HTTP <code>POST</code> method.
	 *
	 * @param request  servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "Login.jsp";

		MessageDAO messageDAO = new MessageDAO();

		try {
			HttpSession session = request.getSession();
			Account account = (Account) session.getAttribute("account");
			String groupId = "";
			String rows = "";
			String message = "";
			String fileNameDir = "";
			if (account != null) {
				// Create a factory for disk-based file items
				DiskFileItemFactory factory = new DiskFileItemFactory();
				factory.setDefaultCharset("UTF-8");
				// Create a new file upload handler
				ServletFileUpload upload = new ServletFileUpload(factory);

				// Parse the request to get file items
				List<FileItem> items = upload.parseRequest(request);

				// Process each file item
				for (FileItem item : items) {
					if (!item.isFormField()) {
						// Handle the uploaded file
						String fileName = item.getName();
						if (fileName.length() > 0) {
							// Generate the new file name with the date format "dd-MM-yyyy"
							SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy-hh-mm-ss");
							String currentDate = dateFormat.format(new Date());
							String sanitizedFileName = sanitizeFileName(fileName);
							fileName = currentDate + "-" + account.getFullname() + "-" + sanitizedFileName;
							fileNameDir = fileName;
							System.out.println("fileName: " + fileName);
							String absolutePath = Constant.rootPath + "webapp/files/" + fileName;
							System.out.println(absolutePath);

							File file = new File(absolutePath);
							item.write(file);
						}

					} else {
						// Handle other form fields
						String fieldName = item.getFieldName();
						String fieldValue = item.getString();
						System.out.println("fieldValue: " + fieldValue);
						// Process the form field values
						if ("groupChatId".equals(fieldName)) {
							groupId = fieldValue;
						} else if ("rows".equals(fieldName)) {
							rows = fieldValue;
						} else if ("messageContent".equals(fieldName)) {
							message = fieldValue;
						}
					}
				}
				Message messageInsert = messageDAO.sendMessage(new Message(0, message, fileNameDir, account,
						Integer.parseInt(groupId), new Date(System.currentTimeMillis())));
				url = "chat-content?groupChatId=" + groupId + "&rows=" + rows;
			} else {
				url = "Login.jsp";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			response.sendRedirect(url);
		}
	}

	/**
	 * Returns a short description of the servlet.
	 *
	 * @return a String containing servlet description
	 */
	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>

	private String sanitizeFileName(String fileName) {
		// Define a regular expression to match invalid characters in file names
		String regex = "[^a-zA-Z0-9\\.\\-_]";
		// Replace invalid characters with an empty string
		return fileName.replaceAll(regex, "");
	}
}
