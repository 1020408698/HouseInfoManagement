package house.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

//数据库增删改查
public class HouseDao {
	public boolean deleteHouse(String owner) {
		try {
			String driverClass = "com.mysql.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/house";
			String username = "root";
			String password = "root";
			Class.forName(driverClass);// 加载驱动
			Connection connection = DriverManager.getConnection(url, username, password);
			String sql = "delete from allhouseinfo where owner=?";
			PreparedStatement pStatement = connection.prepareStatement(sql);
			pStatement.setString(1, owner);
			int count = pStatement.executeUpdate();
			if (count > 0) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean deleteUser(String user) {
		try {
			String driverClass = "com.mysql.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/house";
			String username = "root";
			String password = "root";
			Class.forName(driverClass);// 加载驱动
			Connection connection = DriverManager.getConnection(url, username, password);
			String sql = "delete from userlogin where username=?";
			PreparedStatement pStatement = connection.prepareStatement(sql);
			pStatement.setString(1, user);
			int count = pStatement.executeUpdate();
			String sql1 = "drop table " + user+";";
			Statement createtable = connection.createStatement();
			int rscreate = createtable.executeUpdate(sql1);
			if (count > 0) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean deleteMessage(String user) {
		try {
			String driverClass = "com.mysql.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/house";
			String username = "root";
			String password = "root";
			Class.forName(driverClass);// 加载驱动
			Connection connection = DriverManager.getConnection(url, username, password);
			String sql = "delete from content where username=?";
			PreparedStatement pStatement = connection.prepareStatement(sql);
			pStatement.setString(1, user);
			int count = pStatement.executeUpdate();
			if (count > 0) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean setHotSale(String user) {
		int houseprice = 0;
		String housetype = null;
		byte[] buff = null;
		PreparedStatement pstmt;
		try {
			String driverClass = "com.mysql.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/house";
			String username = "root";
			String password = "root";
			Class.forName(driverClass);// 加载驱动
			Connection connection = DriverManager.getConnection(url, username, password);
			Statement stmt = null;
			ResultSet rs = null;
			String sql = "select * from allhouseinfo where owner='"+user+"';"; //查询语句
			System.out.println(sql);
			stmt = connection.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				houseprice = rs.getInt("houseprice");
				housetype = rs.getString("housetype");
				buff = rs.getBytes("housephoto");
			}
			String sql2 = "insert into hotsale(owner,housetype,houseprice,housephoto)values(?,?,?,?);";
			pstmt = connection.prepareStatement(sql2);// 预处理
			pstmt.setString(1, user);// 将第一个占位符（?）设值
			pstmt.setString(2, housetype);// 将第一个占位符（?）设值
			pstmt.setInt(3, houseprice);
			pstmt.setBytes(4, buff);// 图片占位符设值
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
