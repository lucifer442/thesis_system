<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>бшнд</title>
</head>
<body>
	${msg}
	<script src="js/pdfobject.min.js"></script>
	<script>
		PDFObject.embed("<%=path%>/upload/${dataMap.b106}");
	</script>
</body>
</html>