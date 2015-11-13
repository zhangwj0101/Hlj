package Dao;

import java.sql.ResultSet;
import java.util.Vector;

import DBConnection.DB;
import JavaBean.AccelerateCenter;

public class FindAccelerateCenterDAO {
	private DB db = new DB();

	public Vector<AccelerateCenter> findAllAcceletateCenters() {
		db.ConnectDB();
		ResultSet rs = null;
		Vector<AccelerateCenter> acceletateCenters = new Vector<AccelerateCenter>();
		try {
			String sql = " select id,name,level,x,y,link from acceleratecenter ";
			rs = db.sm.executeQuery(sql);
			while (rs.next()) {
				acceletateCenters.addElement(new AccelerateCenter(rs.getInt(1),
						rs.getString(2), rs.getString(3), rs.getDouble(4), rs
								.getDouble(5), rs.getString(6)));
			}
			return acceletateCenters;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			db.CloseDB();
		}
	}

	public Vector<AccelerateCenter> findAllAcceletateCenters(String level) {
		db.ConnectDB();
		ResultSet rs = null;
		Vector<AccelerateCenter> acceletateCenters = new Vector<AccelerateCenter>();
		try {
			String sql = "select id,name,level,x,y,link from acceleratecenter where level='"
					+ level + "'";
			rs = db.sm.executeQuery(sql);
			while (rs.next()) {
				acceletateCenters.addElement(new AccelerateCenter(rs.getInt(1),
						rs.getString(2), rs.getString(3), rs.getDouble(4), rs
								.getDouble(5), rs.getString(6)));
			}
			return acceletateCenters;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			db.CloseDB();
		}
	}
}
