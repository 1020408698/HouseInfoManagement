<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录界面</title>
<link rel="stylesheet" href="css/userstyle1.css" type="text/css" />
<link rel="stylesheet" href="css/login.css">
<style type="text/css">
body {
	background-image: url(img/1.png);
	background-size: 100%;
}
</style>
</head>
<body>
	<div class="container">
		<!-- 右侧登陆界面 -->
		<div class="sideright">
			<div class="index">
				<form action="logincheck.jsp" method="post">
					<p class="headline">用户登陆</p>
					<p class="astyle">用户名：</p>
					<input type="text" placeholder="请输入用户名" name="username">
					<p class="astyle">密码：</p>
					<input type="password" placeholder="请输入密码" name="password" class="password" style="height: 35px;border-radius: 3px;border: 1px solid #c8cccf;color: #6a6f77;outline: 0;margin-left: 45px;width: 240px"> 
					<input type="submit" value="登陆" name="login"> </br> </br>
					<p class="cstyle"><a href="index.jsp" >返回首页</a></p>
					<p class="cstyle">
						没有账号？ <a href="Register.jsp">立即注册</a>
					</p>
				</form>

			</div>
		</div>
	</div>
</body>
</html>