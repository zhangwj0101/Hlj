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
	<script type="text/javascript" src="js/map_agricultural.js"></script>
	<script type="text/javascript" src="citydata.json"></script>
	<script type="text/javascript" src="js/jquery-2.0.0.min.js"></script>
    <script type="text/javascript" src="js/jquery-ui.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script src="http://api.map.baidu.com/api?v=1.3" type="text/javascript"></script>
  </head>
  
  <body style="background-image:url('images/bg.jpg')"  onload="generateMap('servlet/FindAgriculturalAction','map','normal');">
    <div style="position:relative;top:13px;"><h2 style="width:100%;text-align:center;font-size:40px;letter-spacing:25px;"><font color=#ffffff>黑龙江省农业科技园区分布情况</h2></font></div>
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
				            data : ['大兴安岭','鹤岗','伊春','双鸭山','鸡西','佳木斯','牡丹江','哈尔滨','大庆','齐齐哈尔','绥化','黑河'],
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
				            name:'农业科技园',
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
				            		color:'rgba(150,255,255,1)'
				            	},
				            	emphasis:{
                                    color:'rgba(255,222,173,1)'
                                }
				            },
				            data:[
				            	{
				            		value:1,
					            	itemStyle : { 
						            	normal: {
						            		label : {
						            			show: true,
						            			position: 'inside'
						            		},
						            		color:'rgba(255,105,180,1)'
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
						            		color:'rgba(255,105,180,1)'
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
						            		color:'rgba(255,105,180,1)'
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
						            		color:'rgba(255,105,180,1)'
						            	}
						            }
						        },
						        {
				            		value:3,
					            	itemStyle : { 
						            	normal: {
						            		label : {
						            			show: true,
						            			position: 'inside'
						            		},
						            		color:'rgba(0,0,200,1)'
						            	}
						            }
						        },
						        {
				            		value:3,
					            	itemStyle : { 
						            	normal: {
						            		label : {
						            			show: true,
						            			position: 'inside'
						            		},
						            		color:'rgba(0,0,200,1)'
						            	}
						            }
						        },
						        {
				            		value:4,
					            	itemStyle : { 
						            	normal: {
						            		label : {
						            			show: true,
						            			position: 'inside'
						            		},
						            		color:'rgba(0,200,0,1)'
						            	}
						            }
						        },
						        {
				            		value:4,
					            	itemStyle : { 
						            	normal: {
						            		label : {
						            			show: true,
						            			position: 'inside'
						            		},
						            		color:'rgba(0,200,0,1)'
						            	}
						            }
						        },
						        {
				            		value:4,
					            	itemStyle : { 
						            	normal: {
						            		label : {
						            			show: true,
						            			position: 'inside'
						            		},
						            		color:'rgba(0,200,0,1)'
						            	}
						            }
						        },
						        {
				            		value:5,
					            	itemStyle : { 
						            	normal: {
						            		label : {
						            			show: true,
						            			position: 'inside'
						            		},
						            		color:'rgba(255,0,0,1)'
						            	}
						            }
						        },
						        {
				            		value:5,
					            	itemStyle : { 
						            	normal: {
						            		label : {
						            			show: true,
						            			position: 'inside'
						            		},
						            		color:'rgba(255,0,0,1)'
						            	}
						            }
						        },
						        {
				            		value:5,
					            	itemStyle : { 
						            	normal: {
						            		label : {
						            			show: true,
						            			position: 'inside'
						            		},
						            		color:'rgba(255,0,0,1)'
						            	}
						            }
						        }
				            ],
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
