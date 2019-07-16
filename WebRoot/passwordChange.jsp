<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>修改密码</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script type="text/javascript">
	function checkpwd() {
		var p1 = document.getElementById("upassword1").value;
		var p2 = document.getElementById("upassword2").value;
		var p3 = document.getElementById("upassword3").value;
		if (p1 == "") {
			document.getElementById("msg1").innerHTML = "请输入原密码";
			document.getElementById("upassword1").focus();
			return false;
		}

		if (p2 != p3) {
			document.getElementById("msg2").innerHTML = "两次输入密码不一致，请重新输入";
			return false;
		}
	}
</script>
</head>
<body>
	${msg}
	<div class="container">
		<form action="<%=path%>/submit_Password.html" method="post"
			onsubmit="return checkpwd();">
			<table class="table table-bordered">
				<caption>修改密码</caption>
				<tr>
					<td>原密码</td>
					<td><input type="password" id="upassword1" name="upassword1"
						required="required" autofocus="autofocus" />
						<div id="msg1" style="color: red;"></div></td>
				</tr>
				<tr>
					<td>新的密码</td>
					<td><input type="password" id="upassword2" name="upassword2"
						required="required" autofocus="autofocus" /></td>
				</tr>
				<tr>
					<td>确认密码</td>
					<td><input type="password" id="upassword3" name="upassword3"
						required="required" autofocus="autofocus" />
						<div id="msg2" style="color: red;"></div></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><button
							class="btn btn-lg btn-primary btn-block" style="width: 110px"
							type="submit">确认提交</button></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>