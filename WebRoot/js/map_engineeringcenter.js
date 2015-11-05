var map;

function generateMap(url,div_id,size,category) {
	$.ajax({
		type : "post",
		async : true, // 是否异步加载数据
		url : url,
		data:{category:category},
		dataType : "json",// 预期服务器返回的数据类型
		success : function(data) {
			initMap(data,div_id,size);
		}
	});

}

// 绘制地图
function initMap(collegeList, div_id,size) {
	var defaultZoom = 7;
	var mapOptions = {
		minZoom : 5,
		enableHighResolution : true
	};
	map = new BMap.Map(div_id, mapOptions); // 创建Map实例
	map.centerAndZoom(new BMap.Point(127.95, 48.69), defaultZoom); // 初始化地图,设置中心点坐标和地图级别
	map.addControl(new BMap.MapTypeControl({mapTypes : [BMAP_NORMAL_MAP, BMAP_SATELLITE_MAP, BMAP_HYBRID_MAP]})); // 添加地图类型控件
	map.enableScrollWheelZoom(true); // 开启鼠标滚轮缩放

	$('#'+div_id).on('mousewheel', function(e) {
				e.preventDefault();
			});

	getBoundary();// 圈出黑龙江省

	// 添加控件和比例尺
	// 左上角，添加比例尺
	var bottom_left_control = new BMap.ScaleControl({
				anchor : BMAP_ANCHOR_BOTTOM_LEFT,
				offset : new BMap.Size(20, 30)
			});
	// 左上角，添加默认缩放平移控件
	var top_left_navigation = new BMap.NavigationControl({
				anchor : BMAP_ANCHOR_TOP_LEFT
			});
	map.addControl(bottom_left_control);
	map.addControl(top_left_navigation);

	// 信息窗口样式
	var opts = {
		width : 400, // 信息窗口宽度
		height : 300, // 信息窗口高度
		offset : new BMap.Size(0, -20)
		// 信息窗口偏移量
	}

	addMarkers(collegeList);

	function addMarkers(collegeList) {
		var icon_blue = new BMap.Icon("images/marker_blue.png", new BMap.Size(23, 25), {anchor:new BMap.Size(10,25)});
		var icon_orange = new BMap.Icon("images/marker_orange.png", new BMap.Size(23, 25), {anchor:new BMap.Size(10,25)});
		var icon_green = new BMap.Icon("images/marker_green.png", new BMap.Size(23, 25), {anchor:new BMap.Size(10,25)});
		console.log(collegeList);
		for (var i = 0, length = collegeList.length; i < length; i++) {
			var point = new BMap.Point(collegeList[i].y, collegeList[i].x);
			point.name = collegeList[i].name;
			var marker = new BMap.Marker(point, {
						title : collegeList[i].name
					});
			if (collegeList[i].category == "行政机构")
				marker.setIcon(icon_blue);
			else if (collegeList[i].category == "高校")
				marker.setIcon(icon_green);
			else if (collegeList[i].category == "研究所")
				marker.setIcon(icon_orange);
			openInfoWindow(marker, collegeList[i]);
			map.addOverlay(marker);
		}
	}

	// 地图标记增加点击事件监听
	function openInfoWindow(marker, college) {
		marker.addEventListener("click", function(e) {
			// 弹出信息窗口
			var content = "<strong><font size='6px'><a href='javascript:searchshow(\""+college.link+"\")'>" + college.name + "</a></strong>";
			if(college.description!=null){
				content+="</br><br/>简介："+college.description;
			}
			if(college.orgname!=null){
				content+="</br><br/>依托单位："+college.orgname;
			}
			if(college.level!=null){
				content+="<br/><br/>级别："+college.level;
			}
			content+="</font></strong>";
			var infoWindow = new BMap.InfoWindow(content, opts);
			map.openInfoWindow(infoWindow, marker.point);
		});
	}

}
function searchshow(link){
	$("#iframe").attr("src", link);
	$("#search").show();
}
function getBoundary() {
	for (var j = 0; j < cityData.provinces.length; j++) {
		if (cityData.provinces[j].n == "黑龙江省") {
			var paths = [];
			var latLng = "";
			var list = cityData.provinces[j].b.split(";");
			var k = 0;
			for (var i = 0; i < list.length; i++) {
				latLng = list[i].split(",");
				var lat = latLng[1];
				var lng = latLng[0];
				paths[k++] = new BMap.Point(lng, lat);
			}
			var ply = new BMap.Polygon(paths, {
						strokeWeight : 2,
						strokeColor : "#ff0000",
						fillColor : "#ff0000",
						fillOpacity : 0.01
					}); // 建立多边形覆盖物
			map.addOverlay(ply); // 添加覆盖物
		}
	}
}