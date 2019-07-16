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
				<caption>个人信息</caption>
				<tr>
					<td>姓名</td>
					<td>${dataMap.name}</td>
				</tr>
				<tr>
					<td>学号</td>
					<td>${dataMap.a101}</td>
				</tr>
				<tr>
					<td>身份证号码</td>
					<td>${dataMap.a102}</td>
				</tr>
				<tr>
					<td>学生类别</td>
					<td>${dataMap.a103}</td>
				</tr>
				<tr>
					<td>学院</td>
					<td>${dataMap.a104}</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><button
							class="btn btn-lg btn-primary btn-block" style="width: 110px"
							type="submit">修改密码</button></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>