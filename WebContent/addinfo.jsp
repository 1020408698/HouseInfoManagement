<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加个人信息</title>
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css"
	media="all">
<link href="css/register.css" rel="stylesheet" type="text/css"
	media="all" />
</head>
<body>
	<div class="signupform">
		<h1><%=session.getAttribute("username")%>用户信息添加表
		</h1>
		<div class="container" style="width: 43%;">
			<div class="w3_info">
				<h2>填写信息</h2>
				<form action="addcheck.jsp" method="post">
					<div class="input-group">
						<span><i class="fa fa-user" aria-hidden="true"></i></span> <input
							type="text" placeholder="客户编号" required=""
							style="font-family: none" name="usernumber">
					</div>
					<div class="input-group">
						<span><i class="fa fa-lock" aria-hidden="true"></i></span> <input
							type="text" placeholder="姓名" required=""
							style="font-family: none" name="username">
					</div>
					<div class="input-group">
						<span><i class="fa fa-lock" aria-hidden="true"></i></span> <input
							type="text" placeholder="年龄" required=""
							style="font-family: none" name="age">
					</div>
					<div class="input-group">
						<span><i class="fa fa-lock" aria-hidden="true"></i></span> <input
							type="text" placeholder="出生日期" required=""
							style="font-family: none" name="birthday">
					</div>
					<div class="input-group">
						<span><i class="fa fa-lock" aria-hidden="true"></i></span> <input
							type="text" placeholder="手机号" required=""
							style="font-family: none" name="phonenumber">
					</div>
					<div class="input-group">
						<span><i class="fa fa-lock" aria-hidden="true"></i></span> <input
							type="text" placeholder="邮箱" required=""
							style="font-family: none" name="email">
					</div>
					<button class="btn btn-danger btn-block" type="submit">提交</button>
					<p>
						<a href="personinfo.jsp">返回</a>
					</p>
				</form>
			</div>
			<div class="clear"></div>
		</div>

	</div>
	<div class="footer">
		<p>Copyright &copy; 2020.吉首大学计科一班章煜版权所有</p>
	</div>
	</div>
</body>
</html>