package Dao;

import java.sql.ResultSet;
import java.util.Vector;

import DBConnection.DB;
import JavaBean.NewZone;

public class FindNewZoneDAO {

	private DB db = new DB();

	public Vector<NewZone> findAllNewZone() {
		db.ConnectDB();
		ResultSet rs = null;
		Vector<NewZone> newzones = new Vector<NewZone>();
		try {
			String sql = " select id,name,level,address,description,x,y from new_zone ";
			rs = db.sm.executeQuery(sql);
			while (rs.next()) {
				newzones.addElement(new NewZone(rs.getInt(1), rs.getString(2),
						rs.getString(3), rs.getString(4), rs.getString(5), rs
								.getDouble(6), rs.getDouble(7)));
			}
			return newzones;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			db.CloseDB();
		}
	}
}
