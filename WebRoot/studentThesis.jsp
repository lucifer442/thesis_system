<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>学位论文管理</title>
<link href="css/dashboard.css" rel="stylesheet">
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
	${dataMap.name} ${msg}
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li><a href="<%=path%>/student_Upload.html">论文提交</a></li>
					<li><a href="<%=path%>/student_Manage.html">论文查询</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>