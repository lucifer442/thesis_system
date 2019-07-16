<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%	
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	request.setAttribute("basePath", basePath);
%>
<html>
<head>
<title>专家注册</title>
</head>
<body>
<e:message/>
	<form action="<%=path %>/chooseRole" method="post">
		<table align="center">
			<tr>
				<td>
					欢迎您使用本系统，${name }
				</td>
			</tr>
			<tr>
				<td>
					请选择本次硕士论文评审答辩周期中您想担任的工作
				</td>
			</tr>
			<tr>
				<td>
					您可以同时选择两项，请至少选择一项。
				</td>
			</tr>
			<tr>
				<td>
					<e:groupbox name="roles" value="评审专家:4,答辩专家:5"/>
				</td>
			</tr>
			<tr>
				<td>
					<e:submit name="next" value="确定"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>