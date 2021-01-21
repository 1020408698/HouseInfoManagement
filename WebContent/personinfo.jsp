<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户后台管理系统</title>
<link rel="stylesheet" type="text/css" href="css/common.css" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
<style>
.black_overlay {
	display: none;
	position: absolute;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	background-color: black;
	z-index: 1001;
	-moz-opacity: 0.8;
	opacity: .80;
	filter: alpha(opacity = 88);
}

.white_content {
	display: none;
	position: absolute;
	top: 25%;
	left: 50%;
	width: 13%;
	height: 55%;
	padding: 20px;
	border: 1px solid #ccc;
	background-color: white;
	z-index: 1002;
	overflow: auto;
}
</style>
</head>

<body>
	<div class="topbar-wrap white">
		<div class="topbar-inner clearfix">
			<div class="topbar-logo-wrap clearfix">
				<ul class="navbar-list clearfix">
					<li><a class="on" href="index.jsp">房产信息网</a></li>
				</ul>
			</div>
			<div class="top-info-wrap">
				<ul class="top-info-list clearfix">
					<li>
						<p>
							客户：（<%=session.getAttribute("username")%>），您好！
						</p>
					</li>
					<li><a href="login.jsp">退出</a></li>
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
							<li><a href="personinfo.jsp"><i class="icon-font">&#xe00c;</i>个人资料管理</a></li>
							<li><a href="houseinfo.jsp"><i class="icon-font">&#xe005;</i>房屋信息发布</a></li>
							<li><a href="mypublish.jsp"><i class="icon-font">&#xe004;</i>我的发布</a></li>
						</ul>
					</li>
					<li><a href="#"><i class="icon-font">&#xe018;</i>系统管理</a>
						<ul class="sub-menu">
							<li><a href="system.jsp"><i class="icon-font">&#xe017;</i>系统查看</a>
							</li>
						</ul></li>
				</ul>
			</div>
		</div>
		<div class="main-wrap">
			<div class="crumb-wrap">
				<div class="crumb-list">
					<i class="icon-font"></i> <a href="user.jsp">首页</a>
					<span class="crumb-step">&gt;</span> 
					<a href="personinfo.jsp"><span class="crumb-name">个人信息</span></a>
				</div>
			</div>
			<div class="result-wrap">
				<form name="myform" id="myform" method="post">
					<div class="result-title">
						<div class="result-list">
							<a href="addinfo.jsp"><i class="icon-font">&#xe002;</i>添加个人信息</a>
							<a id="updateOrd" href="personinfo.jsp"><i class="icon-font">&#xe017;</i>更新个人信息</a>
						</div>
					</div>
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
								<td align="center">用户编号</td>
								<td align="center">姓名</td>
								<td align="center">年龄</td>
								<td align="center">出生日期</td>
								<td align="center">手机号</td>
								<td align="center">邮箱</td>
								<td align="center">操作</td>
							</tr>
							<%
								Statement stmt = null;
								ResultSet rs = null;
								Statement stmt1 = null;
								String sql = "SELECT * FROM " + session.getAttribute("username") + ";"; //查询语句
								stmt = conn.createStatement();
								rs = stmt.executeQuery(sql);
								while (rs.next()) {
							%>
							<tr>
								<td align="center"><%=rs.getString("usernumber")%></td>
								<td align="center"><%=rs.getString("name")%></td>
								<td align="center"><%=rs.getInt("age")%></td>
								<td align="center"><%=rs.getString("birthday")%></td>
								<td align="center"><%=rs.getString("phone")%></td>
								<td align="center"><%=rs.getString("email")%></td>
								<td align="center">
								<a href="javascript:void(0)" onclick="document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">修改</a>
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
	<div id="light" class="white_content">
		<h2 align="center">客户信息修改表</h2>
		<form action="change.jsp" method="post">
			<div class="input-group">
				<span><i class="fa fa-user" aria-hidden="true"></i></span> <input
					type="text" placeholder="客户编号" required="" style="font-family: none"
					name="usernumber">
			</div>
			<div class="input-group">
				<span><i class="fa fa-lock" aria-hidden="true"></i></span> <input
					type="text" placeholder="姓名" required="" style="font-family: none"
					name="username">
			</div>
			<div class="input-group">
				<span><i class="fa fa-lock" aria-hidden="true"></i></span> <input
					type="text" placeholder="年龄" required="" style="font-family: none"
					name="age">
			</div>
			<div class="input-group">
				<span><i class="fa fa-lock" aria-hidden="true"></i></span> <input
					type="text" placeholder="出生日期" required=""
					style="font-family: none" name="birthday">
			</div>
			<div class="input-group">
				<span><i class="fa fa-lock" aria-hidden="true"></i></span> <input
					type="text" placeholder="手机号" required="" style="font-family: none"
					name="phonenumber">
			</div>
			<div class="input-group">
				<span><i class="fa fa-lock" aria-hidden="true"></i></span> <input
					type="text" placeholder="邮箱" required="" style="font-family: none"
					name="email">
			</div>
			<button class="btn btn-danger btn-block" type="submit">提交</button>
			<p>
				<a href="personinfo.jsp">返回</a>
			</p>
		</form>
	</div>
	<script>
			var tds = document.getElementsByTagName('td');
			console.log(tds);
			for(var i = 0;i<tds.length;i++){
				if(tds[i].innerHTML=="" || tds.innerText==""){
					tds[i].innerHTML="暂无查询数据";
				}
			}
		</script>
</body>

</html>