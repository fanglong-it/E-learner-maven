package fu.swp.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fu.swp.dao.AccountDAO;
import fu.swp.model.Account;

/**
 * Servlet implementation class ManagerAccountAdmin
 */
@WebServlet("/admin/manager-account")
public class ManagerAccountAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ManagerAccountAdmin() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "manager-account.jsp";
		try {
			AccountDAO accountDAO = new AccountDAO();
			List<Account> accounts = accountDAO.getListAccounts();
			request.setAttribute("accounts", accounts);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			request.getRequestDispatcher(url).forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
