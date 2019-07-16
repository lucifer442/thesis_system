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
			<input type="submit" name="next" formaction="<%=path%>/stuDistribute.html" value="学生分配">
			<input type="submit" name="next" formaction="" value="分配结果导出">
		</form>
	</div>
</body>
</html>