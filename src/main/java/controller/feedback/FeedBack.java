package controller.feedback;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.FeedBackDAO;
import model.Account;

/**
 * Servlet implementation class FeedBack
 */
@WebServlet("/feedback")
public class FeedBack extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FeedBack() {
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
//                if (feedBackDAO.checkIsFeedBack(account.getId(), Integer.parseInt(teacherId)) != null) {
//					// Da feedback
//					request.setAttribute("ERROR", "....");
//				} else {
//					feedBackDAO.saveFeedBack(feedBack);
//				}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "";

		try {
			FeedBackDAO feedBackDAO = new FeedBackDAO();
			HttpSession session = request.getSession();
			Account account = (Account) session.getAttribute("account");
			if (account != null) {
				String teacherId = request.getParameter("teacherId") == null ? "" : request.getParameter("teacherId");
				String message = request.getParameter("message");
				String star = request.getParameter("star");
				model.FeedBack feedBack = model.FeedBack.builder().id(0).content(message)
						.star(Integer.parseInt(star)).teacherId(Integer.parseInt(teacherId)).userId(account).build();
				feedBackDAO.saveFeedBack(feedBack);
				url = "detail-teacher?accountId=" + teacherId;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			request.getRequestDispatcher(url).forward(request, response);
		}
	}

}
