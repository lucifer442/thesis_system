<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="menu.jsp"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<!DOCTYPE html>
<html>
<head>
<title>��������</title>
</head>
<body>
${msg}
	<div class="container">
		<form
			action="<%=path%>/${empty dataMap?'expert_Add':'expert_Modify'}.html"
			method="post">
			<table>
				<caption>����</caption>
				<thead></thead>
				<tbody>
					<tr>
						<th>����</th>
						<td><e:textarea rows="5" cols="45" name="b203" defval="${dataMap.b203}" /></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<button class="btn btn-lg btn-primary btn-block"
								style="width: 110px" name="b101" value="${dataMap.b101}">${empty dataMap?'�ύ':'�޸�'}</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>