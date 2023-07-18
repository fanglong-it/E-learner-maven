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

@WebServlet("/admin/delete-course")
public class DeleteCourseController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String courseIdStr = request.getParameter("courseId");
        HttpSession session = request.getSession();
        try {
            CourseDAO courseDAO = new CourseDAO();
            int courseId = Integer.parseInt(courseIdStr);
            if (courseDAO.deleteCourse(courseId)) {
                session.setAttribute("message", "Delete course successfully!");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            session.setAttribute("error", "Can not delete this course.");
        }

        response.sendRedirect(request.getContextPath() + "/admin/courses");
    }

}
