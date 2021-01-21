<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理系统</title>
<link rel="stylesheet" type="text/css" href="css/common.css" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css"
	media="all">
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css"
	media="all">
</head>

<body>
	<div class="topbar-wrap white">
		<div class="topbar-inner clearfix">
			<div class="topbar-logo-wrap clearfix">
				<ul class="navbar-list clearfix">
					<li><a class="on" href="../index.jsp">首页</a></li>
				</ul>
			</div>
			<div class="top-info-wrap">
				<ul class="top-info-list clearfix">
					<li>
						<p>
							管理员（<%=session.getAttribute("username")%>），你好！
						</p>
					</li>
					<li><a href="../login.jsp">退出</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="container clearfix">
		<div class="sidebar-wrap">
			<div class="sidebar-title">
				<h1>菜单</h1>
			</div>
			<div class="sidebar-content">
				<ul class="sidebar-list">
					<li><a href="#"><i class="icon-font">&#xe003;</i>常用操作</a>
						<ul class="sub-menu">
							<li><a href="adminManagement.jsp"><i class="icon-font">&#xe00f;</i>用户信息管理</a></li>
							<li><a href="allrecord.jsp"><i class="icon-font">&#xe005;</i>房屋信息管理</a></li>
							<li><a href="message.jsp"><i class="icon-font">&#xe005;</i>反馈信息管理</a></li>
						</ul></li>
					<li><a href="#"><i class="icon-font">&#xe018;</i>系统管理</a>
						<ul class="sub-menu">
							<li><a href="system.jsp"><i class="icon-font">&#xe017;</i>系统设置查看</a>
							</li>
						</ul></li>
				</ul>
			</div>
		</div>
		<div class="main-wrap">
			<div class="crumb-wrap">
				<div class="crumb-list">
					<i class="icon-font"></i> <a href="admin.jsp">首页</a> <span
						class="crumb-step">&gt;</span> <a href="message.jsp"><span
						class="crumb-name">反馈信息管理</span></a>
				</div>
			</div>
			<div class="result-wrap">
				<form name="myform" id="myform" method="post">
					<%
						try {
							Class.forName("com.mysql.jdbc.Driver"); ////驱动程序名
							String url = "jdbc:mysql://localhost:3306/house"; //数据库名
							String username = "root"; //数据库用户名
							String password = "root"; //数据库用户密码
							Connection conn = DriverManager.getConnection(url, username, password); //连接状态
							if (conn != null) {
					%>
					<div class="result-content">
						<table class="result-tab" width="100%">
							<tr>
								<td align="center">反馈者名字</td>
								<td align="center">电话号码</td>
								<td align="center">人员地址</td>
								<td align="center">反馈信息</td>
								<td align="center">操作</td>
							</tr>
							<%
								Statement stmt = null;
								ResultSet rs = null;
								Statement stmt1 = null;
								String sql = "select * from content;"; //查询语句
								System.out.println(sql);
								stmt = conn.createStatement();
								rs = stmt.executeQuery(sql);
								while (rs.next()) {
							%>
							<tr>
								<td align="center"><%=rs.getString("username")%></td>
								<td align="center"><%=rs.getString("telnumber")%></td>
								<td align="center"><%=rs.getString("address")%></td>
								<td align="center"><%=rs.getString("message")%></td>
								<td align="center">
								<a class="link-del" href="../DeleteMessage?username=<%=rs.getString("username")%>">删除</a>
								</td>
							</tr>
							<%
								}
									} else {
										out.print("连接失败！");
									}
								} catch (Exception e) {
									out.print("数据库连接异常！");
								}
							%>
						</table>
					</div>
				</form>

			</div>
		</div>
		<!--/main-->
	</div>
</body>

</html>