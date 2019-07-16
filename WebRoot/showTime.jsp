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
  <!-- 查询条件区 -->
	<table border="1" width="95%" align="center">
	  <caption>
	               空闲时间表
	    <hr width="160">
	  </caption>
	  <tr>
	  <td>姓名</td>
	  <td>职责</td>
	    <c:if test="${not empty applicationScope.date1}">
   		  <td>${applicationScope.date1}上午</td>
   		  <td>${applicationScope.date1}下午</td>
        </c:if>
	    <c:if test="${not empty applicationScope.date2}">
   		  <td>${applicationScope.date2}上午</td>
   		  <td>${applicationScope.date2}下午</td>
        </c:if>
        <c:if test="${not empty applicationScope.date3}">
   		  <td>${applicationScope.date3}上午</td>
   		  <td>${applicationScope.date3}下午</td>
        </c:if>
        <c:if test="${not empty applicationScope.date4}">
   		  <td>${applicationScope.date4}上午</td>
   		  <td>${applicationScope.date4}下午</td>
        </c:if>
        <c:if test="${not empty applicationScope.date5}">
   		  <td>${applicationScope.date5}上午</td>
   		  <td>${applicationScope.date5}下午</td>
        </c:if>
        <c:if test="${not empty applicationScope.date6}">
   		  <td>${applicationScope.date6}上午</td>
   		  <td>${applicationScope.date6}下午</td>
        </c:if>
        <c:if test="${not empty applicationScope.date7}">
   		  <td>${applicationScope.date7}上午</td>
   		  <td>${applicationScope.date7}下午</td>
        </c:if>
	  </tr>

	
	<!-- 数据迭代区 -->
       <c:choose>
	     <c:when test="${dataList!=null }">
	         <!-- 显示实际查询到的数据 -->
		     <c:forEach items="${dataList }" var="ins" varStatus="vs">	    	   	  
	    	   	<c:forEach items="${ins.a201 }" var="index" varStatus="vs">
	    	   	    <tr>
	    	   	    <td>${ins.name1 }</td>
	    	   	    <td>导师</td>
	    	   	      <c:forEach items="${ins.a201.toCharArray() }" var="n" varStatus="vs">
	                       <c:choose >
	                       <c:when test="${n != '49' }">
	                       <td> </td>
	                       </c:when>       
	                       <c:otherwise>
	                       <td>√</td>
	                       </c:otherwise>
	                       </c:choose>
					  </c:forEach>
					</tr>
				 </c:forEach>
				 	  <c:forEach items="${ins.a301 }" var="index" varStatus="vs">
	    	   	    <tr>
	    	   	    <td>${ins.name2 }</td>
	    	   	    <td>秘书</td>
	    	   	      <c:forEach items="${ins.a301.toCharArray() }" var="n" varStatus="vs">
	                       <c:choose >
	                       <c:when test="${n != '49' }">
	                       <td> </td>
	                       </c:when>       
	                       <c:otherwise>
	                       <td>√</td>
	                       </c:otherwise>
	                       </c:choose>
					  </c:forEach>
					</tr>
				 </c:forEach>
				 <c:forEach items="${ins.a504 }" var="index" varStatus="vs">
	    	   	    <tr>
	    	   	    <td>${ins.name3 }</td>
	    	   	    <td>专家</td>
	    	   	      <c:forEach items="${ins.a504.toCharArray() }" var="n" varStatus="vs">
	                       <c:choose >
	                       <c:when test="${n != '49' }">
	                       <td> </td>
	                       </c:when>       
	                       <c:otherwise>
	                       <td>√</td>
	                       </c:otherwise>
	                       </c:choose>
					  </c:forEach>
					</tr>
				 </c:forEach>
		      </c:forEach>
	     </c:when>
	   </c:choose>
	</table>
	<!-- 功能按钮区 -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td align="center">
	       <input type="submit" name="next" value="查询">
	    </td>
	  </tr>
	</table>
</form>
</body>
</html>