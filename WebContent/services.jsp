<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>展示页面</title>
<script type="application/x-javascript">
	
	addEventListener("load", function() {
		setTimeout(hideURLbar, 0);
	}, false);

	function hideURLbar() {
		window.scrollTo(0, 1);
	}

</script>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<script src="js/jquery-1.11.1.min.js"></script>
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href='http://fonts.useso.com/css?family=Grand+Hotel:400'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Roboto'
	rel='stylesheet:100,300,400,500,600,700,800,900' type='text/css'>
<link rel="stylesheet" href="fonts/css/font-awesome.min.css">
<script type="text/javascript" src="js/jquery.fancybox.js"></script>
<link rel="stylesheet" type="text/css" href="css/jquery.fancybox.css"
	media="screen" />
<script type="text/javascript">
	$(document).ready(function() {
		$('.fancybox').fancybox();
	});
</script>
</head>
<body>
	<div class="header">
		<div class="col-xs-4"></div>
		<div class="col-xs-8 header_right">
			<span class="menu"></span>
			<div class="top-menu">
				<ul>
					<li><a href="index.jsp"><i class="fa fa-home"> </i>首页</a></li>
					<li><a href="about.jsp"><i class="fa fa-star"> </i>关于</a></li>
					<li><a class="active scroll" href="services.jsp"><iclass="fafa-picture-o">
							</i>展示</a></li>
					<li><a href="login.jsp"><i class="fa fa-user"> </i>用户系统</a></li>
					<li><a href="contact.jsp"><i class="fa fa-envelope-o"></i>联系我们</a></li>
					<div class="clearfix"></div>
				</ul>
			</div>
			<!-- script for menu -->
			<script>
				$("span.menu").click(function() {
					$(".top-menu").slideToggle("slow", function() {
					});
				});
			</script>
		</div>
		<div class="clearfix"></div>
	</div>
	<div class="about_top">
		<div class="container">
			<div class="about">
				<div class="service_grid">
					<%
						Class.forName("com.mysql.jdbc.Driver"); ////驱动程序名
						String url = "jdbc:mysql://localhost:3306/house"; //数据库名
						String username = "root"; //数据库用户名
						String password = "root"; //数据库用户密码
						Connection conn = DriverManager.getConnection(url, username, password); //连接状态
						Statement stmt = null;
						ResultSet rs = null;
						Statement stmt1 = null;
						String sql = "select * from allhouseinfo;"; //查询语句
						System.out.println(sql);
						stmt = conn.createStatement();
						rs = stmt.executeQuery(sql);
						while (rs.next()) {
					%>
					<div class="col-md-3 service_box">
							<img src="show_img?owner=<%=rs.getString("owner")%>" class="img-responsive" alt="" style="height: 200px;width:245px"/><span>
						</span>
						<h3>房屋名称：<%=rs.getString("housename")%></h3>
						<p>
							<span>房主名字：<%=rs.getString("owner")%></span>
						</p>
					</div>
					<%} %>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="grid_4">
				<div class="col-md-7 grid_6">
					<h3>
						想要发布<br>你的房子吗？
					</h3>
				</div>
				<div class="col-md-5 grid_5">
					<div class="banner2">
						<a class="btn2" href="login.jsp">点击这里</a>
						<h3>
							专业<br>评估
						</h3>
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="copy">
				<p>Copyright &copy; 2020.吉首大学计科一班版权所有</p>
			</div>
		</div>
	</div>
</body>
</html>