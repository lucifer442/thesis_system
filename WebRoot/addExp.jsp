<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="menu.jsp"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="/css/page.css" type="text/css" rel="stylesheet"/>
<html>
<head>
<title>dataMapert title here</title>
</head>
<body>
<br>
${msg }
<br>
<form action="<%=path%>/addExp.html" method="post">
<table  border="1" align="center" width="45%">
    <caption>
       专家${empty dataMap.uid?'添加':'修改' }
      <hr width="160">
    </caption>
   <tr>
     <td colspan="2">专家数据</td>
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
     <td>所属学校</td>
     <td>
       <e:text name="a601"  required="true" defval="${dataMap.a601 }"/>
     </td>
   </tr>
   <tr>
     <td>专家类别</td>
     <td>
       <!--
                         按照name属性自动分组,组内单选 
        -->
        <e:radio name="a602" value="校内专家:1,校外专家:2" defval="${dataMap.a602 }"/>
     </td>
   </tr>
   <tr>
     <td>研究领域</td>
     <td>
       <e:text  name="a603" defval="${dataMap.a603 }"/>
     </td>
   </tr>
   <tr>
     <td>职称</td>
     <td>
       <e:radio name="a604" value="教授:1,副教授:2,其他:3" defval="${dataMap.a604 }" />
     </td>
   </tr>
   <tr>
     <td>身份证号</td>
     <td>
        <e:text name="a605"  required="true" defval="${dataMap.a605 }"/> 
     </td>
   </tr>
   <tr>
     <td>银行账号</td>
     <td>
       <e:text name="a606"  required="true" defval="${dataMap.a606 }"/> 
     </td>
   </tr>
   <tr>
     <td>开户银行</td>
     <td>
       <e:text name="a607" required="true" defval="${dataMap.a607 }"/>
     </td>
   </tr>
   <tr>
     <td>手机号</td>
     <td>
       <e:text name="a608" required="true" defval="${dataMap.a608 }"/>
     </td>
   </tr>
   <tr>
     <td>邮箱号</td>
     <td>
        <e:text name="a609" required="true" defval="${dataMap.a609 }" />
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
       <input type="submit" name="next" value="${empty dataMap.uid?'添加':'修改' }"
              formaction="<%=path%>/${empty dataMap.uid?'add':'modify' }Exp.html">
       <input type="submit" name="next" value="返回" 
              formaction="<%=path%>/queryExp.jsp"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
<input type="hidden" name="hid" value="${dataMap.uid }">
<e:hidden name="qname"/>
<e:hidden name="qa601"/>
<e:hidden name="qa602"/>
<e:hidden name="qa605"/>
</form>
</body>
</html>