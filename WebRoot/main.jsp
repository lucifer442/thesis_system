<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="menu.jsp"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title></title>
</head>
<body>
	<div align="center">
		<ul>
			<li>消息列表 <a href="<%=path%>/message">刷新消息</a><br></li>
			<c:forEach items="${messageList }" var="message">
				<li>${message }<br></li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>