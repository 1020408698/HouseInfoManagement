<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String user = new String(request.getParameter("username").getBytes("ISO-8859-1"), "UTF-8");
		String pwd = request.getParameter("password");

		String driverClass = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/house";
		String username = "root";
		String password = "root";
		Class.forName(driverClass);//加载驱动 
		Connection conn = DriverManager.getConnection(url, username, password);//得到连接
		Connection connection = DriverManager.getConnection(url, username, password);
		PreparedStatement pStmt = conn.prepareStatement("select * from userlogin where username = '" + user + "'");
		ResultSet rs = pStmt.executeQuery();
		if (rs.next()) {
			out.println("<script>alert('该用户已存在，请重新注册！');window.location.href='Register.jsp';</script>");
		} else {
			PreparedStatement tmt = conn
					.prepareStatement("Insert into userlogin values('" + user + "','" + pwd + "')");
			int rst = tmt.executeUpdate();
			if (rst != 0) {
				out.println("<script>alert('用户注册成功！');window.location.href='login.jsp';</script>");
			} else {
				out.println("<script>alert('用户注册失败！');window.location.href='Register.jsp';</script>");
			}
		}
		String sql = "create table " + user
				+ "(usernumber varchar(255),name varchar(255),age int,birthday date,phone varchar(255),email varchar(255));";
		Statement createtable = connection.createStatement();
		int rscreate = createtable.executeUpdate(sql);
	%>
</body>
</html>