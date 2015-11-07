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
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.3"></script>
	<script type="text/javascript" src="JSClass/FusionCharts.js"></script>
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
    <div style="position:relative;top:13px;"><h2 style="width:100%;text-align:center;font-size:40px;letter-spacing:25px;"><font color=#ffffff>黑龙江省成果奖励统计</h2></font></div>
	<div id="barshow" style="position:absolute;left:60px;top:120px;float:left;width:950px;min-height:950px"></div>
	<div id="map" style="left:960px;top:120px;position:absolute;width:960px;height:870px;margin:0px auto;display:"></div>
	<div id="map1" style="left:960px;top:120px;position:absolute;width:960px;height:870px;margin:0px auto;display:none;"></div>
	<a href="hlj_V2/cat/index.html" class="fanhui">返回</a>
	<div id="level1" style="top:60px;left:1400px;position:absolute;"><a href="javascript:show(2);"><input type="button" value="国家级" style="width:70px;height:35px;font-size:18px;"/></a></div>
	<div id="level2" style="top:60px;left:1500px;position:absolute;"><a href="javascript:show(1);"><input type="button" value="省级" style="width:70px;height:35px;font-size:18px;"/></a></div>
	<div style="position: absolute; top: 1020px; left: 112px;"><span style="font-size: 32px;font-weight: bold;">2010年-2014年黑龙江省高新技术成果领域分布情况</span></div>
	<div style="position: absolute; top: 1020px; right: 177px;"><span style="font-size: 32px;font-weight: bold;">2010年-2014年黑龙江省科技成果奖励情况</span></div>
    <script type="text/javascript">
    	var myChart = new FusionCharts("Charts/Pie3D.swf","pie01","900","870");
    	myChart.setDataXML("<graph baseFontSize='20' xAxisName='类别' yAxisName='数量' formatNumberScale='0'>"+
    	"<set name='航空航天技术' value='32' color='AFD8F8' />"+
    	"<set name='高技术服务业' value='240' color='F6BD0F' />"+
		"<set name='资源与环境技术' value='349' color='8BBA00' />"+
		"<set name='新能源节能技术' value='362' color='FF8E46' />"+
		"<set name='新材料技术' value='500' color='008E8E' />"+
		"<set name='新医药技术' value='516' color='D64646' />"+
		"<set name='电子信息技术' value='647' color='8E468E' />"+
		"<set name='高新技术改造传统业' value='652' color='588526' />"+
		"<set name='生物技术' value='1781' color='B3AA00' />"+"</graph>"); 
    	myChart.render("barshow");
		var myChart1 = new FusionCharts("Charts/Column3D.swf","bar01","900","870");
		myChart1.setDataXML("<graph caption='黑龙江省（国家级）科技成果奖励情况'  baseFontSize='20' xAxisName='年份' yAxisName='数量' canvasBgColor='FFFFFF' formatNumberScale='0' canvasBgAlpha='0'>"+
    	"<set name='2011年' value='13' color='AFD8F8' />"+
    	"<set name='2012年' value='17' color='F6BD0F' />"+
		"<set name='2013年' value='10' color='8BBA00' />"+
		"<set name='2014年' value='22' color='B3AA00' />"+"</graph>"); 
    	myChart1.render("map");
    	var myChart2 = new FusionCharts("Charts/Column3D.swf","bar02","900","870");
		myChart2.setDataXML("<graph caption='黑龙江省（省级）科技成果奖励情况' baseFontSize='20' xAxisName='年份' yAxisName='数量' canvasBgColor='FFFFFF' formatNumberScale='0' canvasBgAlpha='0'>"+
    	"<set name='2011年' value='273' color='AFD8F8' />"+
    	"<set name='2012年' value='279' color='F6BD0F' />"+
		"<set name='2013年' value='289' color='8BBA00' />"+
		"<set name='2014年' value='271' color='B3AA00' />"+"</graph>"); 
    	myChart2.render("map1");
    	function show(id){
    		if(id==1){
    			document.getElementById('map').style.display='none';
    			document.getElementById('map1').style.display='';
    		}else{
    			document.getElementById('map1').style.display='none';
    			document.getElementById('map').style.display='';
    		}
    	}
    </script>
  </body>
</html>
