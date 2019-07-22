<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="topLine.jsp"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>˶ʿѧλ����������ϵͳ</title>
	<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/mycss.css">
	<script src="bootstrap-3.3.7-dist/js/jquery-3.3.1.min.js"></script>
	<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<script>
	//ѭ�����ı��tr��ǩ�ı�����ɫ
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
	</script>
</head>

<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-2 column">
			<jsp:include page="menu.jsp" flush="true"><jsp:param value="" name=""/></jsp:include>
		</div>
		<div class="col-md-10 column">
			<form action="<%=path%>/addExp.html" method="post">
				<table class="table" id="table">
					<caption>ר��${empty dataMap.uid?'���':'�޸�' }<hr></caption>
					<tbody class="addStaff-tbody">
						<tr>
							<td></td>
							<td></td>
							<td>����</td>
							<td>
								<e:text name="name" required="true" autofocus="true" defval="${dataMap.name }"/> 
							</td>
							<td></td>
						</tr>
						<c:if test="${!empty dataMap.uid }">
						<tr>
							<td></td>
							<td></td>
							<td>���</td>
							<td>
								<e:text name="uid"  readonly="true" defval="${dataMap.uid }"/> 
							</td>
							<td></td>
						</tr>
						</c:if>
						<tr>
							<td></td>
							<td></td>
							<td>����ѧУ</td>
							<td>
								<e:text name="a601"  required="true" defval="${dataMap.a601 }"/>
							</td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td>ר�����</td>
							<td>
								<!-- ����name�����Զ�����,���ڵ�ѡ -->
								<e:radio name="a602" value="У��:1,У��:2" defval="${dataMap.a602 }"/>
							</td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td>�о�����</td>
							<td>
								<e:text  name="a603" defval="${dataMap.a603 }"/>
							</td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td>ְ��</td>
							<td>
								<e:radio name="a604" value="����:1,������:2,����:3" defval="${dataMap.a604 }" />
							</td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td>���֤��</td>
							<td>
								<e:text name="a605"  required="true" defval="${dataMap.a605 }"/> 
							</td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td>�����˺�</td>
							<td>
								<e:text name="a606"  required="true" defval="${dataMap.a606 }"/> 
							</td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td>��������</td>
							<td>
								<e:text name="a607" required="true" defval="${dataMap.a607 }"/>
							</td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td>�ֻ���</td>
							<td>
								<e:text name="a608" required="true" defval="${dataMap.a608 }"/>
							</td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td>�����</td>
							<td>
								<e:email name="a609" required="true" defval="${dataMap.a609 }" />
							</td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td>ר�ҽ�ɫ</td>
							<td>
								<e:groupbox name="roles" value="��ʦ:2,ר��:7,����ר��:4,���ר��:5" defval="${dataMap.roles }" />
							</td>
							<td></td>
						</tr>
						<tr>
							<td colspan="5">
								<input type="submit" name="next" value="${empty dataMap.uid?'���':'�޸�' }" class="btn btn-info"
								formaction="<%=path%>/${empty dataMap.uid?'add':'modify' }Staff.html">
								<input type="submit" name="next" value="����" class="btn btn-info"
								formaction="<%=path%>/queryStaff.jsp" formnovalidate="formnovalidate">
							</td>
						</tr>
						<tr><td colspan="5">${msg }</td></tr>
					</tbody>
				</table>
				<input type="hidden" name="hid" value="${dataMap.uid }">
				<e:hidden name="qname"/>
				<e:hidden name="qa602"/>
				<e:hidden name="qa601"/>
				<e:hidden name="qa605"/>
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