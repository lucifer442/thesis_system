<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
   
   <script type="text/javascript">
      var count=0;

      function onSelect(vstate)
      {
    	  vstate?count++:count--;
    	  var vdel=document.getElementById("del");
    	  var vdel2=document.getElementById("ema");
    	  vdel.disabled=(count==0);
    	  vdel2.disabled=(count==0);
      }
      
      function onEdit(vaab101)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdExp.html?uid="+vaab101;
    	 //alert(vform.action);
    	 vform.submit();
      }
      
      function onDel(vaab101)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/delByIdExp.html?uid="+vaab101;
    	 //alert(vform.action);
    	 vform.submit();
      } 
      
   </script>
</head>
<body>
<a href="<%=path %>/infoManage.jsp">返回</a>
<form id="myform" action="<%=path%>/queryExp.html" method="post">
<!-- 查询条件区 -->
	<table border="1" width="95%" align="center">
	  <caption>
	               专家查询
	    <hr width="160">
	  </caption>
	  <tr>
	    <td colspan="4">查询条件</td>
	  </tr>
	  <tr>
	    <td>姓名</td>
	    <td>
	      <e:text name="qname"/>
	    </td>
	    <td>专家类别</td>
	    <td>
	       <e:radio name="qa602" value="校内:1,校外:2,不限:''" defval=""/>
	    </td>
	  </tr>
	  <tr>
	    <td>所属大学</td>
	    <td>
	      <e:text name="qa601"/>
	    </td>
	    <td>研究领域</td>
	    <td>
	      <e:text name="qa605"/>
	    </td>
	  </tr>
	</table>
	<!-- 数据迭代区 -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td></td>
	    <td>id</td>
	    <td>姓名</td>
	    <td>所属大学</td>
	    <td>专家类别</td>
	    <td>研究领域</td>
	    <td>职称</td>
	    <td>身份证</td>
	    <td>手机号码</td>
	    <td>电子邮件</td>
	    <td>操作</td>
	    <td></td>
	  </tr>
	  <!--
	         注意事项
	    1.$及大括号的结束标记 }与双引号之间,不允许出现空格
	    2.所有的属性之间至少要有一个空格,否则报错
	    3.var 属性,相当于在页面定义变量名称,因此  ins不允许再用$ {  }
	   -->
	   <c:choose>
	     <c:when test="${dataList!=null }">
	         <!-- 显示实际查询到的数据 -->
		     <c:forEach items="${dataList }" var="ins" varStatus="vs">
	    	   	  <tr>
				    <td>
				      <input type="checkbox" name="idlist" value="${ins.uid }"
				             onclick="onSelect(this.checked)" >
				    </td>
				    <td>
				      <a href="#" onclick="onEdit('${ins.uid}')">${ins.uid }</a>
				    </td> 
				    <td>${ins.name }</td>
				    <td>${ins.a601 }</td>
				    <td>${ins.a602 }</td>
				    <td>${ins.a603 }</td>
				    <td>${ins.a604 }</td>
				    <td>${ins.a605 }</td>
				    <td>${ins.a608 }</td>
				    <td>${ins.a609 }</td>
				    <td>
				      <a href="#" onclick="onDel('${ins.uid}')">删除</a>
				    </td>
				  </tr>
		      </c:forEach>
		      <!-- 补充空行 -->
		      <c:forEach begin="${fn:length(rows)+1 }" step="1" end="15">
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
	</table>
	
	<!-- 功能按钮区 -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td align="center">
	       <input type="submit" name="next" value="查询">
	       <input type="submit" name="next" value="添加" 
	              formaction="<%=path%>/addExp.jsp">
	       <input type="submit" id="del" name="next" value="删除" 
	              formaction="<%=path%>/delExp.html"  disabled="disabled">
	       <input type="submit" id="ema" name="next" value="发送邀请" 
	              formaction="<%=path%>/Email.html"  disabled="disabled">
	    </td>
	  </tr>
	</table>
	<input type="hidden"  >
    <e:hidden name="path" value="<%=path %>"/>
</form>
<form method="post" action="<%=path%>/ExpExcel.htms" encType="multipart/form-data">
		<input type="file" name="uploadFile" accept=".xls"/> 
		<input class="filesubmit" type="submit"  value="Excel导入" />
</form>
</body>
</html>