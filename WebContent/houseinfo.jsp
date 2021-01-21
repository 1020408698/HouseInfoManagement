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
						class="crumb-step">&gt;</span> <a href="houseinfo.jsp"><span
						class="crumb-name">房屋信息发布</span></a>
				</div>
			</div>
			<div class="result-wrap">
				<form action="Upload" method="post" enctype="multipart/form-data">
					<p>添加房屋信息：</p>
					<table border="1px" bordercolor="#000"
						style="height: 88%; width: 100%;" cellpadding="0" cellspacing="0">
						<tbody>
							<tr>
								<th>房屋编号:</th>
								<th><input type="text" name="housenumber"
									style="width: 100%; height: 100%;" /></th>
							</tr>
							<tr>
								<th>房屋名称:</th>
								<th><input type="text" name="housename"
									style="width: 100%; height: 100%;" /></th>
							</tr>
							<tr>
								<th>户主名字:</th>
								<th><input type="text" name="owner"
									style="width: 100%; height: 100%;" /></th>
							</tr>
							<tr>
								<th>房屋类型：</th>
								<th><input type="text" name="housetype"
									style="width: 100%; height: 100%;" /></th>
							</tr>
							<tr>
								<th>所在楼层：</th>
								<th><input type="text" name="suozailouceng"
									style="width: 100%; height: 100%;" /></th>
							</tr>
							<tr>
								<th>房屋面积：</th>
								<td><input type="text" name="housearea"
									style="width: 34%; height: 80%;border:1px solid" /></td>
							</tr>
							<tr>
								<th>交易价格：</th>
								<td><input type="text" name="houseprice"
									style="width: 34%; height: 80%;border:1px solid" /></td>
							</tr>
							<tr>
								<th>房屋照片：</th>
								<td><input id="file1" type="file" name="Filename"></td>
							</tr>
							<tr>
								<th>备注说明：</th>
								<th><textarea name="content" rows="10" cols="30"
										style="height: 100%; width: 100%;"></textarea></th>
							</tr>
							<tr>
								<th>联系电话：</th>
								<td><input type="text" name="telnumber"
									style="width: 34%; height: 80%;border:1px solid" /></td>
							</tr>
							<tr>
								<th colspan="2" align="center">
								<input type="submit" value="提交" /> <input type="reset" value="重置" /></th>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>

</html>