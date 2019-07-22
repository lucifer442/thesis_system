<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="topLine.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>硕士学位论文评审答辩系统</title>
	<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/mycss.css">
	<script src="bootstrap-3.3.7-dist/js/jquery-3.3.1.min.js"></script>
	<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<script>
	//循环更改表格tr标签的背景颜色
	window.onload=function()
	{
		var item= document.getElementById("table");
		var tbody=item.getElementsByTagName("tbody")[0];
		var trs= tbody.getElementsByTagName("tr");
		for(var i=0;i<trs.length;i++)
		{  
			if(i%4==1)
			{  
				trs[i].style.background="#d0e9c6";
			}
			else if(i%4==3)
			{
				trs[i].style.background="#fcf8e3"; 
			}
			else
			{
				trs[i].style.background="#FFFFFF";
       		}
		}  
	}
	function onExam(b101)
	{
		var vform = document.getElementById("myform");
		vform.action="<%=path%>/view_Review.html?b101="+b101;
		vform.submit();
	}
	function onPreview(b101)
	{
		var vform = document.getElementById("myform");
		vform.action="<%=path%>/view_Reply.html?b101=" + b101;
		vform.submit();
	}
	</script>
</head>


<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-2 column">
			<jsp:include page="menu.jsp" flush="true"><jsp:param value="" name=""/></jsp:include>
		</div>
		<div class="col-md-10 column">
			<form action="<%=path%>/sec_Search.html" method="post">
				<table class="table" id="table">
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
							<button class="btn btn-info" type="submit">筛选</button>
							<button class="btn btn-info" type="submit"
							formaction="<%=path%>/staB01.html">论文审批统计</button>
							<button class="btn btn-info" type="submit"
							formaction="<%=path%>/staB02.html">评审等级统计</button>
						</td>
					</tr>
				</table>
			</form>
			<form id="myform" action="" method="post">
				<table class="table">
					<caption>学生论文</caption>
					<thead>
						<tr>
							<th>标题</th>
							<th>检查结果</th>
							<th>评审结果</th>
							<th>答辩结果</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="U" items="${dataList}">
						<tr>
							<td>${U.b102}</td>
							<td>${U.b107}</td>
							<td>
							<c:choose>
							<c:when test="${U.b108=='未评审'}">
								<p>${U.b108}</p>
							</c:when>
							<c:otherwise>
								<a href="#" onclick="onExam('${U.b101}')">${U.b108}</a>
							</c:otherwise>
							</c:choose>
							</td>
							<td>
							<c:choose>
							<c:when test="${U.b109=='未答辩'}">
								<p>${U.b109}</p>
							</c:when> 
							<c:otherwise>
								<a href="#" onclick="onExam('${U.b101}')">${U.b109}</a>
							</c:otherwise>
							</c:choose>
							</td>
						</tr>
						<tr>
							<td>${msg}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</form>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-12 column">
		<jsp:include page="footer.jsp" flush="true"><jsp:param value="" name=""/></jsp:include>
		</div>
	</div>
</div>
</body>
</html>