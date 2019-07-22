<%@ page language="java"  pageEncoding="GBK"%>
<%@ include file="topLine.jsp"%>
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
			<form id="myform" action="" method="post">
			<!-- ���ݵ������� -->
				<table class="table" id="table">
					<caption>��Ϣ����</caption>
					<tbody>
						<tr><td>&#12288;</td></tr>
						<tr>
							<td><input class="btn btn-info" type="submit" value="��ְ��Ա��Ϣ����" name="next" formaction="<%=path %>/queryStaff.jsp"></td>
						</tr>
						<tr><td>&#12288;</td></tr>
						<tr>
							<td><input class="btn btn-info" type="submit" value="ѧ����Ϣ����" name="next" formaction="<%=path %>/queryStu.jsp"></td>
						</tr>
						<tr><td>&#12288;</td></tr>
					</tbody>
				</table>
				<e:hidden name="uid" value="101"/>
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