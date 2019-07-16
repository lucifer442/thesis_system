<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>评审结果</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
	${msg}
	<div class="container">
		<form action="" method="post">
			<table class="table table-bordered">
				<caption>评审信息</caption>
				<tr>
					<td>等级</td>
					<td>${dataMap.b202}</td>
				</tr>
				<tr>
					<td>评语</td>
					<td>${dataMap.b203}</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>