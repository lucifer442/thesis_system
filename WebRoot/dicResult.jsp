<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="menu.jsp"%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
 <form method="post" action="<%=path%>/DicExcel.htms" encType="multipart/form-data">
		<input type="file" name="uploadFile" required accept=".xls"/> 
		<input class="filesubmit" type="submit"  value="Excelµ¼Èë" />
 </form>
</body>
</html>