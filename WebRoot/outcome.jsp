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
    <h2 style="width:100%;text-align:center;font-size:36px;background:#e0e0e0;">黑龙江省成果奖励统计</h2>
	<div id="barshow" style="float:left;width:960px;min-height:88%;"></div>
	<div id="map" style="left:960px;position:absolute;width:960px;min-height:88%;margin:0px auto;"></div>
	<a href="hlj_V2/cat/index.html" class="fanhui">返回</a>
	<div style="position: absolute; top: 1020px; left: 112px;"><span style="font-size: 32px;font-weight: bold;">2010年-2014年黑龙江省高新技术成果领域分布情况</span></div>
	<div style="position: absolute; top: 1020px; right: 177px;"><span style="font-size: 32px;font-weight: bold;">2010年-2014年黑龙江省科技成果奖励情况</span></div>
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
            function(ec){
            	area(ec);
            	year(ec);
            }
        );
        function area(ec) {
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
				            data : ['生物技术','高新技术改造传统产业','电子信息技术','新医药技术','新材料技术','新能源及节能技术','资源与环境技术','高技术服务员','航空航天技术'],
				            axisLabel:{
                            	interval:0,
                            	textStyle:{
	                            	fontSize: 15,
	                            	fontWeight: 'bolder'
	                            }
                            }
				        }
				    ],
				    grid:{
                    	y:50,
                    	x:170
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
				            name:'领域',
				            type:'bar',
				            stack: '总量',
				            itemStyle : { 
				            	normal: {
				            		label : {
				            			show: true,
				            			position: 'inside'
				            		},
				            		color:'rgba(123,104,238,0.8)'
				            	}
				            },
				            data:[1781,652,647,516,500,362,349,240,32],
				        }
				    ]
				};
                myChart.setOption(option);
                myChart.on('click', function (param) {
                });
                window.onresize = myChart.resize;
            }
            function year(ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('map')); 
                
                var option = {
				    tooltip : {
				        trigger: 'axis',
				        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
				            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
				        }
				    },
				    legend:{
				    	data:['国家级','省级'],
				    	textStyle:{
				    		fontSize:18
				    	}
				    },
				    xAxis : [
				        {
				            type : 'category',
				            splitLine: {show:false},
				            data : ['2011年','2012年','2013年','2014年'],
				            axisLabel:{
                            	interval:0,
                            	textStyle:{
	                            	fontSize: 15,
	                            	fontWeight: 'bolder'
	                            }
                            }
				        }
				    ],
				    grid:{
                    	y:50,
                    	x:100
                    },
				    yAxis : [
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
				            name:'国家级',
				            type:'bar',
				            itemStyle : { 
				            	normal: {
				            		label : {
				            			show: true,
				            			position: 'inside'
				            		},
				            	}
				            },
				            data:[13,17,10,22],
				        },
				        {
				            name:'省级',
				            type:'bar',
				            itemStyle : { 
				            	normal: {
				            		label : {
				            			show: true,
				            			position: 'inside'
				            		},
				            	}
				            },
				            data:[273,279,289,271],
				        }
				    ]
				};
                myChart.setOption(option);
                myChart.on('click', function (param) {
                });
                window.onresize = myChart.resize;
            }
    </script>
  </body>
</html>
