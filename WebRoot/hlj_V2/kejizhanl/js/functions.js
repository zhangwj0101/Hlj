jQuery(function() {

	new Nex({

		thumbnails       : true, // true || false
		bullets          : true,  // true || false
		bar              : false, // true || false
		load_bar         : true, // true || false

		data             : [

			{
				display     : "image", // image, map, video
				title       : "Nex", // image title
				description : "Speed Optimized", // image description
				link        : "images/17.jpg", // image src
				thumb       : "images/17.jpg", // image thumb
				url         : "#", // url where image will link
				alt         : "Speed Optimized" // image alt tag
			},
			{
				display     : "image", // image, map, video
				title       : "Nex", // image title
				description : "Speed Optimized", // image description
				link        : "images/02.jpg", // image src
				thumb       : "images/02.jpg", // image thumb
				url         : "#", // url where image will link
				alt         : "Speed Optimized" // image alt tag
			},
			
			{
				display     : "image", // image, map, video
				title       : "Nex", // image title
				description : "Blazing Fast Fullscreen Slider", // image description
				link        : "images/3.jpg", // image src
				thumb       : "images/3.jpg", // image thumb
				url         : "#", // url where image will link
				alt         : "Blazing Fast Fullscreen Slider" // image alt tag
			},

		]
	});

});