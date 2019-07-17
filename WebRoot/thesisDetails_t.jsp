<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>��������</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
	${msg}
	<div class="container">
		<form id="myform" action="<%=path%>/theacher_Modify.html"
			method="post">
			<table class="table table-bordered">
				<caption>��������</caption>
				<thead></thead>
				<tbody>
				    <tr>
				        <th>ѧ������</th>
				        <td colspan="2">${dataMap.name}</td>
				    </tr>
					<tr>
						<th>����</th>
						<td colspan="2">${dataMap.b102}</td>
					</tr>
					<tr>
						<th>ժҪ</th>
						<td colspan="2">${dataMap.b103}</td>
					</tr>
					<tr>
						<th>�ؼ���</th>
						<td colspan="2">${dataMap.b104}</td>
					</tr>
					<tr>
						<th>����</th>
						<td colspan="2">${dataMap.b105}</td>
					</tr>
					<tr>
						<th>�����</th>
						<td colspan="2">${dataMap.b107}</td>
					</tr>
					<tr>
						<th>������</th>
						<td>
						<c:choose>
							<c:when test="${dataMap.b108=='δ����'}">
								<p>${dataMap.b108}</p>
							</c:when>
							<c:otherwise>
								<a href="<%=path%>/view_Review.html?b101=${dataMap.b101}">${dataMap.b108}</a>
							</c:otherwise>
						</c:choose>
						</td>
					</tr>
					<tr>
						<th>�����</th>
						<td>
						<c:choose>
							<c:when test="${dataMap.b109=='δ���'}">
								<p>${dataMap.b109}</p>
							</c:when>
							<c:otherwise>
								<a href="<%=path%>/view_Reply.html?b101=${dataMap.b101}">${dataMap.b109}</a>
							</c:otherwise>
						</c:choose>
						</td>
					</tr>
					<tr>
						<th>����</th>
						<td colspan="2"><a
							href="<%=path%>/view_Thesis.html?b101=${dataMap.b101}"
							target="_blank">�����Ķ�</a></td>
					</tr>
					<tr>
						<td colspan="3" align="center">
							<button class="btn btn-lg btn-primary btn-block"
								style="width: 110px" type="submit" name="b107" value="1" value=>ͨ��</button>
							<button class="btn btn-lg btn-primary btn-block"
								style="width: 110px" type="submit" name="b107" value="2" value=>��ͨ��</button>
							<input type="hidden" name="b101" value="${dataMap.b101}">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>