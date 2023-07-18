package controller.groupchat;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccountDAO;
import dao.GroupChatDAO;
import dao.MemberDAO;
import dao.MessageDAO;
import model.Account;
import model.GroupChat;
import model.Member;
import model.Message;

/**
 * Servlet implementation class CreateChat
 */
@WebServlet("/createChat")
public class CreateChat extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreateChat() {
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
		String url = "";
		try {

			String teacherId = request.getParameter("teacherId");
			String groupChatName = request.getParameter("groupChatName");
			String isPrivate = request.getParameter("isPrivate") == null ? "0" : request.getParameter("isPrivate");

			String[] students = request.getParameterValues("students");

			if (students.length <= 0) {
				request.setAttribute("ERROR", "Please select student to add group Chat!");
			} else {

				GroupChat groupChat = GroupChat.builder().id(0).groupChatName(groupChatName).clas(null)
						.member(Integer.parseInt(teacherId)).isPrivate(Integer.parseInt(isPrivate)).build();
				AccountDAO accountDAO = new AccountDAO();
				GroupChatDAO groupChatDAO = new GroupChatDAO();
				MemberDAO memberDAO = new MemberDAO();
				MessageDAO messageDAO = new MessageDAO();
				GroupChat result = groupChatDAO.insertGroupChat(groupChat);
				Member teacher = Member.builder().id(0).groupChat(result)
						.account(accountDAO.getAccountById(Integer.parseInt(teacherId))).isLeader(1).build();
				memberDAO.saveMemberChat(teacher);
				for (String string : students) {
					Account stu = accountDAO.getAccountById(Integer.parseInt(string));
					
					Member student = Member.builder().id(0).groupChat(result)
							.account(stu).isLeader(0).build();
					messageDAO.sendMessage(new Message(0, stu.getEmail() + " Has Join! this conversation ", "", stu, result.getId(), null));
					memberDAO.saveMemberChat(student);
				}

			}
			url = "view-group-chat";
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			request.getRequestDispatcher(url).forward(request, response);
		}
	}

}
