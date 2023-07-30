/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import base.Base;
import dao.CourseDAO;
import model.Account;
import model.Course;
import pagination.CourseFilter;
import pagination.Pagination;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DW
 */
@WebServlet(name = "AdminCourses", urlPatterns = { "/admin/courses" })
public class CourseController extends HttpServlet {

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
			out.println("<title>Servlet ManagerCourse</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<h1>Servlet ManagerCourse at " + request.getContextPath() + "</h1>");
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
		String url = "/admin/courses.jsp";
		try {
			HttpSession session = request.getSession();
			Account account = (Account) session.getAttribute("account");
			if (account != null) {
				CourseDAO courseDAO = new CourseDAO();
				List<Course> courses = courseDAO.getAllCoursesByTeacherId(account.getId());
				if (account.getRole().getRole_name().equals(Base.ROLE_ADMIN)) {
					String name = request.getParameter("name") == null ? "" : request.getParameter("name");
					Pagination pagination = new Pagination(
							request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page")),
							courseDAO.countTotalCourse(), 0, Base.PAGE_SIZE);
					CourseFilter courseFilter = new CourseFilter(name);
					courses = courseDAO.getAllCoursesFilter(pagination, courseFilter);
					request.setAttribute("paging", pagination);
				}
				request.setAttribute("courses", courses);
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
		HttpSession session = request.getSession();

		String name = request.getParameter("name");
		String image = request.getParameter("image");
		String description = request.getParameter("description");

		Course course = new Course();
		course.setCourseName(name);
		course.setImage(image);
		course.setDescription(description);
		course.setCreateDate(new Date());

		CourseDAO courseDAO = new CourseDAO();
		try {
			courseDAO.saveCourse(course);
			session.setAttribute("message", "Add course successfully!");
		} catch (Exception ex) {
			ex.printStackTrace();
			session.setAttribute("error", "Failed to add new course. Try again");
			request.setAttribute("course", course);
		}

		response.sendRedirect(request.getContextPath() + "/admin/courses");
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

}
