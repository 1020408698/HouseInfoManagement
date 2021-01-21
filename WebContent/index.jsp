<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
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
<script src="js/responsiveslides.min.js"></script>
<script>
	$(function() {
		$("#slider").responsiveSlides({
			auto : true,
			nav : true,
			speed : 500,
			namespace : "callbacks",
			pager : true,
		});
	});
</script>
<link rel="stylesheet" href="fonts/css/font-awesome.min.css">
<script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#horizontalTab').easyResponsiveTabs({
			type : 'default',
			width : 'auto',
			fit : true
		});
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
					<li><a class="active scroll" href="index.jsp"><iclass="fafa-home">
							</i>首页</a></li>
					<li><a href="about.jsp"><i class="fa fa-star"> </i>关于</a></li>
					<li><a href="services.jsp"><i class="fa fa-picture-o"></i>展示</a></li>
					<li><a href="login.jsp"><i class="fa fa-user"> </i>用户系统</a></li>
					<li><a href="contact.jsp"><i class="fa fa-envelope-o"></i>联系我们</a></li>
					<div class="clearfix"></div>
				</ul>
			</div>
			<!-- script for menu -->
			<script>
				$("span.menu").click(function() {
					$(".top-menu").slideToggle("slow", function() {
						// Animation complete.
					});
				});
			</script>
			<!-- script for menu -->
		</div>
		<div class="clearfix"></div>
	</div>
	<div class="slider">
		<div class="callbacks_container">
			<ul class="rslides" id="slider">
				<li><img src="images/banner.jpg" class="img-responsive" alt="" />
					<div class="banner_desc">
						<div class="container">
							<h1>这里有最好的房源</h1>
							<h2>您可以尽心的浏览或者挑选您想要的房型</h2>
						</div>
					</div></li>
				<li><img src="images/banner1.jpg" class="img-responsive" alt="" />
					<div class="banner_desc">
						<div class="container">
							<h1>这里有最好的房源</h1>
							<h2>您可以尽心的浏览或者挑选您想要房型</h2>
						</div>
					</div></li>
				<li><img src="images/banner2.jpg" class="img-responsive" alt="" />
					<div class="banner_desc">
						<div class="container">
							<h1>这里有最好的房源</h1>
							<h2>您可以尽心的浏览或者挑选您想要房型</h2>
						</div>
					</div></li>
			</ul>
		</div>
	</div>
	<%
		Class.forName("com.mysql.jdbc.Driver"); ////驱动程序名
		String url = "jdbc:mysql://localhost:3306/house"; //数据库名
		String username = "root"; //数据库用户名
		String password = "root"; //数据库用户密码
		Connection conn = DriverManager.getConnection(url, username, password); //连接状态
		Statement stmt = null;
		ResultSet rs = null;
	%>
	<div class="content_top">
		<div class="container">
			<h4 class="m_3">当下最受欢迎的</h4>
			<%
				Statement stmt4 = null;
				ResultSet rs4 = null;
				String sql4 = "select * from hotsale;"; //查询语句
				System.out.println(sql4);
				stmt4 = conn.createStatement();
				rs = stmt4.executeQuery(sql4);
				while(rs.next()){
			%>
			<div class="grid_1">
				<div class="col-md-3 box_1">
					<img src="show_img?owner=<%=rs.getString("owner")%>" class="img-responsive" alt="" style="height: 191px"/>
					<div class="box_2">
						<div class="special-wrap">
							<div class="hot_offer">
								<span class="m_11">热卖商品</span>
							</div>
							<div class="forclosure">
								<span class="m_12">特价</span>
							</div>
						</div>
					</div>
					<div class="box_3">
						<h3>
							<span>房主名字：<%=rs.getString("owner")%></span>
						</h3>
						<div class="boxed_mini_details clearfix">
							<span class="area first"><strong>车库</strong><i
								class="fa fa-plane icon1"></i>2</span> <span class="status"><strong>淋浴室</strong><i
								class="fa fa-retweet icon1"></i>2</span> <span class="bedrooms last"><strong>客房</strong><i
								class="fa fa-table"></i>2</span>
						</div>
					</div>
				</div>
				<%} %>
				<div class="clearfix"></div>
			</div>
			<div class="content_bottom">
				<div class="col-md-2">
					<div class="widget">
						<div class="title">
							<h3>
								<i class="fa fa-meh-o men"> </i> 在出售中：
							</h3>
						</div>
						<ul class="real-widget">
							<li><a href="#">商业房(3)</a></li>
							<li><a href="#">在售房(16)</a>
								<ul>
									<li><a href="#">公寓</a></li>
									<li><a href="#">火热套房</a></li>
									<li><a href="#">农村房</a></li>
								</ul>
						</ul>
						</li>
						</ul>
					</div>
					<div class="widget">
						<div class="title">
							<h3>
								<i class="fa fa-meh-o men"> </i> 在出售中：
							</h3>
						</div>
						<ul class="real-widget">
							<li><a href="#">商业房(3)</a></li>
							<li><a href="#">在售房(16)</a>
								<ul>
									<li><a href="#">公寓</a></li>
									<li><a href="#">火热套房</a></li>
									<li><a href="#">农村房</a></li>
								</ul>
						</ul>
						</li>
						</ul>
					</div>
				</div>
				<div class="col-md-7">
					<div class="sap_tabs">
						<div id="horizontalTab"
							style="display: block; width: 100%; margin: 0px;">
							<div class="tab_grid">
								<ul class="resp-tabs-list">
									<li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>公寓房</span></li>
									<li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span>城镇房</span></li>
									<li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><span>热售房</span></li>
									<div class="clearfix"></div>
								</ul>
							</div>
							<!-- 公寓房： -->
							<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
								<%
									String sql = "select * from apartment;"; //查询语句
									System.out.println(sql);
									stmt = conn.createStatement();
									rs = stmt.executeQuery(sql);
								%>
								<ul class="tab_img tab_1">
									<%
										while (rs.next()) {
									%>
									<li>
										<div class="client_box1">
											<img src="show_img?owner=<%=rs.getString("owner")%>"
												class="img-responsive" alt="" />
											<div class="box_type"><%=rs.getString("houseprice")%>&nbsp;元
											</div>
											<h3 class="m_1" style="color: #000">
												<span>房主名字：<%=rs.getString("owner")%></span>
											</h3>
											<div class="boxed_mini_details clearfix">
												<span class="area first"><strong>车库</strong><i
													class="fa fa-plane icon1"></i>2</span> <span class="status"><strong>浴室</strong><i
													class="fa fa-retweet icon1"> </i>2</span> <span
													class="bedrooms last"><strong>卧室</strong><i
													class="fa fa-building-o icon1"></i>2</span>
											</div>
										</div>
									</li>
									<%
										}
									%>
								</ul>
							</div>
							<!-- 城镇房 -->
							<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1">
								<%
									Statement stmt2 = null;
									ResultSet rs2 = null;
									String sql2 = "select * from city;"; //查询语句
									System.out.println(sql2);
									stmt2 = conn.createStatement();
									rs = stmt2.executeQuery(sql2);
								%>
								<ul class="tab_img">
									<%
										while (rs.next()) {
									%>
									<li>
										<div class="client_box1">
											<img src="show_img?owner=<%=rs.getString("owner")%>"
												class="img-responsive" alt="" />
											<div class="box_type"><%=rs.getString("houseprice")%>&nbsp;元
											</div>
											<h3 class="m_1" style="color: #000">
												<span>房主名字：<%=rs.getString("owner")%></span>
											</h3>
											<div class="boxed_mini_details clearfix">
												<span class="area first"><strong>车库</strong><i
													class="fa fa-plane icon1"></i>2</span> <span class="status"><strong>浴室</strong><i
													class="fa fa-retweet icon1"> </i>2</span> <span
													class="bedrooms last"><strong>卧室</strong><i
													class="fa fa-building-o icon1"></i>2</span>
											</div>
										</div>
									</li>
									<%
										}
									%>
								</ul>
							</div>
							<!-- 热售房 -->
							<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-2">
								<%
									Statement stmt3 = null;
									ResultSet rs3 = null;
									String sql3 = "select * from hotsale;"; //查询语句
									System.out.println(sql3);
									stmt3 = conn.createStatement();
									rs = stmt2.executeQuery(sql3);
								%>
								<ul class="tab_img">
									<%
										while (rs.next()) {
									%>
									<li>
										<div class="client_box1">
											<img src="show_img?owner=<%=rs.getString("owner")%>"
												class="img-responsive" alt="" />
											<div class="box_type"><%=rs.getString("houseprice")%>&nbsp;元
											</div>
											<h3 class="m_1" style="color: #000">
												<span>房主名字：<%=rs.getString("owner")%></span>
											</h3>
											<div class="boxed_mini_details clearfix">
												<span class="area first"><strong>车库</strong><i
													class="fa fa-plane icon1"></i>2</span> <span class="status"><strong>浴室</strong><i
													class="fa fa-retweet icon1"> </i>2</span> <span
													class="bedrooms last"><strong>卧室</strong><i
													class="fa fa-building-o icon1"></i>2</span>
											</div>
										</div>
									</li>
									<%
										}
									%>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3"></div>
				<div class="clearfix"></div>
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