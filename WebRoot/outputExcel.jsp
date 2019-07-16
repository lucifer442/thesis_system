<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="menu.jsp"%>
<html>
<head>
   <title>导出财务报表</title>
   <style type="text/css">
   body 
{
	margin: 0 auto;
	width: 100%;
	height: 100%;
	min-width: 1536px;
	min-height: 720px;
	/*background: #edf5dc;*/
	background:#C89C52
}

form
{
	margin:auto;
	width: 95%;
    border-radius: 5px;
}

table
{
	background:#CCCCCC;
	border-radius:10px;
    margin: auto;
}

caption
{
	text-align: center;
}

tr
{
    border:midnightblue;
}

td
{
	text-align: center;
	min-width: 120px;
	height: 25px;
}

div
{
	min-height: 50px;
}

.ShortHR
{
	width: 160px;
}

.secAddForm
{
	width: 65%;
}

.secQueryForm
{
	width: 95%;
}

.50pxHeightBlank
{
	height:50px;
}
   </style>
</head>
<body>
${msg }
   <br>
   <br>
   <form id="outputExcelForm" class="outputExcelForm" method="post">
      <table border="1">
         <tr>
            <td>
               <input type="submit" name="next" value="导出财务报表excel"
                formaction="<%=path%>/financialExcel.xls"> 
               <input type="submit" name="next" value="导出校内专家财务报表"
                formaction="<%=path%>/financialExcelForInner.xls">
               <input type="submit" name="next" value="导出校外专家财务报表"
                formaction="<%=path%>/financialExcelForOuter.xls">
            </td>
         </tr>
      </table>
   </form>
</body>
</html>