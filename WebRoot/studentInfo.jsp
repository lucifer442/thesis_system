<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>������Ϣ</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script>
window.onload = function() 
{
	var uid = "${dataMap.uid}";
	var msg = "${msg}";
	if(uid==""&&msg=="")
	{
		var vform = document.getElementById("myform");
		vform.action="<%=path%>/student_Info.html";
		vform.submit();
	}
}
</script>
</head>
<body>
	${msg}
	<div class="container">
		<form id="myform" action="<%=path%>/password_Change.html" method="post">
			<table class="table table-bordered">
				<caption>������Ϣ</caption>
				<tr>
					<td>����</td>
					<td>${dataMap.name}</td>
				</tr>
				<tr>
					<td>ѧ��</td>
					<td>${dataMap.a101}</td>
				</tr>
				<tr>
					<td>���֤����</td>
					<td>${dataMap.a102}</td>
				</tr>
				<tr>
					<td>ѧ�����</td>
					<td>${dataMap.a103}</td>
				</tr>
				<tr>
					<td>ѧԺ</td>
					<td>${dataMap.a104}</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><button
							class="btn btn-lg btn-primary btn-block" style="width: 110px"
							type="submit">�޸�����</button></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>