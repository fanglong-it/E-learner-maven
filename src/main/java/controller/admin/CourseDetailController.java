package controller.admin;

import dao.AccountDAO;
import dao.ClassDAO;
import dao.CourseDAO;
import model.Course;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/admin/course-detail")
public class CourseDetailController extends HttpServlet {

    private static final String JSP_PAGE = "/admin/course-detail.jsp";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            CourseDAO courseDAO = new CourseDAO();
            ClassDAO classDAO = new ClassDAO();
            AccountDAO accountDAO = new AccountDAO();

            int courseId = Integer.parseInt(req.getParameter("courseId"));
            req.setAttribute("classes", classDAO.getClassByCourseId(courseId));
            req.setAttribute("accounts", accountDAO.getListAccountsTeacher());
            req.setAttribute("course", courseDAO.getCourseById(courseId));

            req.getRequestDispatcher(JSP_PAGE).forward(req, resp);
            return;

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        resp.sendRedirect(req.getContextPath() + "/admin/courses");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String courseIdStr = request.getParameter("courseId");
        try {
            int courseId = Integer.parseInt(courseIdStr);
            String name = request.getParameter("name");
            String image = request.getParameter("image");
            String description = request.getParameter("description");
            CourseDAO courseDAO = new CourseDAO();
            Course course = courseDAO.getCourseById(courseId);

            course.setCourseName(name);
            course.setImage(image);
            course.setDescription(description);

                if (courseDAO.updateCourse(course)) {
                    session.setAttribute("message", "Update course successfully!");
                }
        } catch (Exception ex) {
            ex.printStackTrace();
            session.setAttribute("error", "Failed to update course. Try again");
        }

        resp.sendRedirect(request.getContextPath() + "/admin/course-detail?courseId=" + courseIdStr);
    }

}
