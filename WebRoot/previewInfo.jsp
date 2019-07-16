<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>答辩信息查看</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
	${msg}
	<div class="container">
		<form action="" method="post">
			<table class="table table-bordered">
				<caption>答辩信息</caption>
				<tr>
					<td>答辩时间</td>
					<td>${dataMap.b402}</td>
				</tr>
				<tr>
					<td>评语</td>
					<td>${dataMap.b408}</td>
				</tr>
				<tr>
					<td>授予</td>
					<td>${dataMap.b409}</td>
				</tr>
				<tr>
					<td>重新答辩</td>
					<td>${dataMap.b410}</td>
				</tr>
				<tr>
					<td>备注</td>
					<td>${dataMap.b403}</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>