<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%	
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	request.setAttribute("basePath", basePath);
%>
<!DOCTYPE html>
<html>
<head>
<title>账户激活</title>
</head>
<body>
<e:message/>
	<form action="<%=path%>/activate" method="post">
		<table align=center>
			<tr>
				<td>
					欢迎您激活本系统账号。
				</td>
			</tr>
			<tr>
				<td>
					您的用户名和初始密码为${param.flag }
				</td>
			</tr>
			<tr>
				<td>
					请点击按钮激活账号
				</td>
			</tr>
			<tr>
				<td>
					<e:hidden name="flag" value="${param.flag }"/>
					<e:submit name="next" value="激活"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>