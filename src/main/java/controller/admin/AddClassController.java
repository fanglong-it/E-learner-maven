package controller.admin;

import dao.AccountDAO;
import dao.ClassDAO;
import dao.CourseDAO;
import dao.GroupChatDAO;
import dao.MemberDAO;
import dao.MessageDAO;
import model.Account;
import model.Class;
import model.Course;
import model.GroupChat;
import model.Member;

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
			Class classResult = classDAO.insertClass(clazz);

			// Save group chat
			GroupChat groupChat = GroupChat.builder().id(0)
					.groupChatName(course.getCourseName() + "-" + clazz.getClassName()).clas(classResult).member(teacherId)
					.isPrivate(0).build();
			GroupChatDAO groupChatDAO = new GroupChatDAO();
			MemberDAO memberDAO = new MemberDAO();
			GroupChat result = groupChatDAO.insertGroupChatAdmin(groupChat);
			Member memTeacher = Member.builder().id(0).groupChat(result).account(teacher).isLeader(1).build();
			memberDAO.saveMemberChat(memTeacher);

			session.setAttribute("message", "Add class successfully");
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			resp.sendRedirect(req.getContextPath() + "/admin/course-detail?courseId=" + courseId);
		}

	}
}
