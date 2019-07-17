<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>���Ĳ�ѯ</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script>
window.onload = function() {	
	var dataList = "${dataList}";
	var msg = "${msg}";
	if(dataList==""&&msg=="")
	{
		var vform = document.getElementById("myform");
		vform.action="<%=path%>/teacher_Thesis.html";
			vform.submit();
		}
	}
</script>
</head>
<body>
	<br>
	<br>
	<div class="container">
		<form action="<%=path%>/teacher_Search.html" method="post">
			<table class="table table-bordered">
				<tr>
					<th>����</th>
					<td><e:text name="b102" defval="${U.b102}" /></td>
				</tr>
				<tr>
					<th>�����</th>
					<td><e:radio name="b107" value="ȫ��:'',δ���:0,ͨ��:1,δͨ��:2"
							defval="${U.aab107}" /></td>
				</tr>
				<tr>
					<th>������</th>
					<td><e:radio name="b108" value="ȫ��:'',δ����:0,ͨ��:1,��ͨ��:2"
							defval="${U.aab108}" /></td>
				</tr>
				<tr>
					<th>�����</th>
					<td><e:radio name="b109" value="ȫ��:'',δ���:0,ͨ��:1,��ͨ��:2"
							defval="${U.aab109}" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button class="btn btn-lg btn-primary btn-block"
							style="width: 110px" type="submit" name="uid" value="2">ɸѡ</button>
					</td>
				</tr>
			</table>
		</form>
		${msg}
		<form id="myform" action="" method="post">
			<table class="table table-striped">
				<thead>
					<tr>
					    <th>ѧ������</th>
						<th>����</th>
						<th>��ʦ�����</th>
						<th>������</th>
						<th>�����</th>
						<th>����</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="U" items="${dataList}">
						<tr>
						    <td>${U.name}</td>
							<td><a href="<%=path%>/thesis_Details_Te.html?b101=${U.b101}">${U.b102}</a></td>
							<td>${U.b107}</td>
							<td><c:choose>
									<c:when test="${U.b108=='δ����'}">
										<p>${U.b108}</p>
									</c:when>
									<c:otherwise>
										<a href="<%=path%>/view_Review.html?b101=${U.b101}">${U.b108}</a>
									</c:otherwise>
								</c:choose></td>
							<td><c:choose>
									<c:when test="${U.b109=='δ���'}">
										<p>${U.b109}</p>
									</c:when>
									<c:otherwise>
										<a href="<%=path%>/view_Reply.html?b101=${U.b101}">${U.b109}</a>
									</c:otherwise>
								</c:choose></td>
							<td><a href="<%=path%>/view_Thesis.html?b101=${U.b101}" target="_blank">�����Ķ�</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>