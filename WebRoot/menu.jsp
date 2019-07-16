<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("basePath", basePath);
%>
<!DOCTYPE html>
<html>
<head>
<title>硕士学位论文评审答辩系统</title>
</head>
<body class="menu">
	<h1 align="center">硕士学位论文评审答辩系统</h1>

	<div>
		<ul>
			<li>
				<p>欢迎使用,${cname }</p>
			</li>
			<c:forEach items="${funclist }" var="func">
				<li>${func }</li>
			</c:forEach>
			<li><a href="out">退出</a></li>
		</ul>
	</div>
</body>
</html>
