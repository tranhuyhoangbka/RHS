var infowindow = new google.maps.InfoWindow({
  size: new google.maps.Size(150,50)});

function initialize() {
  var myLatlng = new google.maps.LatLng(20.919650305632143, 106.63326752187459);
  var map = new google.maps.Map(document.getElementById("map-canvas"), myOptions);

  var image = "/assets/pin.png";
  var myOptions = {
    zoom: 16,
    center: myLatlng,
    mapTypeControl: true,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }

  var marker = new google.maps.Marker({
    position: myLatlng,
    map: map,
    icon: image,
    title:"Property Location"
  });

  formlat = document.getElementById("form-lat").value = myLatlng.lat();
  formlng = document.getElementById("form-lon").value = myLatlng.lng();

  var defaultBounds = new google.maps.LatLngBounds(
    new google.maps.LatLng(20.919650305632143, 106.63326752187459),
    new google.maps.LatLng(20.919650305632143, 106.63326752187459));
  map.fitBounds(defaultBounds);

  var input = (
    document.getElementById("pac-input"));
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

  var searchBox = new google.maps.places.SearchBox(
    (input));
  google.maps.event.addListener(searchBox, "places_changed", function() {
    var places = searchBox.getPlaces();

    if (places.length == 0) {
      return;
    }
    for (var i = 0, marker; marker = markers[i]; i++) {
      marker.setMap(null);
    }
    var bounds = new google.maps.LatLngBounds();
    for (var i = 0, place; place = places[i]; i++) {
      var image = {
        url: place.icon,
        size: new google.maps.Size(10, 10),
        origin: new google.maps.Point(0, 0),
        anchor: new google.maps.Point(17, 34),
        scaledSize: new google.maps.Size(16, 16)
      };
      var marker = new google.maps.Marker({
        map: map,
        icon: image,
        title: place.name,
        position: place.geometry.location
      });
      markers.push(marker);
      bounds.extend(place.geometry.location);
    }
    map.fitBounds(bounds);
  });
  google.maps.event.addListener(map, "bounds_changed", function() {
    var bounds = map.getBounds();
    searchBox.setBounds(bounds);
  });

  google.maps.event.addListener(map, "click", function() {
    infowindow.close();
  });

  google.maps.event.addListener(map, "click", function(event) {
    if (marker) {
      marker.setMap(null);
      marker = null;
    }
    var myLatLng = event.latLng ;
    marker = new google.maps.Marker({
      position: myLatLng,
      map: map,
      icon: image,
      title:"Property Location"
    });
    formlat = document.getElementById("form-lat").value = event.latLng.lat();
    formlng = document.getElementById("form-lon").value = event.latLng.lng();
  });
}
