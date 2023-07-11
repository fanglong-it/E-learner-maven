package fu.swp.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fu.swp.dao.AccountDAO;
import fu.swp.model.Account;
import fu.swp.model.Role;
import fu.swp.model.Role.Type;
import fu.swp.utils.UploadImage;

/**
 * Servlet implementation class ManagerAccountAdmin
 */
@WebServlet("/admin/manager-account")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 * 1024 * 100
)
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
			String accountId = request.getParameter("accountId") == null ? "" : request.getParameter("accountId");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String fullname = request.getParameter("fullname");
			String address = request.getParameter("address");
			String filename = UploadImage.uploadFile(request, "images");
			String role = request.getParameter("role");
			
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			request.getRequestDispatcher(url).forward(request, response);
		}
	}

}
