/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fu.swp.dao;

import fu.swp.context.DBContext;
import fu.swp.model.Class;
import fu.swp.model.Lesson;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DW
 */
public class ClassDAO {

	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	AccountDAO accountDAO = new AccountDAO();
	CourseDAO courseDAO = new CourseDAO();

	public List<fu.swp.model.Class> getClassByTeacherId(int teacher) throws SQLException, Exception {
		String query = "SELECT * from Class c WHERE c.userId = ?;";
		ArrayList<fu.swp.model.Class> classes = new ArrayList<>();
		try {
			con = DBContext.makeConnection();
			if (con != null) {
				ps = con.prepareStatement(query);
				ps.setInt(1, teacher);
				rs = ps.executeQuery();
				while (rs.next()) {
					classes.add(fu.swp.model.Class.builder().id(rs.getInt("Id")).className(rs.getString("className"))
							.maxStudent(rs.getInt("maxStudent")).account(accountDAO.getAccountById(rs.getInt("userId")))
							.dateCreate(rs.getDate("dateCreate")).image(rs.getString("image"))
							.status(rs.getInt("status")).course(courseDAO.getCourseById(rs.getInt("courseId")))
							.build());
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
		return classes;
	}

	public fu.swp.model.Class getClassById(int classId) throws SQLException, Exception {
		String query = "SELECT * from Class c WHERE c.id = ?;";

		try {
			con = DBContext.makeConnection();
			if (con != null) {
				ps = con.prepareStatement(query);
				ps.setInt(1, classId);
				rs = ps.executeQuery();
				if (rs.next()) {
					return fu.swp.model.Class.builder().id(rs.getInt("Id")).className(rs.getString("className"))
							.maxStudent(rs.getInt("maxStudent")).account(accountDAO.getAccountById(rs.getInt("userId")))
							.dateCreate(rs.getDate("dateCreate")).image(rs.getString("image"))
							.status(rs.getInt("status")).course(courseDAO.getCourseById(rs.getInt("courseId"))).build();
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

	public fu.swp.model.Class getClassLastClass() throws SQLException, Exception {
		String query = "SELECT top(1) * from Class c order by c.id desc;";

		try {
			con = DBContext.makeConnection();
			if (con != null) {
				ps = con.prepareStatement(query);
				rs = ps.executeQuery();
				if (rs.next()) {
					return fu.swp.model.Class.builder().id(rs.getInt("Id")).className(rs.getString("className"))
							.maxStudent(rs.getInt("maxStudent")).account(accountDAO.getAccountById(rs.getInt("userId")))
							.dateCreate(rs.getDate("dateCreate")).image(rs.getString("image"))
							.status(rs.getInt("status")).course(courseDAO.getCourseById(rs.getInt("courseId"))).build();
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

	public List<fu.swp.model.Class> getClassByCourseId(int courseId) throws SQLException, Exception {
		String query = "SELECT * from Class c WHERE c.courseId = ?;";
		ArrayList<fu.swp.model.Class> classes = new ArrayList<>();
		try {
			con = DBContext.makeConnection();
			if (con != null) {
				ps = con.prepareStatement(query);
				ps.setInt(1, courseId);
				rs = ps.executeQuery();
				while (rs.next()) {
					classes.add(fu.swp.model.Class.builder().id(rs.getInt("Id")).className(rs.getString("className"))
							.maxStudent(rs.getInt("maxStudent")).account(accountDAO.getAccountById(rs.getInt("userId")))
							.dateCreate(rs.getDate("dateCreate")).image(rs.getString("image"))
							.status(rs.getInt("status")).course(courseDAO.getCourseById(rs.getInt("courseId")))
							.build());
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
		return classes;
	}

	public boolean isOwnerCourse(int courseId, int userId) throws SQLException, Exception {
		String query = "SELECT * from Class c WHERE c.courseId = ? and c.userId = ?;";

		try {
			con = DBContext.makeConnection();
			if (con != null) {
				ps = con.prepareStatement(query);
				ps.setInt(1, courseId);
				ps.setInt(2, userId);
				rs = ps.executeQuery();
				if (rs.next()) {
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

	public Class insertClass(Class clazz) throws Exception {
		String query = "insert into Class (className, maxStudent, userId, dateCreate, image, status, courseId) "
				+ "values (?, ?, ?, ?, ?, ?, ?);";

		try {
			con = DBContext.makeConnection();
			if (con != null) {
				ps = con.prepareStatement(query);
				ps.setString(1, clazz.getClassName());
				ps.setInt(2, clazz.getMaxStudent());
				ps.setInt(3, clazz.getAccount().getId());
				ps.setDate(4, new Date(clazz.getDateCreate().getTime()));
				ps.setString(5, clazz.getImage());
				ps.setInt(6, clazz.getStatus());
				ps.setInt(7, clazz.getCourse().getId());
				if (ps.executeUpdate() > 0) {
					return getClassLastClass();
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

	public boolean updateClass(Class clazz) throws Exception {
		String query = "update Class " + "set className=?, " + "   maxStudent=?, " + "   userId=?, " + "   image=?, "
				+ "   status=? " + "where id=?";

		try {
			con = DBContext.makeConnection();
			if (con != null) {
				ps = con.prepareStatement(query);
				ps.setString(1, clazz.getClassName());
				ps.setInt(2, clazz.getMaxStudent());
				ps.setInt(3, clazz.getAccount().getId());
				ps.setString(4, clazz.getImage());
				ps.setInt(5, clazz.getStatus());
				ps.setInt(6, clazz.getId());
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

	public boolean deleteClass(int classId) throws Exception {
		String query = "delete from Class where id=?";
		try {
			con = DBContext.makeConnection();
			if (con != null) {
				ps = con.prepareStatement(query);
				ps.setInt(1, classId);
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
