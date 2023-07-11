package fu.swp.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.spi.DirStateFactory.Result;

import fu.swp.context.DBContext;
import fu.swp.model.Account;
import fu.swp.model.FeedBack;

public class FeedBackDAO {

	PreparedStatement pst = null;
	ResultSet rs = null;
	AccountDAO accountDAO = new AccountDAO();

	public FeedBack getLastFeedBack() throws Exception {
		String url = "select top(1) * from FeedBack order by id desc\r\n";
		Connection con = DBContext.makeConnection();
		try {
			if (con != null) {
				pst = con.prepareStatement(url);
				rs = pst.executeQuery();
				if (rs.next()) {
					FeedBack feedBack = FeedBack.builder().id(rs.getInt("id")).star(rs.getInt("start"))
							.content(rs.getString("content")).date(rs.getDate("date"))
							.userId(accountDAO.getAccountById(rs.getInt("userId"))).teacherId(rs.getInt("teacherId"))
							.build();
					return feedBack;
				}
			}

		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pst != null) {
				pst.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return null;
	}
	
	public FeedBack checkIsFeedBack(int userId, int teacherId) throws Exception {
		String url = "select * from FeedBack where userId = ? and teacherId = ?";
		Connection con = DBContext.makeConnection();
		try {
			if (con != null) {
				pst = con.prepareStatement(url);
				pst.setInt(1, userId);
				pst.setInt(2, teacherId);
				rs = pst.executeQuery();
				if (rs.next()) {
					FeedBack feedBack = FeedBack.builder().id(rs.getInt("id")).star(rs.getInt("start"))
							.content(rs.getString("content")).date(rs.getDate("date"))
							.userId(accountDAO.getAccountById(rs.getInt("userId"))).teacherId(rs.getInt("teacherId"))
							.build();
					return feedBack;
				}
			}
			
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pst != null) {
				pst.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return null;
	}

	public FeedBack saveFeedBack(FeedBack feedBack) throws Exception {
		String url = "INSERT INTO [dbo].[FeedBack]\r\n"
				+ "           ([start],[content],[date],[userId],[teacherId])\r\n" + "     VALUES (?,?,?,?,?);";
		Connection con = DBContext.makeConnection();
		try {
			if (con != null) {
				pst = con.prepareStatement(url);
				pst.setInt(1, feedBack.getStar());
				pst.setString(2, feedBack.getContent());
				pst.setDate(3, new Date(System.currentTimeMillis()));
				pst.setInt(4, feedBack.getUserId().getId());
				pst.setInt(5, feedBack.getTeacherId());
				if (pst.executeUpdate() > 0) {
					return getLastFeedBack();
				}
			}

		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pst != null) {
				pst.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return null;
	}

	public List<FeedBack> getFeedBackByTeacherId(int teacherId) throws Exception {
		String url = "select * from FeedBack where teacherId = ? \r\n";
		List<FeedBack> feedBacks = new ArrayList<>();
		Connection con = DBContext.makeConnection();
		try {
			if (con != null) {
				pst = con.prepareStatement(url);
				pst.setInt(1, teacherId);
				rs = pst.executeQuery();
				while (rs.next()) {
					FeedBack feedBack = FeedBack.builder().id(rs.getInt("id")).star(rs.getInt("start"))
							.content(rs.getString("content")).date(rs.getDate("date"))
							.userId(accountDAO.getAccountById(rs.getInt("userId"))).teacherId(rs.getInt("teacherId"))
							.build();
					feedBacks.add(feedBack);
				}
			}

		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pst != null) {
				pst.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return feedBacks;
	}

}
