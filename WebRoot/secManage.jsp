<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="menu.jsp"%>
<html>
<head>
   <title>管理员界面</title>
   <script type="text/javascript">
   var count=0;	
   function onSelect(vState)
   {
 	  vState?count++:count--;
 	  var vDel=document.getElementById("del");
 	  vDel.disabled=(count==0);
   }
   function onEdit(vuid)
   {
 	  var vform=document.getElementById("secQueryForm");
 	  vform.action="<%=path%>/secFindById.html?uid="+vuid;
 	  vform.submit();
   }
   function onDel(vuid)
   {
 	 var vform = document.getElementById("secQueryForm");
 	 vform.action="<%=path%>/secDelById.html?uid="+vuid;
 	 vform.submit();
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
   ${msg}
   <br>
   <br>
   <form id="secAddForm" class="secAddForm" action="<%=path%>/secAdd.html" method="post">
      <table border="1">
         <caption>秘书${empty param.uid?'添加':'修改'}
            <hr class="shortHR">
         </caption>
         <tr>
            <td colspan="4">填写下列数据，若没有，则不填写</td>
         </tr>
         <tr>
            <td>姓名</td>
            <td>
               <e:text name="name" required="true" autofocus="true" defval="${dataMap.name }"/>
            </td>
            <td>所属大学</td>
            <td>
               <e:text name="a601" required="true" defval="${dataMap.a601 }"/>
            </td>
         </tr>
         <tr>
            <td>研究领域</td>
            <td>
               <e:text name="a603" defval="${dataMap.a603 }"/>
            </td>
            <td>职称</td>
            <td>
               <e:select name="a604" value="教授:1,副教授:2,讲师:3" defval="${dataMap.a604 }"/>
            </td>
         </tr>
         <tr>
            <td>身份证号</td>
            <td>
               <e:text name="a605" required="true" defval="${dataMap.a605 }"/>
            </td>
            <td>手机号码</td>
            <td>
               <e:text name="a608" required="true" defval="${dataMap.a608 }"/>
            </td>
         </tr>
         <tr>
            <td>邮箱</td>
            <td>
               <e:email name="a609" required="true" defval="${dataMap.a609 }"/>
            </td>
         </tr>
         <tr>
            <td colspan="4" align="center">
               <input type="submit" name="next" value="Excel批量导入"
                formaction="<%=path%>/secAddByExcel.html"
                formnovalidate="formnovalidate">
               <input type="submit" name="next" value="确认${empty param.uid?'添加':'修改'}"
                formaction="<%=path%>/sec${empty param.uid?'Add':'Modify'}.html">
               <button type="button" class="btn bg-default" onclick="history.back(-1);">返回到上一界面</button>
            </td>
         </tr>
      </table>
      <e:hidden name="uid" value="${param.uid }"/>
   </form>
   <div class="50pxHeightBlank">
      <div></div>
   </div>
   <form id="secQueryForm" class="secQueryForm" action="<%=path%>/secQuery.html" method="post">
      <!-- 数据迭代区域 -->
      <table border="1">
         <caption>
                       秘书管理
            <hr width="160">
         </caption>
         <tr>
            <td></td>
            <td>序号</td>
            <td>姓名</td>
            <td>所属大学</td>
            <td>研究领域</td>
            <td>职称</td>
            <td>身份证号码</td>
            <td>手机号码</td>
            <td>邮件</td>
            <td></td>
         </tr>
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
                     <td>
                        <a href="#" onclick="onEdit('${dataMap.uid}')">${dataMap.name }</a>
                     </td>
				     <td>${dataMap.a601  }</td>
				     <td>${dataMap.a603  }</td>
				     <td>${dataMap.xa604 }</td>
				     <td>${dataMap.a605  }</td>
				     <td>${dataMap.a608  }</td>
				     <td>${dataMap.a609  }</td>
				     <td>
				        <a href="#" onclick="onDel('${dataMap.uid}')">删除</a>
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
	              </tr>
	           </c:forEach>
	        </c:otherwise>
	     </c:choose>
	     <tr>
	        <td colspan="10">
	           <input type="submit" name="next" value="查询" 
	           formaction="<%=path%>/secQuery.html">
               <input type="submit" id="del" name="next" value="批量删除"
               disabled="disabled" formaction="<%=path%>/secDel.html">
            </td>
	     </tr>
      </table>
   </form>
</body>
</html>