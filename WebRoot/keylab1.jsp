<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/jq.js"></script>
	<script type="text/javascript" src="js/map.js"></script>
	<script type="text/javascript" src="citydata.json"></script>
	<script type="text/javascript" src="js/jquery-2.0.0.min.js"></script>
    <script type="text/javascript" src="js/jquery-ui.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="JSClass/FusionCharts.js"></script>
	<script src="http://api.map.baidu.com/api?v=1.3" type="text/javascript"></script>
	<style type="text/css">
		 .fanhui{
	        z-index: 10;
            position:absolute;
            top: 10px;
            left: 10px;
            background-color:#F90;
            border-radius: 5px;
            font-size: 28;
            text-decoration: none;
            padding:10px 40px;
            box-shadow: 1px 1px 1px 1px;
            font-weight: 800;
            font-family: microsoft yahei;
            color:#fff;

	    }
	</style>
  </head>
  
  <body  style="background-image:url('images/bg.jpg')" >
    <div style="position:relative;top:13px;"><h2 style="width:100%;text-align:center;font-size:40px;letter-spacing:25px;"><font color=#ffffff>黑龙江省重点实验室情况</h2></font></div>
	<div id="barshow" style="float:left;width:100%;min-height:93%;text-align:center;"></div>
	<a href="hlj_V2/cat/index.html" class="fanhui">返回</a>
   	<div style="position: absolute; top: 1020px; right: 673px;"><span style="font-size: 32px;font-weight: bold;"><font color=#ffffff>2010-2013年黑龙江省重点实验室统计</font></span></div>
	<script type="text/javascript">
        var myChart = new FusionCharts("Charts/MSColumn3D.swf","pie01","1880","900");
		myChart.setDataURL("data/keylab.xml"); 
		myChart.render("barshow");
    </script>
  </body>
</html>
