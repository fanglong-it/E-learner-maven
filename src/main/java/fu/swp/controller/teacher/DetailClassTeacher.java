package fu.swp.controller.teacher;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fu.swp.dao.AccountDAO;
import fu.swp.dao.ClassDAO;
import fu.swp.model.Account;
import fu.swp.model.Class;

/**
 * Servlet implementation class DetailClassTeacher
 */
@WebServlet("/teacher/class-detail")
public class DetailClassTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DetailClassTeacher() {
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
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String classIdStr = req.getParameter("classId");
		HttpSession session = req.getSession();

		try {
			int classId = Integer.parseInt(classIdStr);
			ClassDAO classDAO = new ClassDAO();

			String name = req.getParameter("className");
			int maxStudent = Integer.parseInt(req.getParameter("maxStudent"));
			String image = req.getParameter("image");
			
			Account teacher = (Account) session.getAttribute("account");
			
			Class clazz = classDAO.getClassById(classId);
			clazz.setClassName(name);
			clazz.setMaxStudent(maxStudent);
			clazz.setImage(image);

			clazz.setAccount(teacher);

			if (classDAO.updateClass(clazz)) {
				session.setAttribute("message", "Update class successfully");
			}
		} catch (Exception ex) {
			session.setAttribute("error", "Update class failed");
			ex.printStackTrace();
		} finally {
			resp.sendRedirect(req.getContextPath() + "/manager-class");
		}
	}

}
