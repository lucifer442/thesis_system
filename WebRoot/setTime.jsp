<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="edu.whu.system.tools.Tools" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%String path=request.getContextPath(); %>
<%String datesub = application.getAttribute("datesub").toString(); %>
<html>
<head>
   <title>Insert title here</title>
   <style type="text/css">
     tr
     {
        height:25px;
     }
   </style>

</head>
<body>
<form id="myform" action="<%=path%>/SetTime.html" method="post">
  <!-- ��ѯ������ -->
	<table border="1" width="95%" align="center">
	  <caption>
	               ����ʱ���
	    <hr width="160">
	  </caption>
	  <tr>
	    <c:if test="${not empty applicationScope.date1}">
   		  <td>${applicationScope.date1}����</td>
   		  <td>${applicationScope.date1}����</td>
        </c:if>
	    <c:if test="${not empty applicationScope.date2}">
   		  <td>${applicationScope.date2}����</td>
   		  <td>${applicationScope.date2}����</td>
        </c:if>
        <c:if test="${not empty applicationScope.date3}">
   		  <td>${applicationScope.date3}����</td>
   		  <td>${applicationScope.date3}����</td>
        </c:if>
        <c:if test="${not empty applicationScope.date4}">
   		  <td>${applicationScope.date4}����</td>
   		  <td>${applicationScope.date4}����</td>
        </c:if>
        <c:if test="${not empty applicationScope.date5}">
   		  <td>${applicationScope.date5}����</td>
   		  <td>${applicationScope.date5}����</td>
        </c:if>
        <c:if test="${not empty applicationScope.date6}">
   		  <td>${applicationScope.date6}����</td>
   		  <td>${applicationScope.date6}����</td>
        </c:if>
        <c:if test="${not empty applicationScope.date7}">
   		  <td>${applicationScope.date7}����</td>
   		  <td>${applicationScope.date7}����</td>
        </c:if>
	  </tr>
	  <tr>
	   <c:forEach var="i" begin="1" end="${applicationScope.datesub * 2 }" step="1">
	      <td align="center">
	        <input  type="checkbox" name="settime" value="${i }">
	      </td>
	    </c:forEach>
	  </tr>
    </table>
    <table border="1" width="95%" align="center">
      <tr>
	    <td align="center">
	      <input type="submit" name="next" value="�ύ">
	    </td>
	  </tr>
	</table>
	  <input type="hidden" name="hided" value="${dataMap.uid }">
      <e:hidden name="datesub" value="<%=datesub %>"/>
  </form>

</body>
</html>