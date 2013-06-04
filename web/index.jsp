<%-- 
Document   : CheckNodes
Created on : May 29 , 2013, 1:46:00 PM
Author     : paradise lost
--%>

<%@page import="Model.DonorToReceipient"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Graph Data Visualization</title>
    <link href="default.css" rel="stylesheet">
   
    <style>
html, body {
  height: 100%;
  margin: 0;
  padding: 0;
}

#map-canvas, #map_canvas {
  height: 100%;
}

@media print {
  html, body {
    height: auto;
  }

  #map-canvas, #map_canvas {
    height: 350px;
    width : 350px;
  }
}

#panel {
  position: absolute;
  top: 5px;
  left: 50%;
  margin-left: -180px;
  z-index: 5;
  background-color: #fff;
  padding: 5px;
  border: 1px solid #999;
}</style>
     <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
     <script src="http://code.jquery.com/jquery.js"></script>
<% 
        DonorToReceipient dr1=new DonorToReceipient();
        ArrayList<ArrayList<String>> Nodes = dr1.getNodes();
//ArrayList<ArrayList<String>> Nodes=(ArrayList<ArrayList<String>>)request.getAttribute("Nodes");
%>
    <script src="js/bootstrap.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
    <script>
        var MapZoom=3;
        var Retardation=5;
        var LineStrokeOpacity=0.3;
        var LineColor="#FFFFFF";
        var LineStrokeColor="#FFFFFF";
        var LineStrokeWeight=1;        
        var CircleFillColor="#FF0000";
        var CircleFillOpacity=0.08;
        var CircleStrokeColor="#FF0000";
        var CircleStrokeWeight=0.086;
        var CircleStrokeOpacity=0.8;
var line={};
var cityCircle={};
var citymap = {};
  
function initialize() {
  var mapOptions = {
    center: new google.maps.LatLng(20.291, 80.027),
    zoom: MapZoom,
    mapTypeId: google.maps.MapTypeId.TERRAIN
  };
  
  var map = new google.maps.Map(document.getElementById('map-canvas'),mapOptions);
  <% 
int iter=0; 
%>

  var lineSymbol = {
    path: google.maps.SymbolPath.CIRCLE,
    scale: 2,
    strokeColor: '#FF0000'
      };

  <% 
iter=0; 
for(ArrayList<String> Pair:Nodes)
{iter++; %> 
      line<%=iter%> = new google.maps.Polyline({
    path: [new google.maps.LatLng(<%=Pair.get(0)%>,<%=Pair.get(1)%>),new google.maps.LatLng(<%=Pair.get(2)%>,<%=Pair.get(3)%>)],
    strokeColor: LineStrokeColor,
    icons: [{
          icon: lineSymbol,
          offset: '100%',
	  scale:1
    }],
    map: map,
    strokeOpacity: LineStrokeOpacity,
    strokeWeight: LineStrokeWeight
  });
<%}%>

  <% 
iter=0; 
for(ArrayList<String> Pair:Nodes)
{iter++; %> 
     
      cityCircle = new google.maps.Circle({
        strokeColor: CircleStrokeColor,
        strokeOpacity: CircleStrokeOpacity,
        strokeWeight: CircleStrokeWeight,
        fillColor: CircleFillColor ,
        fillOpacity: CircleFillOpacity,
        map: map,
        center: new google.maps.LatLng(<%=Pair.get(2) %>,<%=Pair.get(3) %>),
        radius: 100000
      });
      
       cityCircle= new google.maps.Circle({
        strokeColor: '#0000FF',
        strokeOpacity: CircleStrokeOpacity,
        strokeWeight: CircleStrokeWeight,
        fillColor: '#0000FF' ,
        fillOpacity: 0.1,
        map: map,
        center: new google.maps.LatLng(<%=Pair.get(0) %>,<%=Pair.get(1) %>),
        radius: 100000
      });
      
<%}%>

      
  animateCircle();  	
  
  
   google.maps.event.addListener(cityCircle, 'click',function open_chart_popup() {
   window.open('highchart.html?id='+cityCircle.getCenter().lat()+'b='+cityCircle.getCenter().lng(),'chart popup title', 'width=600px height=400px');   
    });
    
}

function animateCircle() {
    var count = 0;
    
    window.setInterval(function() {
        
      count = (count + 1) % 200;
      var icons = line1.get('icons');
      icons[0].offset = (count / 2) + '%';
      <%
iter=0;
for(ArrayList<String> Pair:Nodes)
{iter++; %> 
            line<%=iter%>.set('icons', icons);
     
<%}%>
    
      
//       var radius = cityCircleR1.get('radius');
//       var radius = cityCircleR1.get('radius');
//      cityCircleR1.set('radius', 100000*count/200);
//      cityCircleR1.set('fillOpacity',0.01*count/20*10);
    	}, Retardation);

}
google.maps.event.addDomListener(window, 'load', initialize);

    </script>
  </head>
  <body>
    <div id="map-canvas"></div>
  </body>
</html>

