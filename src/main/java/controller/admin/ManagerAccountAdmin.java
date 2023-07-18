package controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AccountDAO;
import dao.RoleDAO;
import model.Account;
import model.Role;
import model.Role.Type;
import utils.UploadImage;

/**
 * Servlet implementation class ManagerAccountAdmin
 */
@WebServlet("/admin/manager-account")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 50, maxRequestSize = 1024 * 1024
		* 100)
public class ManagerAccountAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIR = "images";

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
		String url = "/manager-account-admin.jsp";
		try {
			HttpSession session = request.getSession();

			AccountDAO accountDAO = new AccountDAO();
			List<Account> accounts = accountDAO.getListAccounts();

			Type[] roles = Role.Type.values();
			session.setAttribute("roles", roles);
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
		String url = "/admin/manager-account";
		try {
			AccountDAO accountDAO = new AccountDAO();
			RoleDAO roleDAO = new RoleDAO();
			String accountId = request.getParameter("accountId") == null ? "0" : request.getParameter("accountId");
			String username = request.getParameter("username");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String fullname = request.getParameter("fullname");
			String address = request.getParameter("address");
			String filename = UploadImage.uploadFile(request, "images");
			String status = request.getParameter("status");
			String role = request.getParameter("role");

			Account account = Account.builder().id(Integer.parseInt(accountId)).username(username).email(email)
					.phone(phone).fullname(fullname).address(address).avatar(filename).status(Integer.parseInt(status))
					.role(roleDAO.getRoleByRoleName(role)).build();
			if (accountId.equals("0")) {// save
				String password = request.getParameter("password");
				account.setPassword(password);
				accountDAO.saveAccount(account);
			} else {
				// update
				accountDAO.updateAccount(account);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			doGet(request, response);
		}
	}

}
