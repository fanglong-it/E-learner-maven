package fu.swp.controller.admin;

import fu.swp.dao.AccountDAO;
import fu.swp.dao.ClassDAO;
import fu.swp.dao.CourseDAO;
import fu.swp.model.Account;
import fu.swp.model.Class;
import fu.swp.model.Course;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/admin/add-class")
public class AddClassController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        int courseId = Integer.parseInt(req.getParameter("courseId"));
        try {
            String name = req.getParameter("className");
            int maxStudent = Integer.parseInt(req.getParameter("maxStudent"));
            String image = req.getParameter("image");
            int teacherId = Integer.parseInt(req.getParameter("teacherId"));

            Class clazz = new Class();
            clazz.setClassName(name);
            clazz.setMaxStudent(maxStudent);
            clazz.setImage(image);

            AccountDAO accountDAO = new AccountDAO();
            Account teacher = accountDAO.getAccountById(teacherId);
            clazz.setAccount(teacher);

            CourseDAO courseDAO = new CourseDAO();
            Course course = courseDAO.getCourseById(courseId);
            clazz.setCourse(course);

            ClassDAO classDAO = new ClassDAO();
            classDAO.insertClass(clazz);

            session.setAttribute("message", "Add class successfully");
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            resp.sendRedirect(req.getContextPath() + "/admin/course-detail?courseId=" + courseId);
        }


    }
}
