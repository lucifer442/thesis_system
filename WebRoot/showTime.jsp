<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="edu.whu.system.tools.Tools" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ include file="menu.jsp"%>
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
<form id="myform" action="<%=path%>/TimeManage.html" method="post">
  <!-- ��ѯ������ -->
	<table border="1" width="95%" align="center">
	  <caption>
	               ����ʱ���
	    <hr width="160">
	  </caption>
	  <tr>
	  <td>����</td>
	  <td>ְ��</td>
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

	
	<!-- ���ݵ����� -->
       <c:choose>
	     <c:when test="${dataList!=null }">
	         <!-- ��ʾʵ�ʲ�ѯ�������� -->
		     <c:forEach items="${dataList }" var="ins" varStatus="vs">	    	   	  
	    	   	<c:forEach items="${ins.a201 }" var="index" varStatus="vs">
	    	   	    <tr>
	    	   	    <td>${ins.name1 }</td>
	    	   	    <td>��ʦ</td>
	    	   	      <c:forEach items="${ins.a201.toCharArray() }" var="n" varStatus="vs">
	                       <c:choose >
	                       <c:when test="${n != '49' }">
	                       <td> </td>
	                       </c:when>       
	                       <c:otherwise>
	                       <td>��</td>
	                       </c:otherwise>
	                       </c:choose>
					  </c:forEach>
					</tr>
				 </c:forEach>
				 	  <c:forEach items="${ins.a301 }" var="index" varStatus="vs">
	    	   	    <tr>
	    	   	    <td>${ins.name2 }</td>
	    	   	    <td>����</td>
	    	   	      <c:forEach items="${ins.a301.toCharArray() }" var="n" varStatus="vs">
	                       <c:choose >
	                       <c:when test="${n != '49' }">
	                       <td> </td>
	                       </c:when>       
	                       <c:otherwise>
	                       <td>��</td>
	                       </c:otherwise>
	                       </c:choose>
					  </c:forEach>
					</tr>
				 </c:forEach>
				 <c:forEach items="${ins.a504 }" var="index" varStatus="vs">
	    	   	    <tr>
	    	   	    <td>${ins.name3 }</td>
	    	   	    <td>ר��</td>
	    	   	      <c:forEach items="${ins.a504.toCharArray() }" var="n" varStatus="vs">
	                       <c:choose >
	                       <c:when test="${n != '49' }">
	                       <td> </td>
	                       </c:when>       
	                       <c:otherwise>
	                       <td>��</td>
	                       </c:otherwise>
	                       </c:choose>
					  </c:forEach>
					</tr>
				 </c:forEach>
		      </c:forEach>
	     </c:when>
	   </c:choose>
	</table>
	<!-- ���ܰ�ť�� -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td align="center">
	       <input type="submit" name="next" value="��ѯ">
	    </td>
	  </tr>
	</table>
</form>
</body>
</html>