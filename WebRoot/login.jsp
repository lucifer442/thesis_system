<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%	
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	request.setAttribute("basePath", basePath);
%>
<html>
<head>
<title>��¼ϵͳ</title>
</head>
<body>
	<h1 align="center">˶ʿѧλ����������ϵͳ</h1>
	<e:message/>
	<form action="<%=path %>/login" align="center" method="post">
		<table align="center">
			<tr>
				<td>
					�û���
				</td>
				<td>
					<e:text name="username" onblur="if(this.value.replace(/^ +| +$/g,'')=='')alert('�û�������Ϊ��!')"/>
				</td>
			</tr>
			<tr>
				<td>
					����
				</td>
				<td>
					<input type="password" name="password" onblur="if(this.value.replace(/^ +| +$/g,'')=='')alert('���벻��Ϊ��!')">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" name="next" onclick="isUNameExist()">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>