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
	<script type="text/javascript" src="js/map_researchorg.js"></script>
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
  
  <body style="background-image:url('images/bg.jpg')"  onload="generateMap('servlet/FindResearchOrgAction','map','small');">
    <div style="position:relative;top:13px;"><h2 style="width:100%;text-align:center;font-size:40px;letter-spacing:25px;"><font color=#ffffff>黑龙江省科研院所分布情况</h2></font></div>
	<div id="barshow" style="float:left;width:576px;height:950px;position:absolute;top:80px;"></div>
	<div id="map" style="position:absolute;top:80px;left:576px;width:1344px;height:950px;;margin:0px auto;"></div>
	<a href="hlj_V2/cat/index.html" class="fanhui">返回</a>
    <div id="search" style="z-index:10000;width:980px;height:950px;top:80px;left:5px;position:absolute;display:none;">
		<div id="close" style="top:14px;left:-58px;position:absolute;width:980px;text-align:right;"><a href="javascript:hide()"><input type="button" value="关闭" style="width:55px;height:26px;font-size:14px;"/></a></div>
		<iframe id="iframe" name="layer_iframe" src=""
			scrolling="yes" height="100%" width="100%" frameborder="0"></iframe>
	</div>
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
	                /* title: {
	                    textStyle:{
	                        fontSize:30,
	                    },
	                    x:'center'
	                }, */
	                tooltip : {
	                    trigger: 'axis',
	                    axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	                        type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	                    },
	                    formatter: function (params) {
	                        var tar = params[0];
	                        return tar.name + '<br/>' + tar.seriesName + ' : ' + tar.value;
	                    }
	                },
	                backgroundColor:'rgba(255,255,255,1)',
	                grid:{
	                	y:50,
	                	x:100
	                },
	                yAxis : [
	                    {
	                        type : 'category',
	                        splitLine: {show:false},
	                        data : ['总数','七台河','伊春','鸡西','双鸭山','鹤岗','绥化','大庆','黑河','牡丹江','齐齐哈尔','佳木斯','哈尔滨'],
	                        axisLabel:{
	                        	interval:0,
	                        	textStyle:{
	                            	fontSize: 20,
	                            	fontWeight: 'bolder'
	                            }
	                        },
	                    }
	                ],
	                xAxis : [
	                    {
	                        type : 'log'
	                    }
	                ],
	                series : [
	                    {
	                        name:'研究院所数量',
	                        type:'bar',
	                        stack: '总量',
	                        itemStyle : { 
	                        	normal: {
	                        		label : {
	                        			show: true, 
	                        			position: 'right',
	                        			textStyle:{
			                            	fontSize: 20,
			                            	fontWeight: 'bolder'
			                            }
	                        		}
	                        	}
	                        },
	                        data:[
	                        {
			            		value:226,
				            	itemStyle : { 
					            	normal: {
					            		color:'rgba(0,191,255,1)'
					            	}
					            }
					        },
					        {
			            		value:1,
				            	itemStyle : { 
					            	normal: {
					            		color:'rgba(0,200,0,1)'
					            	}
					            }
					        },
					        {
			            		value:5,
				            	itemStyle : { 
					            	normal: {
					            		color:'rgba(0,200,0,1)'
					            	}
					            }
					        },
					        {
			            		value:5,
				            	itemStyle : { 
					            	normal: {
					            		color:'rgba(0,200,0,1)'
					            	}
					            }
					        },
					        {
			            		value:5,
				            	itemStyle : { 
					            	normal: {
					            		color:'rgba(0,200,0,1)'
					            	}
					            }
					        },
					        {
			            		value:6,
				            	itemStyle : { 
					            	normal: {
					            		color:'rgba(0,200,0,1)'
					            	}
					            }
					        },
					        {
			            		value:7,
				            	itemStyle : { 
					            	normal: {
					            		color:'rgba(0,200,0,1)'
					            	}
					            }
					        },
					        {
			            		value:8,
				            	itemStyle : { 
					            	normal: {
					            		color:'rgba(0,200,0,1)'
					            	}
					            }
					        },
					        {
			            		value:10,
				            	itemStyle : { 
					            	normal: {
					            		color:'rgba(0,0,255,1)'
					            	}
					            }
					        },
					        {
			            		value:12,
				            	itemStyle : { 
					            	normal: {
					            		color:'rgba(0,0,255,1)'
					            	}
					            }
					        },
					        {
			            		value:14,
				            	itemStyle : { 
					            	normal: {
					            		color:'rgba(0,0,255,1)'
					            	}
					            }
					        },
					        {
			            		value:14,
				            	itemStyle : { 
					            	normal: {
					            		color:'rgba(0,0,255,1)'
					            	}
					            }
					        },
					        {
			            		value:139,
				            	itemStyle : { 
					            	normal: {
					            		color:'rgba(255,0,0,1)'
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
        function hide(){
        	$("#search").hide();
        }
    </script>
  </body>
</html>
