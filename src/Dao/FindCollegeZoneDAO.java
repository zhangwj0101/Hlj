package Dao;

import java.sql.ResultSet;
import java.util.Vector;

import DBConnection.DB;
import JavaBean.CollegeZone;

public class FindCollegeZoneDAO {

	private DB db = new DB();

	public Vector<CollegeZone> findAllCollegeZones() {
		db.ConnectDB();
		ResultSet rs = null;
		Vector<CollegeZone> collegezones = new Vector<CollegeZone>();
		try {
			String sql = " select id,name,address,level,phone,description,x,y,link from college_zone ";
			rs = db.sm.executeQuery(sql);
			while (rs.next()) {
				collegezones.addElement(new CollegeZone(rs.getInt(1), rs
						.getString(2), rs.getString(3), rs.getString(4), rs
						.getString(5), rs.getString(6), rs.getDouble(7), rs
						.getDouble(8), rs.getString(9)));
			}
			return collegezones;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			db.CloseDB();
		}
	}
}
