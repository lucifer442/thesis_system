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
<title>˶ʿѧλ����������ϵͳ</title>
</head>
<body class="menu">
	<h1 align="center">˶ʿѧλ����������ϵͳ</h1>

	<div>
		<ul>
			<li>
				<p>��ӭʹ��,${cname }</p>
			</li>
			<c:forEach items="${funclist }" var="func">
				<li>${func }</li>
			</c:forEach>
			<li><a href="out">�˳�</a></li>
		</ul>
	</div>
</body>
</html>
