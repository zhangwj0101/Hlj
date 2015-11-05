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
	<script type="text/javascript" src="js/map_newzone.js"></script>
	<script type="text/javascript" src="citydata.json"></script>
	<script type="text/javascript" src="js/jquery-2.0.0.min.js"></script>
    <script type="text/javascript" src="js/jquery-ui.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script src="http://api.map.baidu.com/api?v=1.3" type="text/javascript"></script>
  </head>
  
  <body style="background-image:url('images/bg.jpg')"  onload="generateMap('servlet/FindNewZoneAction','map','big');">
    <div style="top:10px;"><h2 style="width:100%;text-align:center;font-size:40px;"><font color=#ffffff>黑龙江省高新区分布</h2></font></div>
	<div id="barshow" style="float:left;width:30%;min-height:90%;"></div>
	<div id="map" style="max-width:70%;min-height:90%;margin:0px auto;"></div>
	<div id="jump" style="top:10px;left:10px;position:absolute;"><a href="hlj_V2/cat/index.html"><input type="button" value="返回" style="width:70px;height:35px;font-size:18px;"/></a></div>
    <script src="build/dist/echarts.js"></script>
    <script type="text/javascript">
        // 路径配置
        require.config({
            paths: {
                echarts: 'build/dist'
            }
        });
        require(
            [
                'echarts',
                'echarts/chart/bar' // 使用柱状图就加载bar模块，按需加载
            ],
            function (ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('barshow')); 
                
                var option = {
				    tooltip : {
				        trigger: 'axis',
				        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
				            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
				        }
				    },
				    backgroundColor:'rgba(255,255,255,1)',
				    yAxis : [
				        {
				            type : 'category',
				            splitLine: {show:false},
				            data : ['佳木斯（省级）','牡丹江（省级）','大庆（国家级）','齐齐哈尔（国家级）','哈尔滨（国家级）'],
				            axisLabel:{
                            	interval:0,
                            	textStyle:{
	                            	fontSize: 20,
	                            	fontWeight: 'bolder'
	                            }
                            }
				        }
				    ],
				    grid:{
                    	y:50,
                    	x:200
                    },
				    xAxis : [
				        {
				            type : 'value',
				            axisLabel:{
                            	interval:0,
                            	textStyle:{
	                            	fontSize: 20,
	                            	fontWeight: 'bolder'
	                            }
                            }
				        }
				    ],
				    series : [
				        {
				            name:'科技园',
				            type:'bar',
				            stack: '总量',
				            barWidth:40,
				            data:[
				            	{
				            		value:1,
					            	itemStyle : { 
						            	normal: {
						            		label : {
						            			show: true,
						            			position: 'inside'
						            		},
						            		color:'blue'
						            	}
						            }
						        },
						        {
				            		value:1,
					            	itemStyle : { 
						            	normal: {
						            		label : {
						            			show: true,
						            			position: 'inside'
						            		},
						            		color:'blue'
						            	}
						            }
						        },
						        {
				            		value:1,
					            	itemStyle : { 
						            	normal: {
						            		label : {
						            			show: true,
						            			position: 'inside'
						            		},
						            		color:'red'
						            	}
						            }
						        },
						        {
				            		value:1,
					            	itemStyle : { 
						            	normal: {
						            		label : {
						            			show: true,
						            			position: 'inside'
						            		},
						            		color:'red'
						            	}
						            }
						        },
						        {
				            		value:1,
					            	itemStyle : { 
						            	normal: {
						            		label : {
						            			show: true,
						            			position: 'inside'
						            		},
						            		color:'red'
						            	}
						            }
						        }
				            ]
				        }
				    ]
				};
                myChart.setOption(option);
                myChart.on('click', function (param) {
                });
                window.onresize = myChart.resize;
            }
        );
    </script>
  </body>
</html>
