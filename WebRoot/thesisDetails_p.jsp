<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>��������</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
	${msg}
	<div class="container">
		<form id="myform" action="" method="post">
			<table class="table table-bordered">
				<caption>��������</caption>
				<thead></thead>
				<tbody>
					<tr>
						<th>����</th>
						<td colspan="2">${dataMap.b102}</td>
					</tr>
					<tr>
						<th>ժҪ</th>
						<td colspan="2">${dataMap.b103}</td>
					</tr>
					<tr>
						<th>�ؼ���</th>
						<td colspan="2">${dataMap.b104}</td>
					</tr>
					<tr>
						<th>����</th>
						<td colspan="2">${dataMap.b105}</td>
					</tr>
					<tr>
						<th>�����</th>
						<td colspan="2">${dataMap.b107}</td>
					</tr>
					<tr>
						<th>�����</th>
						<td><a href="<%=path%>/view_Reply.html?b101=${dataMap.b101}">${dataMap.b109}</a></td>
					</tr>
					<tr>
						<th>����</th>
						<td colspan="2"><a
							href="<%=path%>/view_Thesis.html?b101=${dataMap.b101}"
							target="_blank">�����Ķ�</a></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>