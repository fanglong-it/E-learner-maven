package controller.groupchat;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AccountDAO;
import dao.GroupChatDAO;
import dao.MemberDAO;
import dao.MessageDAO;
import model.Account;
import model.GroupChat;
import model.Member;
import model.Message;

/**
 * Servlet implementation class SendMessToTeacher
 */
@WebServlet("/Send-message-to-teacher")
public class SendMessToTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SendMessToTeacher() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "view-group-chat";
		try {
			String teacherId = request.getParameter("teacherId");
			String message = request.getParameter("message");

			HttpSession session = request.getSession();
			AccountDAO accountDAO = new AccountDAO();
			GroupChatDAO groupChatDAO = new GroupChatDAO();
			MemberDAO memberDAO = new MemberDAO();
			MessageDAO messageDAO = new MessageDAO();
			Account account = (Account) session.getAttribute("account");

			// Get teacher
			Account teacher = accountDAO.getAccountById(Integer.parseInt(teacherId));

			// Create group Chat 1:1
			GroupChat groupChat = groupChatDAO.insertGroupChat(GroupChat.builder().id(0)
					.groupChatName(account.getFullname() + " Send Message To " + teacher.getFullname()).isPrivate(1)
					.build());

			Member teacherMem = Member.builder().id(0).groupChat(groupChat).account(teacher).isLeader(1).build();

			memberDAO.saveMemberChat(teacherMem);

			Member student = Member.builder().id(0).groupChat(groupChat).account(account).isLeader(0).build();
			memberDAO.saveMemberChat(student);

			// Send Message to chat
			Message mess = Message.builder().account(account).groupId(groupChat.getId()).content(message)
					.dateSended(new Date(System.currentTimeMillis())).resourcePathFile("").build();
			messageDAO.sendMessage(mess);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			request.getRequestDispatcher(url).forward(request, response);
		}
	}

}
