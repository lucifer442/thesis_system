<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="menu.jsp"%>
<html>
<head>
   <title>����Ա����</title>
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
         <caption>����${empty param.uid?'���':'�޸�'}
            <hr class="shortHR">
         </caption>
         <tr>
            <td colspan="4">��д�������ݣ���û�У�����д</td>
         </tr>
         <tr>
            <td>����</td>
            <td>
               <e:text name="name" required="true" autofocus="true" defval="${dataMap.name }"/>
            </td>
            <td>������ѧ</td>
            <td>
               <e:text name="a601" required="true" defval="${dataMap.a601 }"/>
            </td>
         </tr>
         <tr>
            <td>�о�����</td>
            <td>
               <e:text name="a603" defval="${dataMap.a603 }"/>
            </td>
            <td>ְ��</td>
            <td>
               <e:select name="a604" value="����:1,������:2,��ʦ:3" defval="${dataMap.a604 }"/>
            </td>
         </tr>
         <tr>
            <td>���֤��</td>
            <td>
               <e:text name="a605" required="true" defval="${dataMap.a605 }"/>
            </td>
            <td>�ֻ�����</td>
            <td>
               <e:text name="a608" required="true" defval="${dataMap.a608 }"/>
            </td>
         </tr>
         <tr>
            <td>����</td>
            <td>
               <e:email name="a609" required="true" defval="${dataMap.a609 }"/>
            </td>
         </tr>
         <tr>
            <td colspan="4" align="center">
               <input type="submit" name="next" value="Excel��������"
                formaction="<%=path%>/secAddByExcel.html"
                formnovalidate="formnovalidate">
               <input type="submit" name="next" value="ȷ��${empty param.uid?'���':'�޸�'}"
                formaction="<%=path%>/sec${empty param.uid?'Add':'Modify'}.html">
               <button type="button" class="btn bg-default" onclick="history.back(-1);">���ص���һ����</button>
            </td>
         </tr>
      </table>
      <e:hidden name="uid" value="${param.uid }"/>
   </form>
   <div class="50pxHeightBlank">
      <div></div>
   </div>
   <form id="secQueryForm" class="secQueryForm" action="<%=path%>/secQuery.html" method="post">
      <!-- ���ݵ������� -->
      <table border="1">
         <caption>
                       �������
            <hr width="160">
         </caption>
         <tr>
            <td></td>
            <td>���</td>
            <td>����</td>
            <td>������ѧ</td>
            <td>�о�����</td>
            <td>ְ��</td>
            <td>���֤����</td>
            <td>�ֻ�����</td>
            <td>�ʼ�</td>
            <td></td>
         </tr>
	     <c:choose>
	        <c:when test="${dataList!=null }">
	        <!-- ��ʾ��ѯ�������� -->
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
				        <a href="#" onclick="onDel('${dataMap.uid}')">ɾ��</a>
				     </td>
	              </tr>
	           </c:forEach>
	              
	           <!-- ������� -->
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
	           <input type="submit" name="next" value="��ѯ" 
	           formaction="<%=path%>/secQuery.html">
               <input type="submit" id="del" name="next" value="����ɾ��"
               disabled="disabled" formaction="<%=path%>/secDel.html">
            </td>
	     </tr>
      </table>
   </form>
</body>
</html>