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
				link        : "images/1.jpg", // image src
				thumb       : "images/1.jpg", // image thumb
				url         : "#", // url where image will link
				alt         : "Speed Optimized" // image alt tag
			},
		]
	});

});