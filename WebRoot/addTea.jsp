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
<form action="<%=path%>/addTea.html" method="post">
<table  border="1" align="center" width="45%">
    <caption>
       ��ʦ${empty dataMap.uid?'���':'�޸�' }
      <hr width="160">
    </caption>
   <tr>
     <td colspan="2">ר������</td>
   </tr>
   <tr>
     <td>����</td>
     <td>
       <e:text name="name" required="true" autofocus="true" defval="${dataMap.name }"/> 
     </td>
   </tr>
   <c:if test="${!empty dataMap.uid }">
	   <tr>
	     <td>���</td>
	     <td>
	       <e:text name="uid"  readonly="true" defval="${dataMap.uid }"/> 
	     </td>
	   </tr>
   </c:if>
   <tr>
     <td>�о�����</td>
     <td>
       <e:text  name="a603" defval="${dataMap.a603 }"/>
     </td>
   </tr>
   <tr>
     <td>ְ��</td>
     <td>
       <e:radio name="a604" value="����:1,������:2,����:3" defval="${dataMap.a604 }" />
     </td>
   </tr>
   <tr>
     <td>���֤��</td>
     <td>
        <e:text name="a605"  required="true" defval="${dataMap.a605 }"/> 
     </td>
   </tr>
   <tr>
     <td>�����˺�</td>
     <td>
       <e:text name="a606"  required="true" defval="${dataMap.a606 }"/> 
     </td>
   </tr>
   <tr>
     <td>��������</td>
     <td>
       <e:text name="a607" required="true" defval="${dataMap.a607 }"/>
     </td>
   </tr>
   <tr>
     <td>�ֻ���</td>
     <td>
       <e:text name="a608" required="true" defval="${dataMap.a608 }"/>
     </td>
   </tr>
   <tr>
     <td>�����</td>
     <td>
        <e:text name="a609" required="true" defval="${dataMap.a609 }" />
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
       <input type="submit" name="next" value="${empty dataMap.uid?'���':'�޸�' }"
              formaction="<%=path%>/${empty dataMap.uid?'add':'modify' }Tea.html">
       <input type="submit" name="next" value="����" 
              formaction="<%=path%>/queryTea.jsp"
              formnovalidate="formnovalidate">
     </td>
   </tr>
</table>
<input type="hidden" name="hid" value="${dataMap.uid }">
<e:hidden name="qname"/>
<e:hidden name="qa605"/>
</form>
</body>
</html>