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
			<li>��Ϣ�б� <a href="<%=path%>/message">ˢ����Ϣ</a><br></li>
			<c:forEach items="${messageList }" var="message">
				<li>${message }<br></li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>