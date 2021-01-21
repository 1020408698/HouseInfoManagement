package Bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBBean {
	private String driverName = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/house";
	private String dbuser = "root";
	private String dbpassword = "root";
	private Connection conn = null;
	private Statement stmt = null;

	// 数据库连接
	public DBBean() {
		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, dbuser, dbpassword);
			stmt = conn.createStatement();
		} catch (Exception ex) {
			System.out.println("数据连接失败！");
		}

	}

	// 数据库的相关查询
	public ResultSet executeQuery(String s) {
		ResultSet rs = null;
		System.out.print("--查询语句:" + s + "\n");
		try {
			rs = stmt.executeQuery(s);
		} catch (Exception ex) {
			System.out.println("ִ执行查询错误！");
		}
		return rs;
	}

	public void close() {
		try {
			stmt.close();
			conn.close();
		} catch (Exception e) {
		}
	}
}
