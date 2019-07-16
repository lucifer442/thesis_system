<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="menu.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>学生主页</title>
<link href="css/dashboard.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	${msg}
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">${dataMap.name}</a>
			</div>
		</div>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li><a href="<%=path%>/student_Info.html">个人信息</a></li>
					<li><a href="<%=path%>/expert_Info.html">专家个人信息</a></li>
				</ul>
				<ul class="nav nav-sidebar">
					<li><a href="<%=path%>/student_Thesis.html">学位论文管理</a></li>
				</ul>
				<ul class="nav nav-sidebar">
					<li><a href="<%=path%>/teacher_Thesis.html">老师论文查询</a></li>
					<li><a href="<%=path%>/exam_Thesis.html">评审专家论文查询</a></li>
					<li><a href="<%=path%>/preview_Thesis.html">答辩专家论文查询</a></li>
					<li><a href="<%=path%>/sec_Thesis.html">秘书论文查询</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>