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
		vform.action="<%=path%>/expert_Info.html";
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
					<td>������ѧ</td>
					<td>${dataMap.a601}</td>
				</tr>
				<tr>
					<td>ר�����</td>
					<td>${dataMap.a602}</td>
				</tr>
				<tr>
					<td>�о�����</td>
					<td>${dataMap.a603}</td>
				</tr>
				<tr>
					<td>ְ��</td>
					<td>${dataMap.a604}</td>
				</tr>
				<tr>
					<td>���֤����</td>
					<td>${dataMap.a605}</td>
				</tr>
				<tr>
					<td>�����˺�</td>
					<td>${dataMap.a606}</td>
				</tr>
				<tr>
					<td>���忪������</td>
					<td>${dataMap.a607}</td>
				</tr>
				<tr>
					<td>�ֻ�����</td>
					<td>${dataMap.a608}</td>
				</tr>
				<tr>
					<td>����</td>
					<td>${dataMap.a609}</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button class="btn btn-lg btn-primary btn-block"
							style="width: 110px" type="submit" name="uid"
							value="${dataMap.uid}">�޸�����</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>