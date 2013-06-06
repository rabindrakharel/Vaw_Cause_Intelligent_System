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
<%    ArrayList<ArrayList<String>> Nodes = (ArrayList<ArrayList<String>>)request.getAttribute("result");
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
        var CircleFillOpacity=0.4;
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
ArrayList<String> SmallDest=Nodes.get(0);
%>
cityCircleR1= new google.maps.Circle({
        strokeColor: CircleStrokeColor,
        strokeOpacity: CircleStrokeOpacity,
        strokeWeight: CircleStrokeWeight,
        fillColor: CircleFillColor ,
        fillOpacity: CircleFillOpacity,
        map: map,
        center: new google.maps.LatLng(<%=SmallDest.get(2) %>,<%=SmallDest.get(3) %>),
        radius: 100000
      });
  <% 
iter=0; 
for(ArrayList<String> Pair:Nodes)
{iter++; %> 
     
      cityCircleD<%=iter%> = new google.maps.Circle({
         strokeColor: '#0000FF',
        strokeOpacity: CircleStrokeOpacity,
        strokeWeight: CircleStrokeWeight,
        fillColor: '#0000FF' ,
        fillOpacity: 0.5,
        map: map,
        center: new google.maps.LatLng(<%=Pair.get(0) %>,<%=Pair.get(1) %>),
        radius: 100000
      });
            
<%}%>

<% 
iter=0; 
for(ArrayList<String> Pair:Nodes)
{iter++; %> 
     
      
       
      
<%}%>
      
  animateCircle();  	
  
  
   google.maps.event.addListener(cityCircleR1, 'click',function open_chart_popup() {
   window.open('highchart.html?id='+cityCircleR1.getCenter().lat()+'b='+cityCircleR1.getCenter().lng(),'chart popup title', 'width=600px height=400px');   
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
{
 iter++; 
%> 
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
       <div class="formLayout">
	<form action="DonorCountry" method="POST">
	<fieldset class="fset">
	<label>Donor Country</label><br/>
	    <select name="Donor">
             <option value="Australia">       Australia      </option>
 <option value="Austria">       Austria      </option>
 <option value="Belgium">       Belgium      </option>
 <option value="Brazil">       Brazil      </option>
 <option value="Canada">       Canada      </option>
 <option value="Chile">       Chile      </option>
 <option value="Colombia">       Colombia      </option>
 <option value="Cyprus">       Cyprus      </option>
 <option value="Czech Republic">       Czech Republic      </option>
 <option value="Denmark">       Denmark      </option>
 <option value="Estonia">       Estonia      </option>
 <option value="Finland">       Finland      </option>
 <option value="France">       France      </option>
 <option value="Germany">       Germany      </option>
 <option value="Greece">       Greece      </option>
 <option value="Hungary">       Hungary      </option>
 <option value="Iceland">       Iceland      </option>
 <option value="India">       India      </option>
 <option value="Ireland">       Ireland      </option>
 <option value="Italy">       Italy      </option>
 <option value="Japan">       Japan      </option>
 <option value="Kuwait">       Kuwait      </option>
 <option value="Latvia">       Latvia      </option>
 <option value="Liechtenstein">       Liechtenstein      </option>
 <option value="Lithuania">       Lithuania      </option>
 <option value="Luxembourg">       Luxembourg      </option>
 <option value="Monaco">       Monaco      </option>
 <option value="Netherlands">       Netherlands      </option>
 <option value="New Zealand">       New Zealand      </option>
 <option value="Norway">       Norway      </option>
           </select>
        <input type="submit" value="Visualize" name="submit" />
	</form>
<br/>
<br/>
<br/>
<br/>
<br/>
	<form action="ReceiverCountry" method="POST">
	<fieldset class="fset">
	<label>Receiver Country</label><br/>
	    <select name="Receiver">
             <option value="Afghanistan"> Afghanistan  </option>
 <option value="Albania"> Albania  </option>
 <option value="Algeria"> Algeria  </option>
 <option value="Angola"> Angola  </option>
 <option value="Anguilla"> Anguilla  </option>
 <option value="Argentina"> Argentina  </option>
 <option value="Armenia"> Armenia  </option>
 <option value="Aruba"> Aruba  </option>
 <option value="Australia"> Australia  </option>
 <option value="Austria"> Austria  </option>
 <option value="Azerbaijan"> Azerbaijan  </option>
 <option value="Bahamas"> Bahamas  </option>
 <option value="Bahrain"> Bahrain  </option>
 <option value="Bangladesh"> Bangladesh  </option>
 <option value="Barbados"> Barbados  </option>
 <option value="Belarus"> Belarus  </option>
 <option value="Belgium"> Belgium  </option>
 <option value="Belize"> Belize  </option>
 <option value="Benin"> Benin  </option>
 <option value="Bermuda"> Bermuda  </option>
 <option value="Bhutan"> Bhutan  </option>
 <option value="Bolivia"> Bolivia  </option>
 <option value="Botswana"> Botswana  </option>
 <option value="Brazil"> Brazil  </option>
 <option value="Brunei"> Brunei  </option>
 <option value="Bulgaria"> Bulgaria  </option>
 <option value="Burkina Faso"> Burkina Faso  </option>
 <option value="Burundi"> Burundi  </option>
 <option value="Cambodia"> Cambodia  </option>
 <option value="Cameroon"> Cameroon  </option>
 <option value="Canada"> Canada  </option>
 <option value="Cape Verde"> Cape Verde  </option>
 <option value="Cayman Islands"> Cayman Islands  </option>
 <option value="Chad"> Chad  </option>
 <option value="Chile"> Chile  </option>
 <option value="China"> China  </option>
 <option value="Colombia"> Colombia  </option>
 <option value="Comoros"> Comoros  </option>
 <option value="Cook Islands"> Cook Islands  </option>
 <option value="Costa Rica"> Costa Rica  </option>
 <option value="Croatia"> Croatia  </option>
 <option value="Cuba"> Cuba  </option>
 <option value="Cyprus"> Cyprus  </option>
 <option value="Czech Republic"> Czech Republic  </option>
 <option value="Denmark"> Denmark  </option>
 <option value="Djibouti"> Djibouti  </option>
 <option value="Dominica"> Dominica  </option>
 <option value="Dominican Republic"> Dominican Republic  </option>
 <option value="Ecuador"> Ecuador  </option>
 <option value="Egypt"> Egypt  </option>
 <option value="El Salvador"> El Salvador  </option>
 <option value="Equatorial Guinea"> Equatorial Guinea  </option>
 <option value="Eritrea"> Eritrea  </option>
 <option value="Estonia"> Estonia  </option>
 <option value="Ethiopia"> Ethiopia  </option>
 <option value="Falkland Islands"> Falkland Islands  </option>
 <option value="Fiji"> Fiji  </option>
 <option value="Finland"> Finland  </option>
 <option value="France"> France  </option>
 <option value="French Guiana"> French Guiana  </option>
 <option value="French Polynesia"> French Polynesia  </option>
 <option value="Gabon"> Gabon  </option>
 <option value="Gambia"> Gambia  </option>
 <option value="Georgia"> Georgia  </option>
 <option value="Germany"> Germany  </option>
 <option value="Ghana"> Ghana  </option>
 <option value="Gibraltar"> Gibraltar  </option>
 <option value="Greece"> Greece  </option>
 <option value="Grenada"> Grenada  </option>
 <option value="Guadeloupe"> Guadeloupe  </option>
 <option value="Guatemala"> Guatemala  </option>
 <option value="Guinea"> Guinea  </option>
 <option value="Guyana"> Guyana  </option>
 <option value="Haiti"> Haiti  </option>
 <option value="Honduras"> Honduras  </option>
 <option value="Hungary"> Hungary  </option>
 <option value="Iceland"> Iceland  </option>
 <option value="India"> India  </option>
 <option value="Indonesia"> Indonesia  </option>
 <option value="Iran"> Iran  </option>
 <option value="Iraq"> Iraq  </option>
 <option value="Ireland"> Ireland  </option>
 <option value="Israel"> Israel  </option>
 <option value="Italy"> Italy  </option>
 <option value="Jamaica"> Jamaica  </option>
 <option value="Japan"> Japan  </option>
 <option value="Jordan"> Jordan  </option>
 <option value="Kazakhstan"> Kazakhstan  </option>
 <option value="Kenya"> Kenya  </option>
 <option value="Kiribati"> Kiribati  </option>
 <option value="Kosovo"> Kosovo  </option>
 <option value="Kuwait"> Kuwait  </option>
 <option value="Laos"> Laos  </option>
 <option value="Latvia"> Latvia  </option>
 <option value="Lebanon"> Lebanon  </option>
 <option value="Lesotho"> Lesotho  </option>
 <option value="Liberia"> Liberia  </option>
 <option value="Libya"> Libya  </option>
 <option value="Liechtenstein"> Liechtenstein  </option>
 <option value="Lithuania"> Lithuania  </option>
 <option value="Luxembourg"> Luxembourg  </option>
 <option value="Madagascar"> Madagascar  </option>
 <option value="Malawi"> Malawi  </option>
 <option value="Malaysia"> Malaysia  </option>
 <option value="Maldives"> Maldives  </option>
 <option value="Mali"> Mali  </option>
 <option value="Malta"> Malta  </option>
 <option value="Marshall Islands"> Marshall Islands  </option>
 <option value="Martinique"> Martinique  </option>
 <option value="Mauritania"> Mauritania  </option>
 <option value="Mauritius"> Mauritius  </option>
 <option value="Mayotte"> Mayotte  </option>
 <option value="Mexico"> Mexico  </option>
 <option value="Moldova"> Moldova  </option>
 <option value="Mongolia"> Mongolia  </option>
 <option value="Montenegro"> Montenegro  </option>
 <option value="Montserrat"> Montserrat  </option>
 <option value="Morocco"> Morocco  </option>
 <option value="Mozambique"> Mozambique  </option>
 <option value="Namibia"> Namibia  </option>
 <option value="Nauru"> Nauru  </option>
 <option value="Nepal"> Nepal  </option>
 <option value="Netherlands"> Netherlands  </option>
 <option value="Netherlands Antilles"> Netherlands Antilles  </option>
 <option value="New Caledonia"> New Caledonia  </option>
 <option value="New Zealand"> New Zealand  </option>
 <option value="Nicaragua"> Nicaragua  </option>
 <option value="Niger"> Niger  </option>
 <option value="Nigeria"> Nigeria  </option>
 <option value="Niue"> Niue  </option>
 <option value="Norway"> Norway  </option>
 <option value="Oman"> Oman  </option>
 <option value="Pakistan"> Pakistan  </option>
 <option value="Palau"> Palau  </option>
 <option value="Panama"> Panama  </option>
 <option value="Papua New Guinea"> Papua New Guinea  </option>
 <option value="Paraguay"> Paraguay  </option>
 <option value="Peru"> Peru  </option>
 <option value="Philippines"> Philippines  </option>
 <option value="Poland"> Poland  </option>
 <option value="Portugal"> Portugal  </option>
 <option value="Qatar"> Qatar  </option>
 <option value="Romania"> Romania  </option>
 <option value="Russia"> Russia  </option>
 <option value="Rwanda"> Rwanda  </option>
 <option value="Samoa"> Samoa  </option>
 <option value="Saudi Arabia"> Saudi Arabia  </option>
 <option value="Senegal"> Senegal  </option>
 <option value="Serbia"> Serbia  </option>
 <option value="Seychelles"> Seychelles  </option>
 <option value="Sierra Leone"> Sierra Leone  </option>
 <option value="Singapore"> Singapore  </option>
 <option value="Slovenia"> Slovenia  </option>
 <option value="Solomon Islands"> Solomon Islands  </option>
 <option value="Somalia"> Somalia  </option>
 <option value="South Africa"> South Africa  </option>
 <option value="Spain"> Spain  </option>
 <option value="Sri Lanka"> Sri Lanka  </option>
 <option value="Sudan"> Sudan  </option>
 <option value="Suriname"> Suriname  </option>
 <option value="Swaziland"> Swaziland  </option>
 <option value="Switzerland"> Switzerland  </option>
 <option value="Syria"> Syria  </option>
 <option value="Taiwan"> Taiwan</option>
 <option value="Tajikistan"> Tajikistan </option>
 <option value="Tanzania"> Tanzania </option>
 <option value="Thailand"> Thailand </option>
 <option value="Togo"> Togo      </option>
 <option value="Tokelau"> Tokelau </option>
 <option value="Tonga"> Tonga   </option>
 <option value="Tunisia"> Tunisia  </option>
 <option value="Turkey"> Turkey </option>
 <option value="Turkmenistan"> Turkmenistan   </option>
 <option value="Turks and Caicos Islands"> Turks and Caicos Islands  </option>
 <option value="Tuvalu"> Tuvalu   /option>
 <option value="Uganda"> Uganda   /option>
 <option value="Ukraine"> Ukraine  </option>
 <option value="United Arab Emirates"> United Arab Emirates </option>
 <option value="United Kingdom"> United Kingdom</option>
 <option value="United States"> United States </option>
 <option value="Uruguay"> Uruguay</option>
 <option value="Uzbekistan"> Uzbekistan</option>
 <option value="Vanuatu"> Vanuatu</option>
 <option value="Venezuela"> Venezuela</option>
 <option value="Yemen"> Yemen</option>
 <option value="Zambia"> Zambia</option>
 <option value="Zimbabwe"> Zimbabwe</option>		
        </select>
        <input type="submit" value="Visualize" name="submit" />
        </form>
	</div>
        <div id="map-canvas"></div>
  </body>
</html>

