/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.classes;

import base.Base;
import dao.AccountDAO;
import dao.ClassDAO;
import dao.CourseDAO;
import model.Account;
import model.Course;
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
@WebServlet(name = "ManagerClass", urlPatterns = {"/manager-class"})
public class ManagerClass extends HttpServlet {

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
            out.println("<title>Servlet ManagerClass</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManagerClass at " + request.getContextPath() + "</h1>");
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
        String url = "manager-classes.jsp";
        try {
            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("account");
            if (account != null) {
                
                
                ClassDAO classDAO = new ClassDAO();
                List<model.Class> classes = classDAO.getClassByTeacherId(account.getId());
                request.setAttribute("classes", classes);
//                if(account.getRole().getRole_name().equals(Base.ROLE_ADMIN)){
//                    AccountDAO accountDAO = new AccountDAO();
//                    CourseDAO courseDAO = new CourseDAO();
//                    String courseId = request.getParameter("courseId") == null ? "" : request.getParameter("courseId");
//                    request.setAttribute("classes", classDAO.getClassByCourseId(Integer.parseInt(courseId)));
//                    request.setAttribute("accounts", accountDAO.getListAccountsTeacher());
//                    request.setAttribute("course", courseDAO.getCourseById(Integer.parseInt(courseId)));
//                    url = "/admin/courses.jsp";
//                }
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
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        session.setAttribute("message", "Update class successfully!");

        String courseId = request.getParameter("courseId") == null ? "" : request.getParameter("courseId");
        response.sendRedirect("manager-class?course=" + courseId);
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
