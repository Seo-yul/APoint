<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
  <head>
  
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" href="http://apoint.cf/apoint/resources/images/favicon.ico">
<!--===============================================================================================-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<!--===============================================================================================-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="http://apoint.cf/apoint/resources/css/footer.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="http://apoint.cf/apoint/resources/css/main.css">
<!--===============================================================================================-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!--===============================================================================================-->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="http://apoint.cf/apoint/resources/js/here.js"></script>
<!--===============================================================================================-->
<script src="http://www.webglearth.com/v2/api.js"></script>
<!--===============================================================================================-->
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/pie.js"></script>
<script src="https://www.amcharts.com/lib/3/themes/black.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />   
   
   
    <script>
      var earth;
      var options;
      function initialize() {
    	options = {atmosphere: false ,sky: true, center: [0, 0], zoom: 0, zooming:false};
        earth = new WE.map('earth_div',options);
        earth.setView([37.511981, 127.058544], 2);
        WE.tileLayer('http://tileserver.maptiler.com/nasa/{z}/{x}/{y}.jpg', {
            minZoom: 2,
            maxZoom: 3,
            
        }).addTo(earth);

        
        
        // Start a simple rotation animation
        var before = null;
        requestAnimationFrame(function animate(now) {
            var c = earth.getPosition();
            var elapsed = before? now - before: 0;
            before = now;
            earth.setCenter([c[0], c[1] + 0.1*(elapsed/50)]);
            requestAnimationFrame(animate);
        });
        
        
        
        var markerimg = "./resources/images/star-marker.png"
        var marker = WE.marker([37.511981, 127.058544],markerimg,24,24).addTo(earth)
        marker.bindPopup('<p>코엑스!</p>'+
		'<img src="http://tour.gangnam.go.kr/media/cache/69/1c/691cc52fbf9ff0cfc0f4d2d5b596a238.png" alt="..." class="img-circle">');

        marker = WE.marker([35.708442, 139.724598],markerimg,24,24).addTo(earth)
        marker.bindPopup('<p>도쿄!</p>');
        
        marker = WE.marker([40.699973, -73.996155],markerimg,24,24).addTo(earth)
        marker.bindPopup('<p>뉴욕!!</p>');
        
        marker = WE.marker([51.505855, -0.120887],markerimg,24,24).addTo(earth)
        marker.bindPopup('<p>런던!!!</p>');
        
        marker = WE.marker([51.505855, -0.120887],markerimg,24,24).addTo(earth)
        marker.bindPopup('<p>파리!</p>');
        
        marker = WE.marker([29.979142, 31.134266],markerimg,24,24).addTo(earth)
        marker.bindPopup('<p>이집트!</p>');
        
        marker = WE.marker([45.512627, -75.685274],markerimg,24,24).addTo(earth)
        marker.bindPopup('<p>캐나다</p>');
        
      }
      var chart = AmCharts.makeChart("chartdiv", {
    	    "type": "pie",
    	    "theme": "black",
    	    "innerRadius": "40%",
    	    "gradientRatio": [-0.4, -0.4, -0.4, -0.4, -0.4, -0.4, 0, 0.1, 0.2, 0.1, 0, -0.2, -0.5],
    	    "dataProvider": [{
    	        "country": "Seoul",
    	        "litres": 60
    	    }, {
    	        "country": "Canada",
    	        "litres": 50
    	    }, {
    	        "country": "Ireland",
    	        "litres": 10
    	    }, {
    	        "country": "Germany",
    	        "litres": 20
    	    }],
    	    "balloonText": "[[value]]",
    	    "valueField": "litres",
    	    "titleField": "country",
    	    "balloon": {
    	        "drop": true,
    	        "adjustBorderColor": false,
    	        "color": "#FFFFFF",
    	        "fontSize": 16
    	    }
    	});
    </script>
    
    
     <style type="text/css">
.img-circle {
	width: 50%;
}

html, body {
	padding: 0;
	margin: 0;
}

#earth_div {
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	position: absolute !important;
}
#sidebar{
	margin: 20% 0;
}
#chartdiv {
  background-color: #000; color: #fff;
	width		: 40%;
	height		: 500px;
	font-size	: 11px;
}		
</style>   
    <title>지구야 돌아라!</title>
  </head>
  
  <body onload="initialize()">
  
	<!-- Top nav page content -->
<%@ include file="top.jsp" %>
  <!-- Begin page content -->
	<div class="container">

      <!-- Main component for a primary marketing message or call to action -->
	  <div  id="earth_div">
	  </div>
	  
	  
	  
	  <%
String ua=request.getHeader("User-Agent").toLowerCase();
if(ua.matches("(?i).*((android|bb\\d+|meego).+mobile|avantgo|bada\\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\\.(browser|link)|vodafone|wap|windows ce|xda|xiino).*")||ua.substring(0,4).matches("(?i)1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\\-(n|u)|c55\\/|capi|ccwa|cdm\\-|cell|chtm|cldc|cmd\\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\\-s|devi|dica|dmob|do(c|p)o|ds(12|\\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\\-|_)|g1 u|g560|gene|gf\\-5|g\\-mo|go(\\.w|od)|gr(ad|un)|haie|hcit|hd\\-(m|p|t)|hei\\-|hi(pt|ta)|hp( i|ip)|hs\\-c|ht(c(\\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\\-(20|go|ma)|i230|iac( |\\-|\\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\\/)|klon|kpt |kwc\\-|kyo(c|k)|le(no|xi)|lg( g|\\/(k|l|u)|50|54|\\-[a-w])|libw|lynx|m1\\-w|m3ga|m50\\/|ma(te|ui|xo)|mc(01|21|ca)|m\\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\\-2|po(ck|rt|se)|prox|psio|pt\\-g|qa\\-a|qc(07|12|21|32|60|\\-[2-7]|i\\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\\-|oo|p\\-)|sdk\\/|se(c(\\-|0|1)|47|mc|nd|ri)|sgh\\-|shar|sie(\\-|m)|sk\\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\\-|v\\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\\-|tdg\\-|tel(i|m)|tim\\-|t\\-mo|to(pl|sh)|ts(70|m\\-|m3|m5)|tx\\-9|up(\\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\\-|your|zeto|zte\\-")) {
  response.sendRedirect("http://apoint.cf/apoint");
  return;
}
%>
         
        
    </div>
    <div id="chartdiv" class="pull-left"></div>
    
    <!-- footer page content -->
<%@ include file="foot.jsp" %>
  </body>
</html>