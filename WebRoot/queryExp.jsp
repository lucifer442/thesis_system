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
<a href="<%=path %>/infoManage.jsp">����</a>
<form id="myform" action="<%=path%>/queryExp.html" method="post">
<!-- ��ѯ������ -->
	<table border="1" width="95%" align="center">
	  <caption>
	               ר�Ҳ�ѯ
	    <hr width="160">
	  </caption>
	  <tr>
	    <td colspan="4">��ѯ����</td>
	  </tr>
	  <tr>
	    <td>����</td>
	    <td>
	      <e:text name="qname"/>
	    </td>
	    <td>ר�����</td>
	    <td>
	       <e:radio name="qa602" value="У��:1,У��:2,����:''" defval=""/>
	    </td>
	  </tr>
	  <tr>
	    <td>������ѧ</td>
	    <td>
	      <e:text name="qa601"/>
	    </td>
	    <td>�о�����</td>
	    <td>
	      <e:text name="qa605"/>
	    </td>
	  </tr>
	</table>
	<!-- ���ݵ����� -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td></td>
	    <td>id</td>
	    <td>����</td>
	    <td>������ѧ</td>
	    <td>ר�����</td>
	    <td>�о�����</td>
	    <td>ְ��</td>
	    <td>���֤</td>
	    <td>�ֻ�����</td>
	    <td>�����ʼ�</td>
	    <td>����</td>
	    <td></td>
	  </tr>
	  <!--
	         ע������
	    1.$�������ŵĽ������ }��˫����֮��,��������ֿո�
	    2.���е�����֮������Ҫ��һ���ո�,���򱨴�
	    3.var ����,�൱����ҳ�涨���������,���  ins����������$ {  }
	   -->
	   <c:choose>
	     <c:when test="${dataList!=null }">
	         <!-- ��ʾʵ�ʲ�ѯ�������� -->
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
				      <a href="#" onclick="onDel('${ins.uid}')">ɾ��</a>
				    </td>
				  </tr>
		      </c:forEach>
		      <!-- ������� -->
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
	
	<!-- ���ܰ�ť�� -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td align="center">
	       <input type="submit" name="next" value="��ѯ">
	       <input type="submit" name="next" value="���" 
	              formaction="<%=path%>/addExp.jsp">
	       <input type="submit" id="del" name="next" value="ɾ��" 
	              formaction="<%=path%>/delExp.html"  disabled="disabled">
	       <input type="submit" id="ema" name="next" value="��������" 
	              formaction="<%=path%>/Email.html"  disabled="disabled">
	    </td>
	  </tr>
	</table>
	<input type="hidden"  >
    <e:hidden name="path" value="<%=path %>"/>
</form>
<form method="post" action="<%=path%>/ExpExcel.htms" encType="multipart/form-data">
		<input type="file" name="uploadFile" accept=".xls"/> 
		<input class="filesubmit" type="submit"  value="Excel����" />
</form>
</body>
</html>