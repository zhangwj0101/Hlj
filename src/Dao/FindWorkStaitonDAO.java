package Dao;

import java.sql.ResultSet;
import java.util.Vector;

import DBConnection.DB;
import JavaBean.WorkStation;

public class FindWorkStaitonDAO {

	private DB db = new DB();

	public Vector<WorkStation> findAllWorkStations() {
		db.ConnectDB();
		ResultSet rs = null;
		Vector<WorkStation> workStations = new Vector<WorkStation>();
		try {
			String sql = " select id,name,district,x,y,link from workstation ";
			rs = db.sm.executeQuery(sql);
			while (rs.next()) {
				workStations.addElement(new WorkStation(rs.getInt(1), rs
						.getString(2), rs.getString(3), rs.getDouble(4), rs
						.getDouble(5), rs.getString(6)));
			}
			return workStations;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			db.CloseDB();
		}
	}
}
