<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%	
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	request.setAttribute("basePath", basePath);
%>
<html>
<head>
<title>登录系统</title>
</head>
<body>
	<h1 align="center">硕士学位论文评审答辩系统</h1>
	<e:message/>
	<form action="<%=path %>/login" align="center" method="post">
		<table align="center">
			<tr>
				<td>
					用户名
				</td>
				<td>
					<e:text name="username" onblur="if(this.value.replace(/^ +| +$/g,'')=='')alert('用户名不能为空!')"/>
				</td>
			</tr>
			<tr>
				<td>
					密码
				</td>
				<td>
					<input type="password" name="password" onblur="if(this.value.replace(/^ +| +$/g,'')=='')alert('密码不能为空!')">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" name="next" onclick="isUNameExist()">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>