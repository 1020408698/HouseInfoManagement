<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<script>
	function submit10() {
		self.location.replace("allrecord.jsp")
	}
</script>
<%
	//变量声明
	int intPageSize; //一页显示的记录数
	int intRowCount; //记录总数
	int intPageCount; //总页数
	int intPage; //待显示页码
	java.lang.String strPage;
	int i;
	//设置一页显示的记录数
	intPageSize = 4;
	//取得待显示页码
	strPage = request.getParameter("page");
	if (strPage == null) {//表明在QueryString中没有page这一个参数，此时显示第一页数据
		intPage = 1;
	} else {//将字符串转换成整型
		intPage = java.lang.Integer.parseInt(strPage);
		if (intPage < 1)
			intPage = 1;
	}
	//装载JDBC驱动程序
	Class.forName("com.mysql.jdbc.Driver"); ////驱动程序名
	String url = "jdbc:mysql://localhost:3306/house"; //数据库名
	String username = "root"; //数据库用户名
	String password = "root"; //数据库用户密码
	Connection conn = DriverManager.getConnection(url, username, password); //连接状态
	Statement stmt = null;
	ResultSet rs = null;
	Statement stmt1 = null;
	String sql = "select * from allhouseinfo;"; //查询语句
	System.out.print(sql);
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	rs.last();
	//获取记录总数
	intRowCount = rs.getRow();//获得当前行号
	//记算总页数
	intPageCount = (intRowCount + intPageSize - 1) / intPageSize;
	//调整待显示的页码
	if (intPage > intPageCount)
		intPage = intPageCount;
%>
<html xmlns:x="urn:schemas-microsoft-com:office:excel">
<script type="text/javascript">
	function exportExcel() {
		window.open('allrecord.jsp?exportToExcel=YES');
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理系统</title>
<link rel="stylesheet" type="text/css" href="css/common.css" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css"
	media="all">
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css"
	media="all">
<style type="text/css">
.daochu {
	position: relative;
	display: block;
	text-align: center;
	top: -718px;
	left: -360px;
}
</style>
</head>

<body>
	<%
		String exportToExcel = request.getParameter("exportToExcel");
		if (exportToExcel != null && exportToExcel.toString().equalsIgnoreCase("YES")) {
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "inline; filename=" + "order.xls");
		}
	%>
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
							<li><a href="system.jsp"><i class="icon-font">&#xe017;</i>系统设置查看</a>
							</li>
						</ul></li>
				</ul>
			</div>
		</div>
		<div class="main-wrap">
			<div class="crumb-wrap">
				<div class="crumb-list">
					<i class="icon-font"></i> <a href="admin.jsp">首页</a> <span
						class="crumb-step">&gt;</span> <a href="allrecord.jsp"><span
						class="crumb-name">房屋信息管理</span></a>
				</div>
			</div>
			<div class="result-wrap">
				<form action="allrecord.jsp" name="myform" id="myform" method="post">
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
								<td align="center">操作</td>
							</tr>
							<%
								if (intPageCount > 0) {
									//将记录指针定位到待显示页的第一条记录上
									rs.absolute((intPage - 1) * intPageSize + 1);
									//显示数据
									i = 0;
									String user_id, user_name;
									while (i < intPageSize && !rs.isAfterLast()) {
							%>
							<tr>
								<td align="center"><%=rs.getString("housenumber")%></td>
								<td align="center"><%=rs.getString("housename")%></td>
								<td align="center"><%=rs.getString("owner")%></td>
								<td align="center"><%=rs.getString("housetype")%></td>
								<td align="center"><%=rs.getInt("louceng")%></td>
								<td align="center"><%=rs.getInt("housearea")%></td>
								<td align="center"><%=rs.getInt("houseprice")%>元</td>
								<td align="center"><img alt=""
									src="../show_img?owner=<%=rs.getString("owner")%>"
									style="height: 100px; width: 100px"></td>
								<td align="center"><%=rs.getString("beizhu")%></td>
								<td align="center"><%=rs.getString("telnumber")%></td>
								<td align="center"><a class="link-del"
									href="../DeleteHouseInfo?owner=<%=rs.getString("owner")%>">删除</a>
									<a class="link-del"
									href="../SetHotSale?owner=<%=rs.getString("owner")%>">设为热售房</a>
								</td>
							</tr>
							<%
								rs.next();
										i++;
									}
								}
							%>
						</table>
					</div>
					第<%=intPage%>页，共<%=intPageCount%>页
					<%
						if (intPage < intPageCount) {
					%><a href="allrecord.jsp?page=<%=intPage + 1%>">下一页 </a>
					<%
						}
					%>
					<%
						if (intPage > 1) {
					%><a href="allrecord.jsp?page=<%=intPage - 1%>"> 上一页</a>
					<%
						}
					%>
					转到第:<input type="text" name="page" size="8"> 页 <span><input
						class=buttonface type='submit' value='GO' name='cndok'></span>
				</form>

			</div>
		</div>
		<!--/main-->
	</div>
	<%
		if (exportToExcel == null) {
	%>
	<a class="daochu" href="javascript:exportExcel();">导出为Excel</a>
	<%
		}
	%>
</body>

</html>