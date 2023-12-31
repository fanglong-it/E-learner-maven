/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.course;

import dao.ClassDAO;
import dao.CourseDAO;
import dao.FeedBackDAO;
import dao.LessonDAO;
import dao.RegistrationDAO;
import model.Account;
import model.Course;
import model.FeedBack;
import model.Lesson;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "DetailCourseController", urlPatterns = {"/course-detail"})
public class DetailCourseController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DetailCourseController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DetailCourseController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CourseDAO courseDAO = new CourseDAO();
        LessonDAO lessonDAO = new LessonDAO();
        ClassDAO classDAO = new ClassDAO();
        FeedBackDAO feedBackDAO = new FeedBackDAO();
        RegistrationDAO registrationDAO = new RegistrationDAO();

        String courseId = request.getParameter("courseId") == null ? "" : request.getParameter("courseId");
        try {
            Course course = courseDAO.getCourseById(Integer.parseInt(courseId));
            List<Lesson> lessons = lessonDAO.getLessonByCourseId(course.getId());
            request.setAttribute("lessons", lessons);
            request.setAttribute("course", course);

            List<model.Class> classes = classDAO.getClassByCourseId(Integer.parseInt(courseId));
            request.setAttribute("classes", classes);

            HttpSession session = request.getSession();
            Account currentAccount = session.getAttribute("account") == null ? null : (Account) session.getAttribute("account");
//            request.setAttribute("isSendRequest", registrationDAO.isRegistration(0));
            request.setAttribute("isRegisterCourse", currentAccount == null ? false : registrationDAO.isRegistration(currentAccount.getId(), course.getId()));
            request.setAttribute("isOwner", classDAO.isOwnerCourse(course.getId(), currentAccount.getId()));

            
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher("detail-course.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
