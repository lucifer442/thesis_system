<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%	
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	request.setAttribute("basePath", basePath);
%>
<!DOCTYPE html>
<html>
<head>
<title>�˻�����</title>
</head>
<body>
<e:message/>
	<form action="<%=path%>/activate" method="post">
		<table align=center>
			<tr>
				<td>
					��ӭ�����ϵͳ�˺š�
				</td>
			</tr>
			<tr>
				<td>
					�����û����ͳ�ʼ����Ϊ${param.flag }
				</td>
			</tr>
			<tr>
				<td>
					������ť�����˺�
				</td>
			</tr>
			<tr>
				<td>
					<e:hidden name="flag" value="${param.flag }"/>
					<e:submit name="next" value="����"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>