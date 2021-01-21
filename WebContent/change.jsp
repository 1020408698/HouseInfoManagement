<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String usernumber = request.getParameter("usernumber");
		String user = new String(request.getParameter("username").getBytes("ISO-8859-1"), "UTF-8");
		int age = Integer.parseInt(request.getParameter("age"));
		String birthday = request.getParameter("birthday");
		String phonenumber = request.getParameter("phonenumber");
		String email = request.getParameter("email");

		String driverClass = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/house";
		String username = "root";
		String password = "root";
		Class.forName(driverClass);//加载驱动 
		Connection connection = DriverManager.getConnection(url, username, password);
		String sql = "update " + user +" set usernumber='" + usernumber + "',name='" + user + "',age=" + age + ",birthday='"
				+ birthday + "',phone='" + phonenumber + "',email='" + email + "' WHERE name='" + user + "';";
		System.out.print(sql);
		Statement createtable = connection.createStatement();
		try{
			createtable.execute(sql);
			out.println("<script>alert('客户信息修改成功！');window.location.href='personinfo.jsp';</script>");					
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	%>
</body>
</html>