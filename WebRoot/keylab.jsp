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
  </head>
  
  <body  style="background-image:url('images/bg.jpg')" >
    <div style="top:10px;"><h2 style="width:100%;text-align:center;font-size:40px;"><font color=#ffffff>黑龙江省重点实验室统计</h2></font></div>
	<div id="barshow" style="float:left;width:98%;min-height:90%;"></div>
	<div id="jump" style="top:10px;left:10px;position:absolute;"><a href="hlj_V2/cat/index.html"><input type="button" value="返回" style="width:70px;height:35px;font-size:18px;"/></a></div>
    <script src="build/dist/echarts.js"></script>
    <script type="text/javascript">
        // 路径配置
        require.config({
            paths: {
                echarts: 'http://echarts.baidu.com/build/dist'
            }
        });
        require(
            [
                'echarts',
                'echarts/chart/line', // 使用柱状图就加载bar模块，按需加载
                'echarts/chart/bar'
            ],
            function (ec){
            	all(ec);
            }
        );
        function all(ec) {
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
				    legend:{
				    	data:['全部','国家级','省级'],
				    	textStyle:{
				    		fontSize:40,
				    		fontWeight:'bolder'
				    	}
				    },
				    xAxis : [
				        {
				            type : 'category',
				            splitLine: {show:false},
				            data : ['高校','研究所','企业','行政机构'],
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
				            name:'全部',
				            type:'bar',
				            itemStyle : { 
				            	normal: {
				            		label : {
				            			show: true,
				            			position: 'top',
				            			textStyle:{
				            				fontSize:20
				            			}
				            		}
				            	}
				            },
				            barMaxWidth:80,
				            data:[51,34,10,2]
				        },
				        {
				            name:'国家级',
				            type:'bar',
				            itemStyle : { 
				            	normal: {
				            		label : {
				            			show: true,
				            			position: 'top',
				            			textStyle:{
				            				fontSize:20
				            			}
				            		}
				            	}
				            },
				            barMaxWidth:80,
				            data:[7,2,0,0]
				        },
				        {
				            name:'省级',
				            type:'bar',
				            itemStyle : { 
				            	normal: {
				            		label : {
				            			show: true,
				            			position: 'top',
				            			textStyle:{
				            				fontSize:20
				            			}
				            		}
				            	}
				            },
				            barMaxWidth:80,
				            data:[44,32,10,2]
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
