<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="menu.jsp"%>%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
    ${msg }
	<form action="<%=path%>/TimeServlet" method="post">
		<table border="1" align="center" width="45%">
			<caption>���ʱ�䰲��</caption>
			<tr>
				<td>��翪ʼʱ��</td>
				<td><e:date name="btime" required="true" /></td>
			</tr>
			<tr>
				<td>������ʱ��</td>
				<td><e:date name="etime" required="true" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" name="next" value="�ύ���ʱ��"></td>
			</tr>
		</table>
	</form>
</body>
</html>