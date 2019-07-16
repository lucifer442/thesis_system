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
	<div id="b107" style="width: 400px; height: 400px;"></div>
	<div id="b108" style="width: 400px; height: 400px;"></div>
	<div id="b109" style="width: 400px; height: 400px;"></div>
	
	<script type="text/javascript">
      // ����׼���õ�dom����ʼ��echartsʵ��
      var myChart = echarts.init(document.getElementById('b107'));

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
	                      <c:forEach items="${b107List}" var="U">
	                      "${U.b107}",
	                      </c:forEach>
    		        ]
    		    },
    		  series : [
    		        {
    		            name: '�����',
    		            type: 'pie',
    		            radius: '55%',
    		            data:[
    	                      <c:forEach items="${b107List}" var="U">
    	                      {value:<fmt:parseNumber type="number" value="${U.count}" />,name:"${U.b107}"},
    	                      </c:forEach>
    		            ]
    		        }
    		    ]
      };

      // ʹ�ø�ָ�����������������ʾͼ��
      myChart.setOption(option);
    </script>

	<script type="text/javascript">
      // ����׼���õ�dom����ʼ��echartsʵ��
      var myChart = echarts.init(document.getElementById('b108'));

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
	                      <c:forEach items="${b108List}" var="U">
	                      "${U.b108}",
	                      </c:forEach>
  		        ]
  		    },
  		  series : [
  		        {
  		            name: '�����',
  		            type: 'pie',
  		            radius: '55%',
  		            data:[
  	                      <c:forEach items="${b108List}" var="U">
  	                      {value:<fmt:parseNumber type="number" value="${U.count}" />,name:"${U.b108}"},
  	                      </c:forEach>
  		            ]
  		        }
  		    ]
      };

      // ʹ�ø�ָ�����������������ʾͼ��
      myChart.setOption(option);
    </script>

	<script type="text/javascript">
      // ����׼���õ�dom����ʼ��echartsʵ��
      var myChart = echarts.init(document.getElementById('b109'));

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
	                      <c:forEach items="${b109List}" var="U">
	                      "${U.b109}",
	                      </c:forEach>
  		        ]
  		    },
  		  series : [
  		        {
  		            name: '�����',
  		            type: 'pie',
  		            radius: '55%',
  		            data:[
  	                      <c:forEach items="${b109List}" var="U">
  	                      {value:<fmt:parseNumber type="number" value="${U.count}" />,name:"${U.b109}"},
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