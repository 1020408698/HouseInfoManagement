<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>房产信息管理系统</title>
<link rel="stylesheet" type="text/css" href="css/common.css" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
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
							管理员：（<%=session.getAttribute("username")%>），您好！
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
					<i class="icon-font"></i> <a href="admin.jsp">首页</a><span
						class="crumb-step">&gt;</span> <span class="crumb-name"><a
						href="system.jsp">系统设置</a></span>
				</div>
			</div>
			<div class="result-wrap">
				<form action="#" method="post" id="myform" name="myform">
					<div class="config-items">
						<div class="config-title">
							<h1>
								<i class="icon-font">&#xe00a;</i>网站信息查看
							</h1>
						</div>
						<div class="result-content">
							<table width="100%" class="insert-tab">
								<tbody>
									<tr>
										<th width="15%"></i>域名：</th>
										<td>Localhost://8080/Salary/system.jsp</td>
									</tr>
									<tr>
										<th></i>站点标题：</th>
										<td>后台工资管理系统</td>
									</tr>
									<tr>
										<th></i>关键字：</th>
										<td>前端,后端， CSS, JavaScript, Html5</td>
									</tr>
									<tr>
										<th></i>描述：</th>
										<td>本站所有权归作者本人解释。</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="config-items">
						<div class="config-title">
							<h1>
								<i class="icon-font">&#xe014;</i>该系统作者信息
							</h1>
						</div>
						<div class="result-content">
							<table width="100%" class="insert-tab">
								<tr>
									<th width="15%">网站联系邮箱：</th>
									<td>1020408698@qq.com</td>
								</tr>
								<tr>
									<th>联系电话：</th>
									<td>17369426890</td>
								</tr>
								<tr>
									<th>IP地址：</th>
									<td>127.0.0.1</td>
								</tr>
								<tr>
									<th>地址：</th>
									<td>吉首大学17级计科一班</td>
								</tr>
							</table>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!--/main-->
	</div>
</body>
</html>