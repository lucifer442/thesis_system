<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%	
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	request.setAttribute("basePath", basePath);
%>
<html>
<head>
<title>ר��ע��</title>
</head>
<body>
<e:message/>
	<form action="<%=path %>/chooseRole" method="post">
		<table align="center">
			<tr>
				<td>
					��ӭ��ʹ�ñ�ϵͳ��${name }
				</td>
			</tr>
			<tr>
				<td>
					��ѡ�񱾴�˶ʿ�������������������뵣�εĹ���
				</td>
			</tr>
			<tr>
				<td>
					������ͬʱѡ�����������ѡ��һ�
				</td>
			</tr>
			<tr>
				<td>
					<e:groupbox name="roles" value="����ר��:4,���ר��:5"/>
				</td>
			</tr>
			<tr>
				<td>
					<e:submit name="next" value="ȷ��"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>