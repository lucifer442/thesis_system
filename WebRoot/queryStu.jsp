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
    	  vdel.disabled=(count==0);
      }
      
      function onEdit(vaab101)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdStu.html?uid="+vaab101;
    	 //alert(vform.action);
    	 vform.submit();
      }
      
      function onDel(vaab101)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/delByIdStu.html?uid="+vaab101;
    	 //alert(vform.action);
    	 vform.submit();
      } 
      
   </script>
</head>
<body>
<a href="<%=path %>/infoManage.jsp">返回</a>
<form id="myform" action="<%=path%>/queryStu.html" method="post">
<!-- 查询条件区 -->
	<table border="1" width="95%" align="center">
	  <caption>
	               学生查询
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
	    <td>学号</td>
	    <td>
	       <e:text name="qa101" />
	    </td>
	  </tr>
	  <tr>
	    <td>学院</td>
	    <td>
	      <e:text name="qa104"/>
	    </td>
	  </tr>
	</table>
	<!-- 数据迭代区 -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td></td>
	    <td>id</td>
	    <td>姓名</td>
	    <td>学号</td>
	    <td>身份证号码</td>
	    <td>学生类别</td>
	    <td>学院</td>
	    <td>导师id</td>
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
				    <td>${ins.a101 }</td>
				    <td>${ins.a102 }</td>
				    <td>${ins.a103 }</td>
				    <td>${ins.a104 }</td>
				    <td>${ins.uid2 }</td>
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
	              formaction="<%=path%>/addStu.jsp">
	       <input type="submit" id="del" name="next" value="删除" 
	              formaction="<%=path%>/delStu.html"  disabled="disabled">
	    </td>
	  </tr>
	</table>
</form>
<form method="post" action="<%=path%>/StuExcel.htms" encType="multipart/form-data">
		<input type="file" name="uploadFile" accept=".xls"/> 
		<input class="filesubmit" type="submit"  value="Excel导入"/>
</form>
</body>
</html>