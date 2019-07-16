<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>上传论文</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
	${msg} ${message}
	<div class="container">
	<a href="<%=path%>/student_Thesis.html">返回</a>
		<form id="myform"
			action="<%=path%>/${empty dataMap.b101?'Thesis_Upload':'Thesis_Resubmit'}.com"
			enctype="multipart/form-data" method="post">
				<table class="table table-bordered">
					<caption>论文上传</caption>
					<tr>
						<td>标题</td>
						<td><e:textarea rows="5" cols="45" id="b102" name="b102"
								required="true" autofocus="true" defval="${dataMap.b102}" /></td>
					</tr>

					<tr>
						<td>摘要</td>
						<td><e:textarea rows="5" cols="45" name="b103"
								required="true" defval="${dataMap.b103}" /></td>
					</tr>

					<tr>
						<td>关键字</td>
						<td><e:textarea rows="5" cols="45" name="b104"
								required="true" defval="${dataMap.b104}" /></td>
					</tr>

					<tr>
						<td>领域</td>
						<td><e:text id="b105" name="b105" required="true"
								defval="${dataMap.b105}" /></td>
					</tr>

					<tr>
						<td>论文</td>
						<td><input type="file" id="b106" name="b106"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<!--<button type="submit" name="b101" value="${U.b101}">重新提交</button>-->
							<button class="btn btn-lg btn-primary btn-block"
								style="width: 110px" type="submit">${empty dataMap.b101?'新的提交':'重新提交'}</button>
						</td>
					</tr>
				</table>
				<input type="hidden" name="b101" value="${dataMap.b101}">
				<input type="hidden" name="uid" value="${dataMap.uid}">
		</form>
	</div>
</body>
</html>