<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBGXKB1k8LOAYWW0KCV9G0NNupVvav0XAs"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/GoogleMapMark.js"></script>
<script>createMap('${dto.fromName}','${dto.toName}',${dto.fromLatitude},${dto.toLatitude},${dto.fromLongitude},${dto.toLongitude}) </script>
<div class="w3-half w3-container">
<br><br><br>
<div id="map" style="width:100%;height:400px;"></div>
</div>

