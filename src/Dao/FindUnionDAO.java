package Dao;

import java.sql.ResultSet;
import java.util.Vector;

import DBConnection.DB;
import JavaBean.Union;
import JavaBean.UnionCategory;

public class FindUnionDAO {

	private DB db = new DB();

	public Vector<UnionCategory> FindUnionCategories() {
		db.ConnectDB();
		ResultSet rs = null;
		Vector<UnionCategory> unionCategories = new Vector<UnionCategory>();
		try {
			String sql = "select a.category, count(a.category) b from `union` a GROUP BY a.category ORDER BY b";
			rs = db.sm.executeQuery(sql);
			while (rs.next()) {
				unionCategories.addElement(new UnionCategory(rs.getString(1),
						rs.getString(2)));
			}
			return unionCategories;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			db.CloseDB();
		}
	}

	public Vector<String> FindUnions() {
		db.ConnectDB();
		ResultSet rs = null;
		Vector<String> unions = new Vector<String>();
		try {
			String sql = "select name from `union` ";
			rs = db.sm.executeQuery(sql);
			while (rs.next()) {
				String name = rs.getString(1);
				unions.addElement(name.substring(0, name.length() - 10));
			}
			return unions;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			db.CloseDB();
		}
	}
	
	//
	public Vector<Union> FindUnionItems(int  category) {
		db.ConnectDB();
		ResultSet rs = null;
		Vector<Union> unions = new Vector<Union>();
		String  type = null;
		switch(category)
		{
		case 0:
			type="航空航天技术";break;
		case 1:
			type="资源与环境技术";break;
		case 2:
			type="新能源及节能技术";break;
		case 3:
			type="新医药技术";break;
		case 4:
			type="电子信息技术";break;
		case 5:
			type="先进制造技术";break;
		case 6:
			type="新材料技术";break;
		case 7:
			type="生物技术";break;
		}
		
		try {
			String sql = "select name,level from `union`  where category='"+type+"'";
			rs = db.sm.executeQuery(sql);
			while (rs.next()) {
				String name = rs.getString(1);
				System.out.println(name+"----"+rs.getString(2));
				Union temp=new Union();
				temp.setName(rs.getString(1));
				temp.setLevel(rs.getString(2));
				temp.setCategory(type);
				unions.add(temp);
			}
			return unions;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			db.CloseDB();
		}
	}
	
	
	public static void main(String[] args) {
		new FindUnionDAO().FindUnionItems(7);
	}
}
