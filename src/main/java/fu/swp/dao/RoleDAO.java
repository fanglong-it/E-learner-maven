package fu.swp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import fu.swp.context.DBContext;
import fu.swp.model.Account;
import fu.swp.model.Role;

public class RoleDAO {
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public Role getRoleByRoleName(String roleName) throws SQLException, Exception {
		String query = "select * from role where roleName = ?";
		try {
			con = DBContext.makeConnection();
			if (con != null) {
				ps = con.prepareStatement(query);
				ps.setString(1, roleName.toUpperCase());
				rs = ps.executeQuery();
				if (rs.next()) {
					return new Role(rs.getInt("roleId"), rs.getString("roleName"));
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
