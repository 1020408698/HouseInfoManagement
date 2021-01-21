<%@page import="Bean.DBBean"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="db" class="Bean.DBBean" scope="page" />
	<%
		request.setCharacterEncoding("UTF-8");
		String username = (String) request.getParameter("username");
		String password = (String) request.getParameter("password");//取出login.jsp的值
		String sql = "select * from userlogin where username=" + "'" + username + "'";//定义一个查询语句
		ResultSet rs = db.executeQuery(sql);//运行上面的语句
		if (rs.next()) {
			if (password.equals(rs.getObject("password"))) {
				session.setAttribute("username", username);
				if(username.equals("admin")){
					out.println("<script>alert('登陆成功！');window.location.href='admin/admin.jsp';</script>");
				}else{				
					out.println("<script>alert('登陆成功！');window.location.href='user.jsp';</script>");			
				}
			} else {
				out.print("<script language='javaScript'> alert('密码输入错误');</script>");
				response.setHeader("refresh", "0;url=login.jsp");
			}
		} else {
			out.print("<script language='javaScript'> alert('账号输入错误');</script>");
			response.setHeader("refresh", "0;url=login.jsp");
		}
	%>
</body>
</html>