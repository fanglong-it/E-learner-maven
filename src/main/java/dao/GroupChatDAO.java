/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import model.Course;
import model.GroupChat;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DW
 */
public class GroupChatDAO {

	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	AccountDAO accountDAO = new AccountDAO();
	ClassDAO classDAO = new ClassDAO();
//    

	public List<GroupChat> getAllGroupChatByUserId(int userId) throws SQLException, Exception {
		String query = "		Select gc.id , gc.groupChatName, gc.isPrivate , gc.classId \n"
				+ "		from GroupChat gc left join [Member] m on gc.id = m.groupChatId \n"
				+ "		WHERE m.userId = ?\n" + "		";
		ArrayList<GroupChat> groupChats = new ArrayList<>();
		try {
			con = DBContext.makeConnection();
			if (con != null) {
				ps = con.prepareStatement(query);
				ps.setInt(1, userId);
				rs = ps.executeQuery();
				while (rs.next()) {
					groupChats.add(GroupChat.builder().id(rs.getInt("id")).groupChatName(rs.getString("groupChatName"))
							.isPrivate(rs.getInt("isPrivate")).clas(classDAO.getClassById(rs.getInt("classId")))
							// .account(accountDAO.getAccountById(rs.getInt("userId")))
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
		return groupChats;
	}

	public List<GroupChat> getAllGroupChatExceptStudent(int userId) throws SQLException, Exception {
		String query = "Select gc.id , gc.groupChatName, gc.isPrivate , gc.classId \n"
				+ "		from GroupChat gc left join [Member] m on gc.id = m.groupChatId \n"
				+ "		Where m.userId = ?\n";
		ArrayList<GroupChat> groupChats = new ArrayList<>();
		try {
			con = DBContext.makeConnection();
			if (con != null) {
				ps = con.prepareStatement(query);
				ps.setInt(1, userId);
				rs = ps.executeQuery();
				while (rs.next()) {
					groupChats.add(GroupChat.builder().id(rs.getInt("id")).groupChatName(rs.getString("groupChatName"))
							.isPrivate(rs.getInt("isPrivate")).clas(classDAO.getClassById(rs.getInt("classId")))
							// .account(accountDAO.getAccountById(rs.getInt("userId")))
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
		return groupChats;
	}

	public List<GroupChat> getAllGroupChatByClassId(int classId) throws SQLException, Exception {
		String query = "Select gc.id , gc.groupChatName, gc.isPrivate , gc.classId \n"
				+ "		from GroupChat gc where gc.classId = ?";
		ArrayList<GroupChat> groupChats = new ArrayList<>();
		try {
			con = DBContext.makeConnection();
			if (con != null) {
				ps = con.prepareStatement(query);
				ps.setInt(1, classId);
				rs = ps.executeQuery();
				while (rs.next()) {
					groupChats.add(GroupChat.builder().id(rs.getInt("id")).groupChatName(rs.getString("groupChatName"))
							.isPrivate(rs.getInt("isPrivate")).clas(classDAO.getClassById(rs.getInt("classId")))
							// .account(accountDAO.getAccountById(rs.getInt("userId")))
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
		return groupChats;
	}

	public GroupChat getGroupChatById(int groupChatId) throws SQLException, Exception {
		String query = "Select gc.id , gc.groupChatName, gc.isPrivate , gc.classId \n"
				+ "		from GroupChat gc where gc.id = ?";
		try {
			con = DBContext.makeConnection();
			if (con != null) {
				ps = con.prepareStatement(query);
				ps.setInt(1, groupChatId);
				rs = ps.executeQuery();
				if (rs.next()) {
					return GroupChat.builder().id(rs.getInt("id")).groupChatName(rs.getString("groupChatName"))
							.isPrivate(rs.getInt("isPrivate")).clas(classDAO.getClassById(rs.getInt("classId")))
							// .account(accountDAO.getAccountById(rs.getInt("userId")))
							.build();

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

	public GroupChat getLastGroupChat() throws SQLException, Exception {
		String query = "Select top(1) gc.id , gc.groupChatName, gc.isPrivate , gc.classId \n"
				+ "		from GroupChat gc order by gc.id desc";
		try {
			con = DBContext.makeConnection();
			if (con != null) {
				ps = con.prepareStatement(query);
				rs = ps.executeQuery();
				if (rs.next()) {
					return GroupChat.builder().id(rs.getInt("id")).groupChatName(rs.getString("groupChatName"))
							.isPrivate(rs.getInt("isPrivate")).clas(classDAO.getClassById(rs.getInt("classId")))
							// .account(accountDAO.getAccountById(rs.getInt("userId")))
							.build();

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

	public GroupChat insertGroupChat(GroupChat groupChat) throws SQLException, Exception {
		String query = "INSERT INTO [dbo].[GroupChat]\r\n" + "           ([groupChatName],[isPrivate],[classId])\r\n"
				+ "     VALUES\r\n" + "           (?,?,?);";
		try {
			con = DBContext.makeConnection();
			if (con != null) {
				ps = con.prepareStatement(query);
				ps.setString(1, groupChat.getGroupChatName());
				ps.setInt(2, groupChat.getIsPrivate());
				ps.setNull(3, 0);
				if (ps.executeUpdate() > 0) {
					return getLastGroupChat();
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

	public GroupChat insertGroupChatAdmin(GroupChat groupChat) throws SQLException, Exception {
		String query = "INSERT INTO [dbo].[GroupChat]\r\n" + "           ([groupChatName],[isPrivate],[classId])\r\n"
				+ "     VALUES\r\n" + "           (?,?,?);";
		try {
			con = DBContext.makeConnection();
			if (con != null) {
				ps = con.prepareStatement(query);
				ps.setString(1, groupChat.getGroupChatName());
				ps.setInt(2, groupChat.getIsPrivate());
				ps.setInt(3, groupChat.getClas().getId());
				if (ps.executeUpdate() > 0) {
					return getLastGroupChat();
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

}
