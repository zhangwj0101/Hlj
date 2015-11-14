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
	<script type="text/javascript" src="js/map_engineeringcenter.js"></script>
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
  
  <body style="background-image:url('images/bg.jpg')"  onload="generateMap('servlet/FindEngineeringCenterAction','map','normal','');">
    <div style="position:relative;top:13px;"><h2 style="width:100%;text-align:center;font-size:40px;letter-spacing:25px"><font color=#ffffff>黑龙江省工程技术研究中心分布情况</h2></font></div>
	<div id="barshow" style="position:absolute;top:80px;float:left;width:576px;height:950px;"></div>
	<div id="map" style="position:absolute;top:80px;left:576px;width:1344px;height:950px;margin:0px auto;"></div>
	<a href="hlj_V2/cat/index.html" class="fanhui">返回</a>
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
				            data : ['行政机构','高校','研究所','企业'],
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
                    	x:100
                    },
				    xAxis : [
				        {
				            type : 'log',
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
				            itemStyle : { 
				            	normal: {
				            		label : {
				            			show: true,
				            			position: 'inside',
				            			textStyle:{
				            				fontSize:20,
				            				fontWeight:'bolder'
				            			}
				            		},
				            		color:'rgba(255,106,106,0.8)'
				            	}
				            },
				            barWidth:80,
				            data:[
				            	{
				            		value:2,
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
				            		value:13,
					            	itemStyle : { 
						            	normal: {
						            		label : {
						            			show: true,
						            			position: 'inside'
						            		},
						            		color:'green'
						            	}
						            }
						        },
						        {
				            		value:45,
					            	itemStyle : { 
						            	normal: {
						            		label : {
						            			show: true,
						            			position: 'inside'
						            		},
						            		color:'orange'
						            	}
						            }
						        },
						        {
				            		value:208,
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
				            ],
				        }
				    ]
				};
                myChart.setOption(option);
                myChart.on('click', function (param) {
                	generateMap('servlet/FindEngineeringCenterAction','map','normal',param.name);
                });
                window.onresize = myChart.resize;
            }
        );
    </script>
  </body>
</html>
