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
							<li><a href="system.jsp"><i class="icon-font">&#xe017;</i>系统设置</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
		<div class="main-wrap">
			<div class="crumb-wrap">
				<div class="crumb-list">
					<i class="icon-font">&#xe06b;</i><span>欢迎使用后台房产信息管理系统</span>
				</div>
			</div>
			<div class="result-wrap">
				<div class="result-title">
					<h1>
						<i class="icon-font">&#xe002;</i>便捷操作
					</h1>
				</div>
				<div class="result-content">
					<div class="short-wrap">
						<a href="adminManagement.jsp"><i class="icon-font">&#xe00f;</i>用户信息管理</a>
						<a href="allrecord.jsp"><i class="icon-font">&#xe005;</i>房屋信息管理</a>
						<a href="message.jsp"><i class="icon-font">&#xe005;</i>反馈信息管理</a>
					</div>
				</div>
			</div>
			<div class="result-wrap">
				<div class="result-title">
					<h1>本系统基本信息</h1>
				</div>
				<div class="result-content">
					<ul class="sys-info-list">
						<li><label class="res-lab">操作系统</label><span class="res-info">Windows</span></li>
						<li><label class="res-lab">运行环境</label><span class="res-info">Tomcat:Localhost://8080</span></li>
						<li><label class="res-lab">当前版本</label><span class="res-info">1.0.0</span></li>
						<li><label class="res-lab">北京时间</label><span class="res-info"
							id="dateTime"></span></li>
						<li><label class="res-lab">公司地址</label><span class="res-info">湖南省湘西州吉首大学17级计科一班</span></li>
					</ul>
				</div>
			</div>
			<div class="result-wrap">
				<div class="result-title">
					<h1>使用帮助</h1>
				</div>
				<div class="result-content">
					<ul class="sys-info-list">
						<li><label class="res-lab">更多帮助请评论区留言</label>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<script>
		Date.prototype.format = function(fmt) {
			var o = {
				"y+" : this.getFullYear, //年
				"M+" : this.getMonth() + 1, //月份
				"d+" : this.getDate(), //日
				"h+" : this.getHours(), //小时
				"m+" : this.getMinutes(), //分
				"s+" : this.getSeconds()
			//秒
			};
			if (/(y+)/.test(fmt))
				fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "")
						.substr(4 - RegExp.$1.length));
			for ( var k in o)
				if (new RegExp("(" + k + ")").test(fmt))
					fmt = fmt.replace(RegExp.$1,
							(RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k])
									.substr(("" + o[k]).length)));
			return fmt;
		}
		setInterval(
				"document.getElementById('dateTime').innerHTML = (new Date()).format('yyyy-MM-dd hh:mm:ss');",
				1000);
	</script>
</body>
</html>