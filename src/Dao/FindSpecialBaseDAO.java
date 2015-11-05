package Dao;

import java.sql.ResultSet;
import java.util.Vector;

import DBConnection.DB;
import JavaBean.SpecialBase;

public class FindSpecialBaseDAO {

	private DB db = new DB();

	public Vector<SpecialBase> findAllSpecialBases() {
		db.ConnectDB();
		ResultSet rs = null;
		Vector<SpecialBase> specialBases = new Vector<SpecialBase>();
		try {
			String sql = " select id,name,level,x,y,link from specialbase ";
			rs = db.sm.executeQuery(sql);
			while (rs.next()) {
				specialBases.addElement(new SpecialBase(rs.getInt(1), rs
						.getString(2), rs.getString(3), rs.getDouble(4), rs
						.getDouble(5), rs.getString(6)));
			}
			return specialBases;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			db.CloseDB();
		}
	}
	
	//FindSpecialItems
	public Vector<SpecialBase> FindSpecialItems(int levelid) {
		db.ConnectDB();
		ResultSet rs = null;
		Vector<SpecialBase> specialBases = new Vector<SpecialBase>();
		String  level="";
		switch(levelid)
		{
		case 0:
			level="高新技术（现代服务业）产业化基地";
			break;
		case 1:
			level="省级火炬计划特色产业基地";
			break;
		case 2:
			level="国家火炬计划特色产业基地";
			break;
		}
		
		try {
			String sql = "select name,level from specialbase where level='"+level+"'";
			rs = db.sm.executeQuery(sql);
			while (rs.next()) {
				SpecialBase  temp=new SpecialBase();
				temp.setName(rs.getString(1));
				temp.setLevel(rs.getString(2));
				System.out.println(rs.getString(1)+"---"+rs.getString(2));
				specialBases.add(temp);
			}
			return specialBases;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			db.CloseDB();
		}
	}
	
	public static void main(String[] args)
	{
		new FindSpecialBaseDAO().FindSpecialItems(2);
	}
}
