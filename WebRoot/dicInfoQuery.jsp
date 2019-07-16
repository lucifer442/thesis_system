<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="menu.jsp"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
   <title>答辩专家查询答辩信息</title>
<title>查询答辩信息</title>
</head>
<body>
${msg }
   <br>
   <br>
   <form id="dicInfoQueryForm" action="<%=path%>/dicInfoQuery.html" method="post">
      <!-- 数据迭代区域 -->
      <table border="1">
         <caption>
                       秘书管理
            <hr class="ShortHR">
         </caption>
         <tr>
            <td>序号</td>
            <td>你的职务</td>
            <td>学生姓名</td>
            <td>论文标题</td>
            <td>导师姓名</td>
         </tr>
	     <c:choose>
	        <c:when test="${dataList!=null }">
	        <!-- 显示查询到的数据 -->
	           <c:forEach items="${dataList }" var="dataMap" varStatus="vs">
	              <tr>
	                 <td>${vs.count }</td>
	                 <td>${dataMap.sb302  }</td>
                     <td>${dataMap.name1  }</td>
				     <td>${dataMap.b102   }</td>
				     <td>${dataMap.name2  }</td>
	              </tr>
	           </c:forEach>
	           
	           <!-- 补充空行 -->
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
	           <input type="submit" name="next" value="查询" 
	           formaction="<%=path%>/dicInfoQuery.html">
            </td>
	     </tr>
      </table>
   </form>
</body>
</html>