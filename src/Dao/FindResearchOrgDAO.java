package Dao;

import java.sql.ResultSet;
import java.util.Vector;

import DBConnection.DB;
import JavaBean.ResearchOrg;

public class FindResearchOrgDAO {

	private DB db = new DB();

	public Vector<ResearchOrg> findAllResearchOrgs() {
		db.ConnectDB();
		ResultSet rs = null;
		Vector<ResearchOrg> researchOrgs = new Vector<ResearchOrg>();
		try {
			String sql = " select id,name,district,x,y,link from college ";
			rs = db.sm.executeQuery(sql);
			while (rs.next()) {
				researchOrgs.addElement(new ResearchOrg(rs.getInt(1), rs
						.getString(2), rs.getString(3), rs.getDouble(4), rs
						.getDouble(5), rs.getString(6)));
			}
			return researchOrgs;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			db.CloseDB();
		}
	}
}
