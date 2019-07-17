<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>论文详情</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
	${msg}
	<div class="container">
		<form id="myform" action="<%=path%>/theacher_Modify.html"
			method="post">
			<table class="table table-bordered">
				<caption>论文详情</caption>
				<thead></thead>
				<tbody>
				    <tr>
				        <th>学生姓名</th>
				        <td colspan="2">${dataMap.name}</td>
				    </tr>
					<tr>
						<th>标题</th>
						<td colspan="2">${dataMap.b102}</td>
					</tr>
					<tr>
						<th>摘要</th>
						<td colspan="2">${dataMap.b103}</td>
					</tr>
					<tr>
						<th>关键字</th>
						<td colspan="2">${dataMap.b104}</td>
					</tr>
					<tr>
						<th>领域</th>
						<td colspan="2">${dataMap.b105}</td>
					</tr>
					<tr>
						<th>检查结果</th>
						<td colspan="2">${dataMap.b107}</td>
					</tr>
					<tr>
						<th>评审结果</th>
						<td>
						<c:choose>
							<c:when test="${dataMap.b108=='未评审'}">
								<p>${dataMap.b108}</p>
							</c:when>
							<c:otherwise>
								<a href="<%=path%>/view_Review.html?b101=${dataMap.b101}">${dataMap.b108}</a>
							</c:otherwise>
						</c:choose>
						</td>
					</tr>
					<tr>
						<th>答辩结果</th>
						<td>
						<c:choose>
							<c:when test="${dataMap.b109=='未答辩'}">
								<p>${dataMap.b109}</p>
							</c:when>
							<c:otherwise>
								<a href="<%=path%>/view_Reply.html?b101=${dataMap.b101}">${dataMap.b109}</a>
							</c:otherwise>
						</c:choose>
						</td>
					</tr>
					<tr>
						<th>论文</th>
						<td colspan="2"><a
							href="<%=path%>/view_Thesis.html?b101=${dataMap.b101}"
							target="_blank">在线阅读</a></td>
					</tr>
					<tr>
						<td colspan="3" align="center">
							<button class="btn btn-lg btn-primary btn-block"
								style="width: 110px" type="submit" name="b107" value="1" value=>通过</button>
							<button class="btn btn-lg btn-primary btn-block"
								style="width: 110px" type="submit" name="b107" value="2" value=>不通过</button>
							<input type="hidden" name="b101" value="${dataMap.b101}">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>