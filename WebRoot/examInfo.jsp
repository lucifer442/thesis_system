<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>������</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
	${msg}
	<div class="container">
		<form action="" method="post">
			<table class="table table-bordered">
				<caption>������Ϣ</caption>
				<tr>
					<td>�ȼ�</td>
					<td>${dataMap.b202}</td>
				</tr>
				<tr>
					<td>����</td>
					<td>${dataMap.b203}</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>