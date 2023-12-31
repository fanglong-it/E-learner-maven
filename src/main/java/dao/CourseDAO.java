/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import model.Course;
import pagination.CourseFilter;
import pagination.Pagination;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DW
 */
public class CourseDAO {

	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	AccountDAO accountDAO = new AccountDAO();

	public Course getCourseById(int courseId) throws SQLException, Exception {
		String query = "SELECT * FROM Course c where c.id = ?";
		try {
			con = DBContext.makeConnection();
			if (con != null) {
				ps = con.prepareStatement(query);
				ps.setInt(1, courseId);
				rs = ps.executeQuery();
				if (rs.next()) {
					return Course.builder().id(rs.getInt("id")).courseName(rs.getString("courseName"))
							.status(rs.getInt("status")).image(rs.getString("image"))
							.description(rs.getString("description")).createDate(rs.getDate("createDate"))
							.account(accountDAO.getAccountByCourseId(rs.getInt("id"))).build();
				}
			}
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return null;
	}

	public Integer countTotalCourse() throws Exception {
		String query = "SELECT count(id) as totalCourse from Course";
		try {
			con = DBContext.makeConnection();
			if (con != null) {
				ps = con.prepareStatement(query);
				rs = ps.executeQuery();
				if (rs.next()) {
					return rs.getInt("totalCourse");
				}
			}
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return null;
	}

	public Course getLastCourse() throws SQLException, Exception {
		String query = "SELECT TOP(1) * FROM Course c order by c.id desc";
		try {
			con = DBContext.makeConnection();
			if (con != null) {
				ps = con.prepareStatement(query);
				rs = ps.executeQuery();
				if (rs.next()) {
					return Course.builder().id(rs.getInt("id")).courseName(rs.getString("courseName"))
							.status(rs.getInt("status")).image(rs.getString("image"))
							.description(rs.getString("description")).createDate(rs.getDate("createDate")).build();
				}
			}
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return null;
	}

	public List<Course> getAllCoursesWithClass() throws SQLException, Exception {
		String query = "SELECT  DISTINCT c.id , c.courseName , c.status , c.[image] , c.description, c.createDate, c2.userId as accountId from Course c \n"
				+ "left outer join Class c2 ON c.id = c2.courseId ";
		ArrayList<Course> courses = new ArrayList<>();
		try {
			con = DBContext.makeConnection();
			if (con != null) {
				ps = con.prepareStatement(query);
				rs = ps.executeQuery();
				while (rs.next()) {
					courses.add(Course.builder().id(rs.getInt("id")).courseName(rs.getString("courseName"))
							.status(rs.getInt("status")).image(rs.getString("image"))
							.description(rs.getString("description")).createDate(rs.getDate("createDate"))
							.account(accountDAO.getAccountById(rs.getInt("accountId"))).build());
				}
			}
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return courses;
	}

	public List<Course> getAllCoursesFilter(Pagination pagination, CourseFilter courseFilter)
			throws SQLException, Exception {
		String query = "SELECT c.id , c.courseName , c.status , c.[image] , c.description, c.createDate from Course c \n"
				+ "where c.courseName like ? \n" + "order by c.id desc \n" + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
		ArrayList<Course> courses = new ArrayList<>();
		try {
			con = DBContext.makeConnection();
			if (con != null) {
				ps = con.prepareStatement(query);
				ps.setString(1, "%" + courseFilter.getName() + "%");
				ps.setInt(2, pagination.getOffset());
				ps.setInt(3, pagination.getPageSize());
				rs = ps.executeQuery();
				while (rs.next()) {
					courses.add(Course.builder().id(rs.getInt("id")).courseName(rs.getString("courseName"))
							.status(rs.getInt("status")).image(rs.getString("image"))
							.description(rs.getString("description")).createDate(rs.getDate("createDate")).build());
				}
			}
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return courses;
	}

	public List<Course> getAllCourses() throws SQLException, Exception {
		String query = "SELECT c.id , c.courseName , c.status , c.[image] , c.description, c.createDate from Course c";
		ArrayList<Course> courses = new ArrayList<>();
		try {
			con = DBContext.makeConnection();
			if (con != null) {
				ps = con.prepareStatement(query);
				rs = ps.executeQuery();
				while (rs.next()) {
					courses.add(Course.builder().id(rs.getInt("id")).courseName(rs.getString("courseName"))
							.status(rs.getInt("status")).image(rs.getString("image"))
							.description(rs.getString("description")).createDate(rs.getDate("createDate")).build());
				}
			}
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return courses;
	}

	public List<Course> getAllCoursesByTeacherId(int userId) throws SQLException, Exception {
		String query = "SELECT c.id, c.courseName, c.status, c.[image] , c.description , c.createDate  from Course c left outer join Class c2 on c.id  = c2.courseId \n"
				+ "WHERE c2.userId = ?;";
		ArrayList<Course> courses = new ArrayList<>();
		try {
			con = DBContext.makeConnection();
			if (con != null) {
				ps = con.prepareStatement(query);
				ps.setInt(1, userId);
				rs = ps.executeQuery();
				while (rs.next()) {
					courses.add(Course.builder().id(rs.getInt("id")).courseName(rs.getString("courseName"))
							.status(rs.getInt("status")).image(rs.getString("image"))
							.description(rs.getString("description")).createDate(rs.getDate("createDate")).build());
				}
			}
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return courses;
	}

	public List<Course> getAllCoursesIncluceTeacher(String searchValue, String teacherName)
			throws SQLException, Exception {
		String query = "SELECT  DISTINCT c.id , c.courseName , c.status , c.[image] , c.description, c.createDate, c2.userId as accountId from Course c\r\n"
				+ "      left outer join Class c2 ON c.id = c2.courseId \r\n"
				+ "	  left outer join Account a on c2.userId = a.id\r\n"
				+ "     where c.courseName like ? and a.fullname like ? ";
		ArrayList<Course> courses = new ArrayList<>();
		try {
			con = DBContext.makeConnection();
			if (con != null) {
				ps = con.prepareStatement(query);
				ps.setString(1, "%" + searchValue + "%");
				ps.setNString(2, "%" + teacherName + "%");
				rs = ps.executeQuery();
				while (rs.next()) {
					courses.add(Course.builder().id(rs.getInt("id")).courseName(rs.getString("courseName"))
							.status(rs.getInt("status")).image(rs.getString("image"))
							.description(rs.getString("description")).createDate(rs.getDate("createDate"))
							.account(accountDAO.getAccountById(rs.getInt("accountId"))).build());
				}
			}
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return courses;
	}

//    INSERT INTO [e-learner].dbo.Course (courseName, status, [image], description, createDate) VALUES('', 0, '', '', '');
	public Course saveCourse(Course course) throws SQLException, Exception {
		String query = "INSERT INTO Course (courseName, status, [image], description, createDate) VALUES(?, ?, ?, ?, ?);";
		try {
			con = DBContext.makeConnection();
			if (con != null) {
				ps = con.prepareStatement(query);
				ps.setString(1, course.getCourseName());
				ps.setInt(2, course.getStatus());
				ps.setString(3, course.getImage());
				ps.setString(4, course.getDescription());
				ps.setDate(5, new Date(course.getCreateDate().getTime()));

				if (ps.executeUpdate() > 0) {
					return getLastCourse();
				}
			}
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return null;
	}

	public boolean updateCourse(Course course) throws Exception {
		String query = "UPDATE Course " + "SET courseName=?," + "   image=?, " + "   status=?, " + "   description=? "
				+ "WHERE id = ?";
		try {
			con = DBContext.makeConnection();
			if (con != null) {
				ps = con.prepareStatement(query);
				ps.setString(1, course.getCourseName());
				ps.setString(2, course.getImage());
				ps.setInt(3, course.getStatus());
				ps.setString(4, course.getDescription());
				ps.setInt(5, course.getId());
				if (ps.executeUpdate() > 0) {
					return true;
				}
			}
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return false;
	}

	public boolean deleteCourse(int courseId) throws Exception {
		String query = "delete from Course where id=?";
		try {
			con = DBContext.makeConnection();
			if (con != null) {
				ps = con.prepareStatement(query);
				ps.setInt(1, courseId);
				if (ps.executeUpdate() > 0) {
					return true;
				}
			}
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return false;
	}
}
