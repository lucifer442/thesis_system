<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="menu.jsp"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>dataMapert title here</title>
<style type="text/css">
  td{
      height:30px;
  }
  msg{
     color:#FF0000
  }
</style>
</head>
<body>
<br>
<br>
<form action="<%=path%>/addStu.html" method="post">
<table  border="1" align="center" width="45%">
    <caption>
       学生${empty dataMap.uid?'添加':'修改' }
      <hr width="160">
    </caption>
   <tr>
     <td colspan="2">学生数据</td>
   </tr>
   <tr>
     <td>姓名</td>
     <td>
       <e:text name="name" required="true" autofocus="true" defval="${dataMap.name }"/> 
     </td>
   </tr>
   <c:if test="${!empty dataMap.uid }">
	   <tr>
	     <td>编号</td>
	     <td>
	       <e:text name="uid"  readonly="true" defval="${dataMap.uid }"/> 
	     </td>
	   </tr>
   </c:if>
   <tr>
     <td>学号</td>
     <td>
       <e:text name="a101"  required="true" defval="${dataMap.a101 }"/>
     </td>
   </tr>
   <tr>
     <td>身份证号</td>
     <td>
       <e:text name="a102"  required="true" defval="${dataMap.a102 }"/>
     </td>
   </tr>
   <tr>
     <td>学生类别</td>
     <td>
       <e:text  name="a103" defval="${dataMap.a103 }"/>
     </td>
   </tr>
   <tr>
     <td>学院</td>
     <td>
       <e:text  name="a104" defval="${dataMap.a104 }"/>
     </td>
   </tr>
   <tr>
     <td>导师id</td>
     <td>
       <e:text  name="uid2" defval="${dataMap.uid2 }"/>
     </td>
   </tr>
     <td colspan="2" align="center">
       <input type="submit" name="next" value="${empty dataMap.uid?'添加':'修改' }"
              formaction="<%=path%>/${empty dataMap.uid?'add':'modify' }Stu.html">
       <input type="submit" name="next" value="返回" 
              formaction="<%=path%>/queryStu.jsp"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
<input type="hidden" name="hid" value="${dataMap.uid }">
<e:hidden name="qname"/>
<e:hidden name="qa101"/>
<e:hidden name="qa104"/>
</form>
</body>
</html>