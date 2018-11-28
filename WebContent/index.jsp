<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
* {
	box-sizing: border-box;
}

.video-background {
	background: #000;
	position: fixed;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	z-index: -99;
}

.video-foreground, .video-background iframe {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	pointer-events: none;
}

#vidtop-content {
	top: 0;
	color: #fff;
}

.vid-info {
	top: 0;
	right: 0;
	width: 33%;
	background: rgba(0, 0, 0, 0.3);
	color: #fff;
	padding: 1rem;
	border-radius: 10px;
	font-family: Avenir, Helvetica, sans-serif;
}

.vid-info h1 {
	font-size: 2rem;
	font-weight: 700;
	margin-top: 0;
	line-height: 1.2;
}

.vid-info a {
	display: block;
	color: #fff;
	text-decoration: none;
	background: rgba(0, 0, 0, 0.5);
	transition: 0.6s background;
	border-bottom: none;
	margin: 1rem auto;
	text-align: center;
}  
 
@media ( min-aspect-ratio : 16/9) {
	.video-foreground {
		height: 300%;
		top: -100%;
	}
}

@media ( max-aspect-ratio : 16/9) {
	.video-foreground {
		width: 300%;
		left: -100%;
	}
}

@media all and (max-width: 600px) {
	.vid-info {
		width: 50%;
		padding: .5rem;
	}
	.vid-info h1 {
		margin-bottom: .2rem;
	}
}

@media all and (max-width: 500px) {
	.vid-info .acronym {
		display: none;
	}
}  

.layer {
	position: absolute;
	display: table;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%
}

.layer .layer_inner {
	display: table-cell;
	text-align: center;
	vertical-align: middle;
}

.layer .content {
	display: inline-block;
}
</style>
</head>
<body>
<div class="video-background">
    <div class="video-foreground">
      <iframe src="https://www.youtube.com/embed/RIQqVqQs9Xs?controls=0&showinfo=0&rel=0&autoplay=1&loop=1&mute=1&start=4&end=262&playlist=RIQqVqQs9Xs" frameborder="0" allowfullscreen></iframe>
    </div>
</div>

<div class="layer">
  <div class="layer_inner">
<div id="vidtop-content">
<div class="vid-info content">
	 <!--  <h1>YouTube Fullscreen Background Demo</h1>
	  <p>The International Space Station orbits the Earth every 92 minutes, with its crew seeing a sunrise 15 times a day. It exists as a scientific, educational, and engineering platform in low orbit, 330 to 435 kilometres above the Earth.
     <p>Original timelapse by Riccardo Rossi (ISAA), used under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License. Raw photos courtesy of http://eol.jsc.nasa.gov/ -->
	 <h1><a href="AirportMain.al" class="w3-bar-item w3-button w3-text-red w3-hover-red"><i class="fa fa-power-off w3-margin-center"><b>&nbsp;&nbsp;Yolo Travel</b></i></a></h1>
  </div> 
</div> 
</div>
</div>

</body>
</html>