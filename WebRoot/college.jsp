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
	<script type="text/javascript" src="js/map_college.js"></script>
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
  
  <body  style="background-image:url('images/bg.jpg')" onload="generateMap('servlet/FindCollegeAction','map','normal');">
    <div style="position:relative;top:13px;"><h2 style="width:100%;text-align:center;font-size:40px;letter-spacing:25px"><font color=#ffffff>黑龙江普通高校分布情况</h2></font></div>
	<div id="barshow" style="float:left;width:30%;min-height:90%;"></div>
	<div id="map" style="max-width:70%;min-height:90%;margin:0px auto;"></div>
	<div id="search" style="width:980px;height:958px;top:87px;left:10px;position:absolute;display:none;">
		<div id="close" style="top:14px;left:-58px;position:absolute;width:980px;text-align:right;"><a href="javascript:hide()"><input type="button" value="关闭" style="width:55px;height:26px;font-size:14px;"/></a></div>
		<iframe id="iframe" name="layer_iframe" src=""
			scrolling="yes" height="100%" width="100%" frameborder="0"></iframe>
	</div>
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
                            data : ['总数','黑河','绥化','伊春','鸡西','双鸭山','鹤岗','七台河','大兴安岭','佳木斯','牡丹江','大庆','齐齐哈尔','哈尔滨'],
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
                            type : 'value'
                        }
                    ],
                    series : [
                        {
                            name:'高校数量',
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
			            		value:80,
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
					            		color:'rgba(255,105,180,1)'
					            	}
					            }
					        },
					        {
			            		value:1,
				            	itemStyle : { 
					            	normal: {
					            		color:'rgba(255,105,180,1)'
					            	}
					            }
					        },
					        {
			            		value:1,
				            	itemStyle : { 
					            	normal: {
					            		color:'rgba(255,105,180,1)'
					            	}
					            }
					        },
					        {
			            		value:1,
				            	itemStyle : { 
					            	normal: {
					            		color:'rgba(255,105,180,1)'
					            	}
					            }
					        },
					        {
			            		value:1,
				            	itemStyle : { 
					            	normal: {
					            		color:'rgba(255,105,180,1)'
					            	}
					            }
					        },
					        {
			            		value:1,
				            	itemStyle : { 
					            	normal: {
					            		color:'rgba(255,105,180,1)'
					            	}
					            }
					        },
					        {
			            		value:1,
				            	itemStyle : { 
					            	normal: {
					            		color:'rgba(255,105,180,1)'
					            	}
					            }
					        },
					        {
			            		value:1,
				            	itemStyle : { 
					            	normal: {
					            		color:'rgba(255,105,180,1)'
					            	}
					            }
					        },
					        {
			            		value:3,
				            	itemStyle : { 
					            	normal: {
					            		color:'rgba(255,255,0,1)'
					            	}
					            }
					        },
					        {
			            		value:4,
				            	itemStyle : { 
					            	normal: {
					            		color:'rgba(0,255,0,1)'
					            	}
					            }
					        },
					        {
			            		value:5,
				            	itemStyle : { 
					            	normal: {
					            		color:'rgba(0,0,255,1)'
					            	}
					            }
					        },
					        {
			            		value:5,
				            	itemStyle : { 
					            	normal: {
					            		color:'rgba(0,0,255,1)'
					            	}
					            }
					        },
					        {
			            		value:54,
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
