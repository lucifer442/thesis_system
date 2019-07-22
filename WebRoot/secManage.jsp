<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ include file="topLine.jsp" %>
<html>
<head>
<title>硕士学位论文评审答辩系统</title>
   <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
   <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/mycss.css">
   <script src="bootstrap-3.3.7-dist/js/jquery-3.3.1.min.js"></script>
   <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
   <script type="text/javascript">
   //循环更改表格tr标签的背景颜色
   window.onload=function()
   {
       var item= document.getElementById("table");
       var tbody=item.getElementsByTagName("tbody")[0];
       var trs= tbody.getElementsByTagName("tr");
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
   //按钮loading效果
   $(function()
   {
       $(".btn").click(function(){
           $(this).button('loading').delay(10).queue(function() {
           });
       });
   });
   //激活批量删除按钮
   var count=0;
   function onSelect(vState)
   {
	   vState?count++:count--;
	   var vDel=document.getElementById("del");
	   vDel.disabled=(count==0);
   }
   //单一实例查询
   function onEdit(vuid)
   {
 	  var vform=document.getElementById("secQueryForm");
 	  vform.action="<%=path%>/secFindById.html?uid="+vuid;
 	  vform.submit();
   }
   //单一实例删除
   function onDel(vuid)
   {
 	 var vform = document.getElementById("secQueryForm");
 	 vform.action="<%=path%>/secDelById.html?uid="+vuid;
 	 vform.submit();
   }
   //全选/全不选操作
   function setAllNo()
   {
       var box = document.getElementById("allAndNotAll");
       var boxes = document.getElementsByName("idList");
       if(box.checked == false)
       {//全不选
           for (var i = 0; i < boxes.length; i++) 
           {
        	   if(boxes[i].checked==true)
       		   {
        		   onSelect(false);
       		   }
        	   boxes[i].checked = false;
           }
       }
       else
       {//全选
           for (var i = 0; i < boxes.length; i++) 
           {
        	   if(boxes[i].checked==false)
		       {
                   onSelect(true);	   
		       }
        	   boxes[i].checked = true;
           }
       }
   }
   
   function toggle(targetId) 
   {
	   if (document.getElementById)
	   {
		   target=document.getElementById(targetId);
		   if ( target.style.display=="none") 
		   {
			   target.style.display=""; 
		   } 
		   else
		   {
			   target.style.display="none";
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
		   <form id="secQueryForm" class="secQueryForm" action="<%=path%>/secQuery.html" method="post">
		      <!-- 数据迭代区域 -->
		      <table id="table" class="table">
		      	 <caption>秘书管理<hr></caption>
		         <thead>
		         	<tr>
		            <td><input type="checkBox" id="allAndNotAll" onclick="setAllNo()"></td>
		            <td>序号</td>
		            <td>姓名</td>
		            <td>所属单位</td>
		            <td>研究领域</td>
		            <td>职称</td>
		            <td>身份证号码</td>
		            <td>手机号码</td>
		            <td>邮件</td>
		            <td></td>
		            <td></td>
		         </tr>
		         </thead>
		         <tbody>
		         	<c:choose>
				        <c:when test="${dataList!=null }">
				        <!-- 显示查询到的数据 -->
				           <c:forEach items="${dataList }" var="dataMap" varStatus="vs">
				              <tr>
				                 <td>
				                    <input type="checkBox" name="idList" value="${dataMap.uid }"
				                    onclick="onSelect(this.checked)">
				                 </td>
				                 <td>${vs.count }</td>
			                     <td>${dataMap.name }</td>
							     <td>${dataMap.a601 }</td>
							     <td>${dataMap.a603 }</td>
							     <td>${dataMap.xa604}</td>
							     <td>${dataMap.a605 }</td>
							     <td>${dataMap.a608 }</td>
							     <td>${dataMap.a609 }</td>
							     <td>
							        <a href="#" onclick="onDel('${dataMap.uid}')">删除</a>
							     </td>
							     <td>
							        <a href="#" onclick="onEdit('${dataMap.uid}')">修改</a>
							     </td>
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
				                 <td></td>
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
				                 <td></td>
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
				        <td colspan="12">
				           <input type="submit" name="next" value="查询" class="btn btn-info"
				           formaction="<%=path%>/secQuery.html">
				           <input type="submit" name="next" value="添加秘书" class="btn btn-info"
				           formaction="<%=path%>/secAddManage.jsp">
			               <input type="submit" id="del" name="next" value="批量删除"
			               disabled="disabled" class="btn btn-info" formaction="<%=path%>/secDel.html">
			            </td>
				     </tr>
				     <tr>
				     	<td colspan="12">${msg}</td>
				     </tr>
		         </tbody>
		      </table>
		   </form>
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