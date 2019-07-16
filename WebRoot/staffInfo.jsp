<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>个人信息</title>
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
				<caption>个人信息</caption>
				<tr>
					<td>姓名</td>
					<td>${dataMap.name}</td>
				</tr>
				<tr>
					<td>所属大学</td>
					<td>${dataMap.a601}</td>
				</tr>
				<tr>
					<td>专家类别</td>
					<td>${dataMap.a602}</td>
				</tr>
				<tr>
					<td>研究领域</td>
					<td>${dataMap.a603}</td>
				</tr>
				<tr>
					<td>职称</td>
					<td>${dataMap.a604}</td>
				</tr>
				<tr>
					<td>身份证号码</td>
					<td>${dataMap.a605}</td>
				</tr>
				<tr>
					<td>银行账号</td>
					<td>${dataMap.a606}</td>
				</tr>
				<tr>
					<td>具体开具银行</td>
					<td>${dataMap.a607}</td>
				</tr>
				<tr>
					<td>手机号码</td>
					<td>${dataMap.a608}</td>
				</tr>
				<tr>
					<td>邮箱</td>
					<td>${dataMap.a609}</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button class="btn btn-lg btn-primary btn-block"
							style="width: 110px" type="submit" name="uid"
							value="${dataMap.uid}">修改密码</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>