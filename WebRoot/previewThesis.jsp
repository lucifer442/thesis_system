<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>���Ĳ�ѯ</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
<script>
function onDetails(b101)
{
	 var vform = document.getElementById("myform");
	 vform.action="<%=path%>/thesis_Details_Pr.html?b101="+b101;
	 vform.submit();
}
function onExam(b101)
{	 
	 var vform = document.getElementById("myform");
	 vform.action="<%=path%>/view_Reply.html?b101="+b101;
	 vform.submit();
}
function onSelect()
{
	var selectID = document.getElementById("myselect").value;
	localStorage.setItem('selectID',selectID);
	
	var vform = document.getElementById("myform");
	vform.action="<%=path%>/preview_Thesis.html";
		vform.submit();
	}
	window.onload = function() {
		var select = document.getElementById("myselect");
		var selectID = localStorage.getItem('selectID');
		for (var i = 0; i < select.options.length; i++) {
			if (select.options[i].value == selectID) {
				select.options[i].selected = true;
				break;
			}
		}
	}
</script>
</head>
<body>
	${msg}
	<div class="container">
		<form id="myform" action="" method="post">
			<select id="myselect" name="b109" onchange="onSelect()">
				<option value="">ȫ��</option>
				<option value="0">δ���</option>
				<option value="1">ͨ��</option>
				<option value="2">δͨ��</option>
			</select>
			<table class="table table-striped">
				<caption>ѧ������</caption>
				<thead>
					<tr>
						<th>����</th>
						<th>�����</th>
						<th>�����</th>
						<th>����</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="U" items="${dataList}">
						<tr>
							<td><a href="#" onclick="onDetails('${U.b101}')">${U.b102}</a></td>
							<td>${U.b107}</td>
                            <td>
							<c:choose>
								<c:when test="${U.b109=='δ���'}">
										<p>${U.b109}</p>
									</c:when> 
									<c:otherwise>
										<a href="#" onclick="onExam('${U.b101}')">${U.b109}</a>
									</c:otherwise>
							</c:choose>
							</td>
							<td><a href="<%=path%>/view_Thesis.html?b101=${U.b101}"
							target="_blank">�����Ķ�</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!--<input type="hidden" name="uid" value="${dataMap.uid}">-->
		</form>
	</div>
</body>
</html>