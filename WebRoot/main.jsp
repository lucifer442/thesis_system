<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="topLine.jsp" %>
<%@page import="java.util.*"%>
<html>
<head>
<title>硕士学位论文评审答辩系统</title>
   <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
   <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/mycss.css">
   <script src="bootstrap-3.3.7-dist/js/jquery-3.3.1.min.js"></script>
   <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
   <script>
   //给ul->li->a标签循环涂色
   window.onload=function()
   {
       var item= document.getElementById("message-list");
       var tbody=item.getElementsByTagName("ul")[0];
       var trs= tbody.getElementsByTagName("li");
       for(var i=0;i<trs.length;i++){  
           if(i%4==1){  
               trs[i].style.background="#d0e9c6";
           }
           else if(i%4==3)
       	   {
        	   trs[i].style.background="#fcf8e3"; 
       	   }
           else
       	   {
       	       trs[i].style.background="#FFFFFF";
       	   }
       }  
   }
   </script>
</head>
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-2 column">
			<jsp:include page="menu.jsp" flush="true"><jsp:param value="" name=""/></jsp:include>
		</div>
		<div class="col-md-10 column">
			<div align="center" id="message-list">
				<ul style="list-style:none;">
					<li>
						<p class="message-title">消息列表</p>
						<hr>
						<div class="message-update">
							<input type="submit" class="btn btn-info" name="next" value="刷新消息" formaction="<%=path%>/message">
						</div>
					</li>
					<c:choose>
					<c:when test="${messageList !=null}">
					<c:forEach items="${messageList }" var="message">
						<li class="message-li">${message }<br></li>
					</c:forEach>
					<c:forEach begin="${fn:length(messageList)+1 }" step="1" end="10">
					    <li class="message-li"></li>
					</c:forEach>
					</c:when>
					<c:otherwise>
						<li class="message-li">暂无消息</li>
						<c:forEach begin="1" step="1" end="10">
							<li class="message-li"></li>
						</c:forEach>
			        </c:otherwise>
			        </c:choose>
				</ul>
			</div>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-12 column">
		<jsp:include page="footer.jsp" flush="true"><jsp:param value="" name=""/></jsp:include>
		</div>
	</div>
</div>
</body>
</html>