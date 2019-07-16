<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>论文详情</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
	${msg}
	<div class="container">
		<form id="myform" action="" method="post">
			<table class="table table-bordered">
				<caption>论文详情</caption>
				<thead></thead>
				<tbody>
					<tr>
						<th>标题</th>
						<td colspan="2">${dataMap.b102}</td>
					</tr>
					<tr>
						<th>摘要</th>
						<td colspan="2">${dataMap.b103}</td>
					</tr>
					<tr>
						<th>关键字</th>
						<td colspan="2">${dataMap.b104}</td>
					</tr>
					<tr>
						<th>领域</th>
						<td colspan="2">${dataMap.b105}</td>
					</tr>
					<tr>
						<th>检查结果</th>
						<td colspan="2">${dataMap.b107}</td>
					</tr>
					<tr>
						<th>答辩结果</th>
						<td><a href="<%=path%>/view_Reply.html?b101=${dataMap.b101}">${dataMap.b109}</a></td>
					</tr>
					<tr>
						<th>论文</th>
						<td colspan="2"><a
							href="<%=path%>/view_Thesis.html?b101=${dataMap.b101}"
							target="_blank">在线阅读</a></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>