<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%-- <%@ taglib uri= "http://java.sun.com/jsp/jstl/core"  prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
 --%>
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
	
	<link rel="stylesheet" type="text/css" href="css/union.css" />
	<script type="text/javascript" src="js/jq.js"></script>
	<script type="text/javascript" src="js/map.js"></script>
	<script type="text/javascript" src="citydata.json"></script>
	<script type="text/javascript" src="js/jquery-2.0.0.min.js"></script>
    <script type="text/javascript" src="js/jquery-ui.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script src="http://api.map.baidu.com/api?v=1.3" type="text/javascript"></script>

	<script type="text/javascript">
       $(function() {
		/* For zebra striping */
        $("table tr:nth-child(odd)").addClass("odd-row");
		/* For cell text alignment */
		$("table td:first-child, table th:first-child").addClass("first");
		/* For removing the last border */
		$("table td:last-child, table th:last-child").addClass("last");
     });
    </script>
  </head>
  
  <body style="background-image:url('images/bg.jpg')" >
    
    <form  id="unionform" method="post" action="servlet/FindUnionItemsAction" >
     <input type="hidden"  id="itemid"  name="itemid"  value="" />
	</form>
    
    <div style="top:10px;"><h2 style="width:100%;text-align:center;font-size:40px;"><font color=#ffffff>黑龙江省产业技术创新战略联盟</h2></font></div>
	<div id="barshow" style="overflow:auto;position:absolute;left:20px;width:30%;height:90%;"></div>
	<div id="map" style="overflow:auto;position:absolute;left:590px;width:68%;height:90%;margin:0px auto;text-align:center"></div>
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
                'echarts/chart/bar', // 使用柱状图就加载bar模块，按需加载
                'echarts/chart/wordCloud'
            ],
            function(ec){
            	barshow(ec);
            	map(ec);
            }
            
        );
        function barshow(ec) {
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
			            axisLabel:{
                        	interval:0,
                           	textStyle:{
                            	fontSize: 20,
                            	fontWeight: 'bolder'
                            }
                        },
                        data : ['航空航天\n技术','新能源及\n节能技术','资源与环境\n技术','新医药\n技术','电子信息\n技术','先进制造\n技术','新材料\n技术','生物技术']
			        }
			    ],
			    grid:{
                   	y:50,
                   	x:120,
                   	x2:20
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
			            name:'特色产业基地',
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
			            		color:'rgba(60,179,113,0.9)'
			            	}
			            },
			            data:['1','2','2','3','4','7','8','16']
			        }
			    ]
			};
            myChart.setOption(option);
            myChart.on('click', function (param) {
            	 document.getElementById("itemid").value=param.dataIndex;
            	 $("#map").css('right','150px');
            	 $("#map").load('servlet/FindUnionItemsAction',{itemid:param.dataIndex});
            });
            window.onresize = myChart.resize;
        }
        function map(ec){
           	var myChart = ec.init(document.getElementById('map')); 
               
            var option = {
			    tooltip : {
			        show:true
			    },
			    backgroundColor:'rgba(255,255,255,1)',
			    series: [{
			        type: 'wordCloud',
			        size: ['80%', '80%'],
			        textRotation : [0, 0],
			        textPadding: 0,
			        autoSize: {
			            enable: true,
			            minSize: 14
			        },
			        data: ${data_union}
			    }]
			};
	        myChart.setOption(option);
	        myChart.on('click', function (param) {
	        });
	        window.onresize = myChart.resize;
	    }
	    function createRandomItemStyle() {
		    return {
		        normal: {
		            color: 'rgb(' + [
		                Math.round(Math.random() * 160),
		                Math.round(Math.random() * 160),
		                Math.round(Math.random() * 160)
		            ].join(',') + ')'
		        }
		    };
		}
    </script>
  </body>
</html>
