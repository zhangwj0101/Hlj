package test;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;

import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import DBConnection.DB;

public class ExcelParser {

	static DB db = new DB();

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Workbook readwb = null;
		try {
			db.ConnectDB();
			InputStream in = new FileInputStream("E://哈尔滨//temp.xls");
			readwb = Workbook.getWorkbook(in);
			Sheet readsheet = readwb.getSheet(0);
			int rsColumns = readsheet.getColumns();
			int rsRows = readsheet.getRows();
			for (int i = 1; i < rsRows; i++) {
				String sqlQuery = "update incubator_copy set description = '"
						+ readsheet.getCell(4, i).getContents() + "' where id="
						+ readsheet.getCell(0, i).getContents();
				System.out.println(sqlQuery);
				db.sm.executeUpdate(sqlQuery);
			}
			readwb.close();
			in.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (BiffException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
