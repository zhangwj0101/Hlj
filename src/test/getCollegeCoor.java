package test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import net.sf.json.JSONObject;
import DBConnection.DB;

public class getCollegeCoor {

	static DB db = new DB();

	static public void main(String[] args) {
		db.ConnectDB();
		try {
			getCoor();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void getCoor() throws SQLException {

		ArrayList<String> cityList = new ArrayList<String>();
		ArrayList<String> ins_nameList = new ArrayList<String>();

		String sqlQuery = " select district, name from incubator ";
		try {
			ResultSet rs = db.sm.executeQuery(sqlQuery);
			while (rs.next()) {
				cityList.add(rs.getString("district"));
				ins_nameList.add(rs.getString("name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		int length = ins_nameList.size();
		for (int i = 0; i < length; i++) {
			getCoordinate(ins_nameList.get(i), cityList.get(i));
			// getCoordinate(ins_nameList.get(i), null);
		}

	}

	/**
	 * 获取仪器所在地的经纬度坐标
	 * 
	 * @param id
	 *            仪器ID
	 * @param add
	 *            详细地址
	 * @param city
	 *            城市名称
	 * @return 仪器所在地的经纬度坐标数组
	 * @throws SQLException
	 */
	public static String[] getCoordinate(String add, String city)
			throws SQLException {
		String url;
		String lat = "", lng = "";
		String KEY = "RkIOffm8GevmxcBXGr2TeLhG";
		String[] coordinate = new String[2];

		try {
			// 转换特殊字符
			String address = "";
			if (add != null && !"".equals("add"))
				address = java.net.URLEncoder.encode(add, "utf-8");
			url = "http://api.map.baidu.com/geocoder?address=" + address
					+ "&city=" + city + "&output=json&key=" + KEY;
			if (city != null) {
				url = "http://api.map.baidu.com/geocoder?address=" + address
						+ "&city=" + city + "&output=json&key=" + KEY;
			} else {
				url = "http://api.map.baidu.com/geocoder?address=" + address
						+ "&output=json&key=" + KEY;
			}
			String json = loadJSON(url);
			JSONObject obj = JSONObject.fromObject(json);
			if (obj.get("status").toString().equals("OK")
					&& !obj.getString("result").equals("[]")) {
				lng = obj.getJSONObject("result").getJSONObject("location")
						.getString("lng");
				lat = obj.getJSONObject("result").getJSONObject("location")
						.getString("lat");
			} else {
				// System.out.println("未找到相匹配的经纬度！");
			}
			if (lat == "") {
				// 转换特殊字符
				if (add != null && !"".equals("add"))
					address = java.net.URLEncoder.encode(add, "utf-8");
				url = "http://api.map.baidu.com/geocoder?address=" + address
						+ "&output=json&key=" + KEY;
				json = loadJSON(url);
				obj = JSONObject.fromObject(json);
				if (obj.get("status").toString().equals("OK")
						&& !obj.getString("result").equals("[]")) {
					lng = obj.getJSONObject("result").getJSONObject("location")
							.getString("lng");
					lat = obj.getJSONObject("result").getJSONObject("location")
							.getString("lat");
				} else {
					// System.out.println("未找到相匹配的经纬度！");
				}
			}

			if (lat == "") {
				// 转换特殊字符
				if (add != null && !"".equals("add"))
					address = java.net.URLEncoder.encode(add, "utf-8");
				url = "http://api.map.baidu.com/geocoder?address=" + address
						+ "&city=&output=json&key=" + KEY;
				json = loadJSON(url);
				obj = JSONObject.fromObject(json);
				if (obj.get("status").toString().equals("OK")
						&& !obj.getString("result").equals("[]")) {
					lng = obj.getJSONObject("result").getJSONObject("location")
							.getString("lng");
					lat = obj.getJSONObject("result").getJSONObject("location")
							.getString("lat");
				} else {
					// System.out.println("未找到相匹配的经纬度！");
				}
			}

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		coordinate[0] = lat;
		coordinate[1] = lng;

		// 将经纬度坐标写入数据库中
		String sqlQuery = "update incubator set x = " + lat + ", y = "
				+ lng + " where name = '" + add + "' ;";
		System.out.println(sqlQuery);
		// db.sm.executeQuery(sqlQuery);
		return coordinate;
	}

	public static String loadJSON(String url) {
		StringBuilder json = new StringBuilder();
		try {
			URL oracle = new URL(url);
			HttpURLConnection connection = (HttpURLConnection) oracle
					.openConnection();
			connection.setConnectTimeout(5000);

			// 若连接失败，则重新连接
			while (connection.getResponseCode() != HttpURLConnection.HTTP_OK) {
				try {
					Thread.sleep(500);
					connection = (HttpURLConnection) oracle.openConnection();
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
				;
			}
			BufferedReader in = new BufferedReader(new InputStreamReader(
					connection.getInputStream()));
			String inputLine = null;
			while ((inputLine = in.readLine()) != null) {
				json.append(inputLine);
			}
			in.close();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return json.toString();
	}

}
