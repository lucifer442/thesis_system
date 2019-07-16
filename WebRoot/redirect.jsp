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
	var x=setTimeout('getTime()',1000)//1000毫秒=1秒
	if(i<=0)
	{
		clearTimeout(x);
	}
}
window.onload=getTime;
</script>
<title>重定向页面</title>
</head>
<body>
<p align="center">${msg }</p>
<p align="center">页面将在<span id='num' style='display=inline;'>3</span>秒后跳转至登录页面</p><br>
</body>
</html>