<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>关于我们</title>
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
					<li><a class="active scroll" href="about.jsp"><iclass="fa fa-star"> </i>关于</a></li>
					<li><a href="services.jsp"><i class="fa fa-picture-o"></i>展示</a></li>
					<li><a href="login.jsp"><i class="fa fa-user"> </i>用户系统</a></li>
					<li><a href="contact.jsp"><i class="fa fa-envelope-o"></i>联系我们</a></li>
					<div class="clearfix"></div>
				</ul>
			</div>
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
				<div class="col-md-8">
					<h3 class="m_3">我们的学校</h3>
					<div class="section_group">
						<div class="col_1_of_2 span_1_of_2">
							<img src="images/school.jpg" class="img-responsive" alt="" />
						</div>
						<div class="col_1_of_2 span_1_of_2">
							<h4>吉首大学创办于1958年，在湖南省湘西土家族苗族自治州和张家界市两地办学，是湖南省属综合性大学，也是武陵山片区唯一的综合性大学。
								学校是国家民委与湖南省人民政府共建高校，国家“中西部高校基础能力建设工程”高校，《武陵山片区区域发展与扶贫攻坚规划》重点建设高校，
								教育部本科教学工作水平评估优秀学校，湖南省研究生培养过程质量评估优秀学校，推荐优秀应届本科毕业生免试攻读硕士学位研究生普通高校。
								2018年获批为博士学位授权单位，在湖南等省市按一本批次录取招生。</h4>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="col-md-4 about_box">
					<h3 class="m_3">班级</h3>
					<h4>我校计算机科学与技术专业始建于1993年，1998年升格为本科专业，是湖南省内较早招生的计算机类本科专业之一。
						本专业坚持软、硬结合，面向应用，兼顾创新的办学理念，形成了一套特色鲜明、富有成效的办学体系。
						2006年被评为吉首大学重点专业，2012年批准为吉首大学服务武陵山片区区域发展与扶贫攻坚特色专业，
						2017年获批智能计算及其应用硕士点，2019年开始电子信息领域专业硕士招生。</h4>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="about_grid2">
				<h3>我们的成员</h3>
				<div class="col-md-3 about_box2">
					<h3>姓名：章煜</h3>
					<p>班级：2017级计科一班</p>
					<p>学号：2017403732</p>
				</div>
				<div class="col-md-3 about_box2">
					<h3>姓名：娄景林</h3>
					<p>班级：2017级计科一班</p>
					<p>学号：2017403721</p>
				</div>
				<div class="col-md-3 about_box2">
					<h3>姓名：徐思璐</h3>
					<p>班级：2017级计科一班</p>
					<p>学号：2017403741</p>
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