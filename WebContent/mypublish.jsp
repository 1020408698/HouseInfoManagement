<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户后台管理系统</title>
<link rel="stylesheet" type="text/css" href="css/common.css" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css"
	media="all">
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
						</ul></li>
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
					<i class="icon-font"></i> <a href="user.jsp">首页</a> <span
						class="crumb-step">&gt;</span> <a href="mypublish.jsp"><span
						class="crumb-name">我的发布</span></a>
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
								<td align="center">房屋编号</td>
								<td align="center">房屋名称</td>
								<td align="center">户主名字</td>
								<td align="center">房屋类型</td>
								<td align="center">所在楼层</td>
								<td align="center">房屋面积</td>
								<td align="center">交易价格</td>
								<td align="center">房屋照片</td>
								<td align="center">备注说明</td>
								<td align="center">联系电话</td>
							</tr>
							<%
								Statement stmt = null;
								ResultSet rs = null;
								Statement stmt1 = null;
								String sql = "select * from allhouseinfo where owner= '"+session.getAttribute("username")+"';"; //查询语句
								System.out.println(sql);
								stmt = conn.createStatement();
								rs = stmt.executeQuery(sql);
								while (rs.next()) {
							%>
							<tr>
								<td align="center"><%=rs.getString("housenumber")%></td>
								<td align="center"><%=rs.getString("housename")%></td>
								<td align="center"><%=rs.getString("owner")%></td>
								<td align="center"><%=rs.getString("housetype")%></td>
								<td align="center"><%=rs.getInt("louceng")%></td>
								<td align="center"><%=rs.getInt("housearea")%></td>
								<td align="center"><%=rs.getInt("houseprice")%>元</td>
								<td align="center"><img alt="" src="show_img?owner=<%=rs.getString("owner") %>" style="height: 100px;width: 100px"></td>
								<td align="center"><%=rs.getString("beizhu")%></td>
								<td align="center"><%=rs.getString("telnumber")%></td>
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
	<script>
		var tds = document.getElementsByTagName('td');
		console.log(tds);
		for (var i = 0; i < tds.length; i++) {
			if (tds[i].innerHTML == "" || tds.innerText == "") {
				tds[i].innerHTML = "暂无查询数据";
			}
		}
	</script>
</body>

</html>