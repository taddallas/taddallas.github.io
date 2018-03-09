---
layout: page
title: Home
---


<div class="pure-u-1-1 copy landing" markdown="1">

# Hello!

I'm Tad. I use laboratory microcosms and field data together with quantitative modeling and machine learning approaches to address a diverse set of questions in population, community, and disease ecology. I am currently a postdoc at the Centre for Ecological Change at the University of Helsinki, working towards understanding the geographic distribution of populations and communities through space and time. 

Feel free to [contact me](mailto:tad.a.dallas@gmail.com)

  <div class="btn-group">
    <a class="btn" href="resources/DallasCV.pdf"><i style="color:DimGray" class="fa fa-file-text-o fa-2x"></i></a>
    <a class="btn" href="https://github.com/taddallas" ><i style="color:DimGray" class="fa fa-github fa-2x"></i></a>
    <a class="btn" href="https://scholar.google.com/citations?user=baoGwQ0AAAAJ&hl=en" ><i style="color:DimGray" class="ai ai-google-scholar ai-2x"></i></a>
    <a class="btn" href="http://orcid.org/0000-0003-3328-9958" ><i style="color:DimGray" class="ai ai-orcid ai-2x"></i></a>
    <a class="btn" href="https://publons.com/author/904038/tad-dallas#profile"><i style="color:DimGray" class="ai ai-publons ai-2x"></i></a>
    <a class="btn" href="https://figshare.com/authors/Tad_Dallas/2585290"><i style="color:DimGray" class="ai ai-figshare ai-2x"></i></a>
  </div>
</div>


<!--<div class="pure-u-1-2 copy" id='hexagon' markdown="1">
</div>-->


<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/3.5.6/d3.min.js" charset="utf-8"></script>



<script language="javascript" type="text/javascript">
	var margin = {
  	top: 100,
    right: 0,
    bottom: 10,
	  left: 0
		};
	var width = 400 - margin.left - margin.right - 10,
 	height = Math.min(400, window.innerHeight - margin.top - margin.bottom - 20);

 //SVG container
	var svg = d3.select('#hexagon')
	  .append("svg")
	  .attr("width", width + margin.left + margin.right)
	  .attr("height", height + margin.top + margin.bottom)
	  .append("g")
	  .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

 	var SQRT3 = Math.sqrt(3),
	  hexRadius = Math.min(width, height)/2,
	  hexWidth = SQRT3 * hexRadius,
	  hexHeight = 2 * hexRadius;
	var hexagonPoly = [[0,-1],[SQRT3/2,0.5],[0,1],[-SQRT3/2,0.5],[-SQRT3/2,-0.5],[0,-1],[SQRT3/2,-0.5]];
	var hexagonPath = "m" + hexagonPoly.map(function(p){ return [p[0]*hexRadius, p[1]*hexRadius].join(','); }).join('l') + "z";

	//Create a clip path that is the same as the top hexagon
			svg.append("defs").append("clipPath")
		        .attr("id", "clip")
		        .append("path")
		        .attr("d", "M" + (width/2) + "," + (height/2) + hexagonPath);

		    //First append a group for the clip path, then a new group that can be transformed
			var circleWrapperOuter = svg.append("g")
				.attr("clip-path", "url(#clip)")
				.style("clip-path", "url(#clip)"); //make it work in safari

			var circleWrapperInner = circleWrapperOuter.append("g")
				.attr("transform", "translate(" + (width/2) + "," + (height/2) + ")")
				.style("isolation", "isolate");

			var colors = ["#1e90ff", "#1eff8d", "#ff1e90", "#ff8d1e"];

			//Create dataset with random initial positions
			randStart = [];
			for(var i = 0; i < 4*colors.length; i++) {
				randStart.push({
					rHex: Math.random() * hexWidth,
					theta: Math.random() * 2 * Math.PI,
					r: 4 + Math.random() * 30
				});
			}//for i

			//Background rectangle
			circleWrapperInner.append("rect")
				.attr("x", -hexWidth/2)
				.attr("y", -hexHeight/2)
				.attr("width", hexWidth)
				.attr("height", hexHeight)
				.style("fill", "#262626");

		    var circle = circleWrapperInner.selectAll(".dots")
		    	.data(randStart)
		    	.enter().append("circle")
		    	.attr("class", "dots")
		    	.attr("cx", function(d) { return d.rHex * Math.cos(d.theta); })
		    	.attr("cy", function(d) { return d.rHex * Math.sin(d.theta); })
		      	.attr("r", 0)
		      	.style("fill", function(d,i) {
		      		return colors[i%colors.length];
		      	})
				.style("opacity", 1)
				.style("mix-blend-mode", "screen")
				.each(move);

			circle.transition("grow")
				.duration(function(d,i) { return Math.random()*4000+500; })
				.delay(function(d,i) { return Math.random()*1000;})
				.attr("r", function(d,i) { return d.r; });

			//Place a hexagon on the scene
			svg.append("path")
				.attr("class", "hexagon")
				.attr("d", "M" + (width/2) + "," + (height/2) + hexagonPath)
				.style("stroke", "#00a6ca")
				.style("stroke-width", "4px")
				.style("fill", "none");

			//General idea from Maarten Lambrecht's block: http://bl.ocks.org/maartenzam/f35baff17a0316ad4ff6
			function move(d) {
				var currentx = parseFloat(d3.select(this).attr("cx")),
					mode = d3.select(this).style("mix-blend-mode"),
					radius = d.r;

				//Randomly define which quadrant to move next
				var sideX = currentx > 0 ? -1 : 1,
					sideY = Math.random() > 0.5 ? 1 : -1,
					randSide = Math.random();

				var newx,
					newy;

				//Move new locations along the vertical sides in 33% of the cases
				if (randSide > 0.66) {
					newx = sideX * 0.5 * SQRT3 * hexRadius - sideX*radius;
					newy = sideY * Math.random() * 0.5 * hexRadius - sideY*radius;
				} else {
					//Choose a new x location randomly,
					//the y position will be calculated later to lie on the hexagon border
					newx = sideX * Math.random() * 0.5 * SQRT3 * hexRadius;
					//Otherwise calculate the new Y position along the hexagon border
					//based on which quadrant the random x and y gave
					if (sideX > 0 && sideY > 0) {
						newy = hexRadius - (1/SQRT3)*newx;
					} else if (sideX > 0 && sideY <= 0) {
						newy = -hexRadius + (1/SQRT3)*newx;
					} else if (sideX <= 0 && sideY > 0) {
						newy = hexRadius + (1/SQRT3)*newx;
					} else if (sideX <= 0 && sideY <= 0) {
						newy = -hexRadius - (1/SQRT3)*newx;
					}//else

					//Take off a bit so it seems that the circles truly only touch the edge
					var offSetX = radius * Math.cos( 60 * Math.PI/180),
						offSetY = radius * Math.sin( 60 * Math.PI/180);
					newx = newx - sideX*offSetX;
					newy = newy - sideY*offSetY;
				}//else

				//Transition the circle to its new location
				d3.select(this)
					.transition("moveing")
					.duration(5000 + 10000*Math.random())
					.ease("linear")
					.attr("cy", newy)
					.attr("cx", newx)
					.style("mix-blend-mode", "screen")
					.each("end", move);

			}//function move

		</script>




<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-58262305-1', 'auto');
  ga('send', 'pageview');

</script>
