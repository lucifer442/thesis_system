<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="menu.jsp"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
   <title>���ר�Ҳ�ѯ�����Ϣ</title>
<title>��ѯ�����Ϣ</title>
</head>
<body>
${msg }
   <br>
   <br>
   <form id="dicInfoQueryForm" action="<%=path%>/dicInfoQuery.html" method="post">
      <!-- ���ݵ������� -->
      <table border="1">
         <caption>
                       �������
            <hr class="ShortHR">
         </caption>
         <tr>
            <td>���</td>
            <td>���ְ��</td>
            <td>ѧ������</td>
            <td>���ı���</td>
            <td>��ʦ����</td>
         </tr>
	     <c:choose>
	        <c:when test="${dataList!=null }">
	        <!-- ��ʾ��ѯ�������� -->
	           <c:forEach items="${dataList }" var="dataMap" varStatus="vs">
	              <tr>
	                 <td>${vs.count }</td>
	                 <td>${dataMap.sb302  }</td>
                     <td>${dataMap.name1  }</td>
				     <td>${dataMap.b102   }</td>
				     <td>${dataMap.name2  }</td>
	              </tr>
	           </c:forEach>
	           
	           <!-- ������� -->
	           <c:forEach begin="${fn:length(dataList)+1 }" step="1" end="15">
	              <tr>
	                 <td></td>
	                 <td></td>
	                 <td></td>
	                 <td></td>
	                 <td></td>
		          </tr>
	           </c:forEach>
	        </c:when>
	        <c:otherwise>
	           <c:forEach begin="1" step="1" end="15">
	              <tr>
	                 <td></td>
	                 <td></td>
	                 <td></td>
	                 <td></td>
	                 <td></td>
	              </tr>
	           </c:forEach>
	        </c:otherwise>
	     </c:choose>
	     <tr>
	        <td colspan="5">
	           <input type="submit" name="next" value="��ѯ" 
	           formaction="<%=path%>/dicInfoQuery.html">
            </td>
	     </tr>
      </table>
   </form>
</body>
</html>