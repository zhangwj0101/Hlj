package Dao;

import java.sql.ResultSet;
import java.util.Vector;

import DBConnection.DB;
import JavaBean.College;

public class FindCollegeDAO {

	private DB db = new DB();

	public Vector<College> findAllCollege() {
		db.ConnectDB();
		ResultSet rs = null;
		Vector<College> colleges = new Vector<College>();
		try {
			String sql = " select id,name,district,x,y,link,level from college ";
			rs = db.sm.executeQuery(sql);
			while (rs.next()) {
				colleges.addElement(new College(rs.getInt(1), rs.getString(2),
						rs.getString(3), rs.getDouble(4), rs.getDouble(5), rs
								.getString(6),rs.getString(7)));
			}
			return colleges;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			db.CloseDB();
		}
	}
}
