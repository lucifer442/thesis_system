<%@page import="java.util.*"%>
<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="menu.jsp"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title></title>
</head>
<body>
	<%
		String index = request.getParameter("index");
		Map<String, List<String>> messageContent = (Map<String, List<String>>) request.getSession().getAttribute("messageContent");
		List<String> content = messageContent.get(index);
		request.setAttribute("content", content);
	%>
	<h2 align="center">${content[0] }</h2>
	<p align="center">${content[1] }</p>
</body>
</html>