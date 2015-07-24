// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery

var map, marker;

function initialize() {
  var myLatlng = new google.maps.LatLng(21.017030, 105.783902);

  var option = {
    zoom: 13,
    center: myLatlng,
    mapTypeControl: true,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }

  map = new google.maps.Map(document.getElementById("map-canvas"), option);

  var lat = $("#show-address-map").data("address-lat");
  var lng = $("#show-address-map").data("address-lng");
  var position = new google.maps.LatLng(lat, lng);

  marker = new google.maps.Marker({position: position, map: map});
  marker.setMap(map);
  map.setCenter(position);
  map.setZoom(14);
}
