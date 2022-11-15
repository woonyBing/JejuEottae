<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Google Multiple Markers </title>

    <style type="text/css">
      
      #bound {
      	height: 60%;
      	width: 100%;
      }
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */   
      #map {
        height: 100%;
      }

      /* Optional: Makes the sample page fill the window. */
      html,
      body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      
      

    </style>
    
    
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <script
      src="https://maps.googleapis.com/maps/api/js?AIzaSyBjn-80evCQ7YDKFJR0fLXyBe-oKRhOWQw&callback=initMap&libraries=&v=weekly"
      defer
    >
    </script>
    
    
  <script>
  
  function initMap() {
      const myLatLng = {   //기본 좌표 값: 한라산
        lat: 33.360139,
        lng: 126.534247
      };

    var locations[] = [
      ['<div>'+'<h1>그랜드하얏트제주</h1>'+'<img src="https://cdn.pixabay.com/photo/2014/08/17/23/45/hotel-420260_960_720.jpg" width="300px" height="200px"></img>'+'</div>', 33.484759, 126.482115]];

    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 11,
      center: myLatLng,
    });

    var infowindow = new google.maps.InfoWindow();

    var marker, i;

    for (i = 0; i < locations.length; i++) {  
      marker = new google.maps.Marker({
        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
        map: map
      });

      google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
          infowindow.setContent(locations[i][0]);
          infowindow.open(map, marker);
        }
      })(marker, i));
    }    
  }
    
    </script>
  </head>
  <body>
  <div id = "bound">
    <div id="map"></div>
  </div>
  </body>
</html>