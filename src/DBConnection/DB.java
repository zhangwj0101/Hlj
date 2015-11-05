package DBConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import org.apache.xerces.parsers.DOMParser;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

//import com.sun.org.apache.xerces.internal.parsers.DOMParser;

/**
 * 读取数据库的类
 * @author cjl
 */

public class DB {
	private String jdbcDriver;
	private String dbName;
	private String urlRoot;
	private String username;
	private String password;
	
	public Statement sm = null;
	private Connection conn = null;

	public DB(){
		try
		{
			//构造DOM解析器的实例, 读取xml配置文件的相关信息
			DOMParser parser = new DOMParser();
			
			//开始解析文档，将XML文件转换成DOM树存入内存。
			parser.parse(DB.class.getResource("")+"/DBConnection.xml");
			
			//getDocument()获取Document对象
			Document doc = parser.getDocument();
			
			//获取root节点
			Element elmtInfo = doc.getDocumentElement();
			
			NodeList instruList = elmtInfo.getElementsByTagName("jdbcDriver");
			jdbcDriver = instruList.item(0).getFirstChild().getNodeValue();
			
			instruList = elmtInfo.getElementsByTagName("dbName");
			dbName = instruList.item(0).getFirstChild().getNodeValue();
			
			instruList = elmtInfo.getElementsByTagName("urlRoot");
			urlRoot = instruList.item(0).getFirstChild().getNodeValue();
			
			instruList = elmtInfo.getElementsByTagName("username");
			username = instruList.item(0).getFirstChild().getNodeValue();
			
			instruList = elmtInfo.getElementsByTagName("password");
			password = instruList.item(0).getFirstChild().getNodeValue();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public DB(String db){
		try
		{
			//构造DOM解析器的实例, 读取xml配置文件的相关信息
			DOMParser parser = new DOMParser();
			
			//开始解析文档，将XML文件转换成DOM树存入内存。
			parser.parse(DB.class.getResource("")+"/DBConnection.xml");
			
			//getDocument()获取Document对象
			Document doc = parser.getDocument();
			
			//获取root节点
			Element elmtInfo = doc.getDocumentElement();
			
			NodeList instruList = elmtInfo.getElementsByTagName("jdbcDriver");
			jdbcDriver = instruList.item(0).getFirstChild().getNodeValue();
			
			instruList = elmtInfo.getElementsByTagName(db);
			dbName = instruList.item(0).getFirstChild().getNodeValue();
			
			instruList = elmtInfo.getElementsByTagName("urlRoot");
			urlRoot = instruList.item(0).getFirstChild().getNodeValue();
			
			instruList = elmtInfo.getElementsByTagName("username");
			username = instruList.item(0).getFirstChild().getNodeValue();
			
			instruList = elmtInfo.getElementsByTagName("password");
			password = instruList.item(0).getFirstChild().getNodeValue();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	
	//建立数据库链接
	public void ConnectDB(){
		try {
			Class.forName(jdbcDriver).newInstance();
			conn = DriverManager.getConnection(urlRoot, username , password);
			sm = conn.createStatement();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//关闭数据库链接
	public void CloseDB(){
		try{
			if(sm != null){
				sm.close();
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
