<%@ page language="java" pageEncoding="GBK"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv='refresh' content='3;url=login.jsp'>
<script type='text/javascript'>
var i=3;
function getTime()
{
	document.getElementById('num').innerHTML="<font color='red'>"+i+"</font>";
	i-=1;
	var x=setTimeout('getTime()',1000)//1000����=1��
	if(i<=0)
	{
		clearTimeout(x);
	}
}
window.onload=getTime;
</script>
<title>�ض���ҳ��</title>
</head>
<body>
<p align="center">${msg }</p>
<p align="center">ҳ�潫��<span id='num' style='display=inline;'>3</span>�����ת����¼ҳ��</p><br>
</body>
</html>