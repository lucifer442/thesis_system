<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>�����Ϣ�鿴</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
	${msg}
	<div class="container">
		<form action="" method="post">
			<table class="table table-bordered">
				<caption>�����Ϣ</caption>
				<tr>
					<td>���ʱ��</td>
					<td>${dataMap.b402}</td>
				</tr>
				<tr>
					<td>����</td>
					<td>${dataMap.b408}</td>
				</tr>
				<tr>
					<td>����</td>
					<td>${dataMap.b409}</td>
				</tr>
				<tr>
					<td>���´��</td>
					<td>${dataMap.b410}</td>
				</tr>
				<tr>
					<td>��ע</td>
					<td>${dataMap.b403}</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>