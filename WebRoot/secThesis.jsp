<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>论文查询</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script type="text/javascript">
window.onload = function() {	
	var dataList = "${dataList}";
	var msg = "${msg}";
	if(dataList==""&&msg=="")
	{
		var vform = document.getElementById("myform");
		vform.action="<%=path%>/sec_Thesis.html";
			vform.submit();
		}
	}
</script>
</head>
<body>
	<br>
	<br> ${msg}
	<div class="container">
		<form action="<%=path%>/sec_Search.html" method="post">
			<table class="table table-bordered">
				<tr>
					<th>标题</th>
					<td><e:text name="b102" defval="${U.b102}" /></td>
				</tr>
				<tr>
					<th>检查结果</th>
					<td><e:radio name="b107" value="全部:'',未检查:0,通过:1,未通过:2"
							defval="${U.aab107}" /></td>
				</tr>
				<tr>
					<th>评审结果</th>
					<td><e:radio name="b108" value="全部:'',未评审:0,通过:1,不通过:2"
							defval="${U.aab108}" /></td>
				</tr>
				<tr>
					<th>答辩结果</th>
					<td><e:radio name="b109" value="全部:'',未答辩:0,通过:1,不通过:2"
							defval="${U.aab109}" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button class="btn btn-lg btn-primary btn-block"
							style="width: 110px" type="submit">筛选</button>
						<button class="btn btn-lg btn-primary btn-block"
							style="width: 110px" type="submit"
							formaction="<%=path%>/staB01.html">论文结果统计</button>
						<button class="btn btn-lg btn-primary btn-block"
							style="width: 110px" type="submit"
							formaction="<%=path%>/staB02.html">评审等级统计</button>
					</td>
				</tr>
			</table>
		</form>
		<form id="myform" action="" method="post">
			<table class="table table-striped">
				<caption>学生论文</caption>
				<thead>
					<tr>
					    <th>姓名</th>
						<th>标题</th>
						<th>检查结果</th>
						<th>评审结果</th>
						<th>答辩结果</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="U" items="${dataList}">
						<tr>
						    <td>${U.name}</td>
							<td>${U.b102}</td>
							<td>${U.b107}</td>
							<td><c:choose>
									<c:when test="${U.b108=='未评审'}">
										<p>${U.b108}</p>
									</c:when>
									<c:otherwise>
										<a href="<%=path%>/view_Review.html?b101=${U.b101}">${U.b108}</a>
									</c:otherwise>
								</c:choose>
							</td>
								<td>
							<c:choose>
								<c:when test="${U.b109=='未答辩'}">
										<p>${U.b109}</p>
									</c:when> 
									<c:otherwise>
										<a href="<%=path%>/view_Reply.html?b101=${U.b101}">${U.b109}</a>
									</c:otherwise>
							</c:choose>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>