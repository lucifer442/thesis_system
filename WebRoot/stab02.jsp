<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script src="js/echarts.min.js"></script>
</head>
<body>
	<div id="b202" style="width: 600px; height: 400px;"></div>
	<script type="text/javascript">
      // ����׼���õ�dom����ʼ��echartsʵ��
      var myChart = echarts.init(document.getElementById('b202'));

      // ָ��ͼ��������������
      var option = {
    		  tooltip: {
  		        trigger: 'item',
  		        formatter: "{a} <br/>{b}: {c} ({d}%)"
  		    },
  		    legend: {
  		        orient: 'vertical',
  		        x: 'left',
  		        data:[
	                      <c:forEach items="${b202List}" var="U">
	                      "${U.b202}",
	                      </c:forEach>
  		        ]
  		    },
  		  series : [
  		        {
  		            name: '�����',
  		            type: 'pie',
  		            radius: '55%',
  		            data:[
  	                      <c:forEach items="${b202List}" var="U">
  	                      {value:<fmt:parseNumber type="number" value="${U.count}" />,name:"${U.b202}"},
  	                      </c:forEach>
  		            ]
  		        }
  		    ]
      };

      // ʹ�ø�ָ�����������������ʾͼ��
      myChart.setOption(option);
    </script>
</body>
</html>