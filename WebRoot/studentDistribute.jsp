<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="menu.jsp"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<e:message />
	<div align="center">
		<form method="post">
			<input type="submit" name="next" formaction="<%=path%>/stuDistribute.html" value="ѧ������">
			<input type="submit" name="next" formaction="" value="����������">
		</form>
	</div>
</body>
</html>