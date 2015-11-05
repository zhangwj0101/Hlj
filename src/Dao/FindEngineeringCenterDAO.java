package Dao;

import java.sql.ResultSet;
import java.util.Vector;

import DBConnection.DB;
import JavaBean.EngineeringCenter;

public class FindEngineeringCenterDAO {

	private DB db = new DB();

	public Vector<EngineeringCenter> findAllEngineeringCenters() {
		db.ConnectDB();
		ResultSet rs = null;
		Vector<EngineeringCenter> engineeringCenters = new Vector<EngineeringCenter>();
		try {
			String sql = " select id,name,orgname,category,x,y,link from engineeringcenter ";
			rs = db.sm.executeQuery(sql);
			while (rs.next()) {
				engineeringCenters.addElement(new EngineeringCenter(rs
						.getInt(1), rs.getString(2), rs.getString(3), rs
						.getString(4), rs.getDouble(5), rs.getDouble(6), rs
						.getString(7)));
			}
			return engineeringCenters;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			db.CloseDB();
		}
	}
	public Vector<EngineeringCenter> findAllEngineeringCenters(String category) {
		db.ConnectDB();
		ResultSet rs = null;
		Vector<EngineeringCenter> engineeringCenters = new Vector<EngineeringCenter>();
		try {
			String sql = "select id,name,orgname,category,x,y,link from engineeringcenter where category='"
					+ category + "'";
			rs = db.sm.executeQuery(sql);
			while (rs.next()) {
				engineeringCenters.addElement(new EngineeringCenter(rs
						.getInt(1), rs.getString(2), rs.getString(3), rs
						.getString(4), rs.getDouble(5), rs.getDouble(6), rs
						.getString(7)));
			}
			return engineeringCenters;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			db.CloseDB();
		}
	}
}
