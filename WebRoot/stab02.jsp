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
      // 基于准备好的dom，初始化echarts实例
      var myChart = echarts.init(document.getElementById('b202'));

      // 指定图表的配置项和数据
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
  		            name: '检查结果',
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

      // 使用刚指定的配置项和数据显示图表。
      myChart.setOption(option);
    </script>
</body>
</html>