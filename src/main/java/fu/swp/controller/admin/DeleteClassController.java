package fu.swp.controller.admin;

import fu.swp.dao.ClassDAO;
import fu.swp.dao.CourseDAO;
import fu.swp.model.Class;
import fu.swp.model.Course;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/admin/delete-class")
public class DeleteClassController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String classIdStr = request.getParameter("classId");
        HttpSession session = request.getSession();
        try {
            ClassDAO classDAO = new ClassDAO();
            int classId = Integer.parseInt(classIdStr);

            Class clazz = classDAO.getClassById(classId);
            if (classDAO.deleteClass(classId)) {
                session.setAttribute("message", "Delete class successfully!");
                response.sendRedirect(request.getContextPath() + "/admin/course-detail?courseId=" + clazz.getCourse().getId());
                return;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            session.setAttribute("error", "Can not delete this class.");
        }

        response.sendRedirect(request.getContextPath() + "/admin/class-detail?classId=" + classIdStr);
    }

}
