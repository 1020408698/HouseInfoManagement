<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>联系我们</title>
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
					<li><a href="services.jsp"><i class="fa fa-picture-o"></i>展示</a></li>
					<li><a href="login.jsp"><i class="fa fa-user"> </i>用户系统</a></li>
					<li><a class="active scroll" href="contact.jsp"><iclass
								="fafa-envelope-o"> </i>联系我们</a></li>
					<div class="clearfix"></div>
				</ul>
			</div>
			<script>
				$("span.menu").click(function() {
					$(".top-menu").slideToggle("slow", function() {
						// Animation complete.
					});
				});
			</script>
		</div>
		<div class="clearfix"></div>
	</div>
	<div class="about_top">
		<div class="container">
			<div class="about">
				<h1 class="blog_head">意见反馈</h1>
				<div class="contact">
					<div class="col-md-4 contact_left">
						<h3>本系统信息</h3>
						<p>该系统旨在用作房产信息的登记和管理。</p>
					</div>
					<div class="col-md-8 contact_right">
						<h3>联系我们</h3>
						<form action="contactcheck.jsp" method="post">
							<div class="text">
								<div class="text-fild">
									<span>姓名:</span> <input type="text" class="text" value="输入你的名字"
										onFocus="this.value = '';"
										onBlur="if (this.value == '') {this.value = '输入你的名字';}" name="username">
								</div>
								<div class="text-fild">
									<span>联系电话:</span> <input type="text" class="text"
										value="输入你的电话" onFocus="this.value = '';"
										onBlur="if (this.value == '') {this.value = '输入你的电话';}" name="telnumber">
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="msg-fild">
								<span>你的住址:</span> 
								<input type="text" class="text" value="输入你的住址" onFocus="this.value = '';"
									onBlur="if (this.value == '') {this.value = '输入你的住址';}" name="address">
							</div>
							<div class="message-fild">
								<span>反馈内容:</span>
								<textarea name="message"> </textarea>
							</div>
							<label class="btn1 btn-8 btn-8c"><input type="submit" value="发送"></label>
						</form>
					</div>
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