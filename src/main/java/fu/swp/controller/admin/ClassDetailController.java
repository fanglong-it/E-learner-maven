package fu.swp.controller.admin;

import fu.swp.dao.AccountDAO;
import fu.swp.dao.ClassDAO;
import fu.swp.dao.CourseDAO;
import fu.swp.dao.RegistrationDAO;
import fu.swp.model.Account;
import fu.swp.model.Class;
import fu.swp.model.Course;
import fu.swp.model.RegistrationClass;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/class-detail")
public class ClassDetailController extends HttpServlet {

    private static final String JPS_PAGE = "/admin/class-detail.jsp";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Get class
        Integer integer = new Integer(req.getParameter("classId"));
        ClassDAO classDAO = new ClassDAO();
        try {
            Class clazz = classDAO.getClassById(integer);
            req.setAttribute("clazz", clazz);

            // Registrations
            RegistrationDAO registrationDAO = new RegistrationDAO();
            List<RegistrationClass> registrations = registrationDAO.getRegisterByClassId(clazz.getId());
            req.setAttribute("registrations", registrations);

            // Teachers
            AccountDAO accountDAO = new AccountDAO();
            List<Account> teachers = accountDAO.getListAccountsTeacher();
            req.setAttribute("teachers", teachers);

            req.getRequestDispatcher(JPS_PAGE).forward(req, resp);
            return;

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/admin/courses");
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String classIdStr = req.getParameter("classId");
        HttpSession session = req.getSession();

        try {
            int classId = Integer.parseInt(classIdStr);
            ClassDAO classDAO = new ClassDAO();

            String name = req.getParameter("className");
            int maxStudent = Integer.parseInt(req.getParameter("maxStudent"));
            String image = req.getParameter("image");
            int teacherId = Integer.parseInt(req.getParameter("teacherId"));

            Class clazz = classDAO.getClassById(classId);
            clazz.setClassName(name);
            clazz.setMaxStudent(maxStudent);
            clazz.setImage(image);

            AccountDAO accountDAO = new AccountDAO();
            Account teacher = accountDAO.getAccountById(teacherId);
            clazz.setAccount(teacher);

            if (classDAO.updateClass(clazz)) {
                session.setAttribute("message", "Update class successfully");
            }
        } catch (Exception ex) {
            session.setAttribute("error", "Update class failed");
            ex.printStackTrace();
        } finally {
            resp.sendRedirect(req.getContextPath() + "/admin/class-detail?classId=" + classIdStr);
        }
    }
}
