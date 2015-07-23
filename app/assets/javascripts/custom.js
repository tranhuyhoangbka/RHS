$(document).ready(function(){
  $("#mylocation").click(function(){
    geoLocation();
  });
  $(".carousel-inner .item:first-child").addClass("active");

  $(".item img").click(function(){
    $(".fancybox").fancybox({
      speedIn : 600,
      speedOut : 200,
      padding : 2,
      helpers : {
        overlay : {
          locked : false
        }
      },
      beforeShow: function () {
        $(".fancybox-image").css({
          width : 700,
          height : 500
        });
        this.width = 700;
        this.height = 500;
      },
    });
  });
});

var directionsDisplay;
var directionsService = new google.maps.DirectionsService();
var map;
var geolocate;
var geo_marker = null;
var infowindow = new google.maps.InfoWindow({size: new google.maps.Size(150, 50)});

function initialize() {
  var myLatlng = new google.maps.LatLng(21.017030, 105.783902);
  var lat = document.getElementById("form-lat");
  var lng = document.getElementById("form-lng");
  var input = document.getElementById("pac-input");
  var image = "/assets/pin.png";
  var markers = [];
  var option = {
    zoom: 13,
    center: myLatlng,
    mapTypeControl: true,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }

  directionsDisplay = new google.maps.DirectionsRenderer();
  directionsDisplay.setMap(map)

  map = new google.maps.Map(document.getElementById("map-canvas"), option);
  var marker;

  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

  var searchBox = new google.maps.places.SearchBox((input));

  google.maps.event.addListener(searchBox, "places_changed", function() {
    var places = searchBox.getPlaces();

    if (places.length === 0) {
      return;
    }

    for (var i = 0, marker; marker = markers[i]; i++) {
      marker.setMap(null);
    }

    markers = [];
    var bounds = new google.maps.LatLngBounds();

    for (var i = 0, place; place = places[i]; i++) {
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

    myLatLng = event.latLng;

    marker = new google.maps.Marker({
      position: myLatLng,
      map: map,
      icon: image,
      title:"Property Location"
    });

    lat.value = event.latLng.lat();
    lng.value = event.latLng.lng();
  });
}

function geoLocation() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(showPosition);
  } else {
    alert("No Gelocation Support!");
  }
}

function showPosition(position) {
  geolocate = new google.maps.LatLng(position.coords.latitude,
                                     position.coords.longitude);

  if(geo_marker == null){
    geo_marker = new google.maps.Marker({
      map: map,
      position: geolocate,
      icon: "/assets/geo.png"
    });
  } else {
    geo_marker.setPosition(geolocate);
  }

  map.setCenter(geolocate);
}

function gmap_show_addresses(addresses) {
  for (var i = 1; i < addresses.length; i++) {
    var position = new google.maps.LatLng(
      addresses[i].lat,
      addresses[i].lng);
    var marker = new google.maps.Marker({
      position: position,
      map: map,
      id: addresses[i].id
    });
    marker.setTitle((i + 1).toString());
    attachSecretMessage(marker, i);
    var infowindow = new google.maps.InfoWindow({
      content: "<button onclick = \"calcRoute(" + addresses[i].lat + "," +
        addresses[i].lng + ")\">Directions</button>"
    });
    infowindow.open(map, marker);
  }
}

function attachSecretMessage(marker, num) {
  google.maps.event.addListener(marker, "click", function() {
    $.fancybox({
      "type" : "iframe",
      "href" : "http://" + location.host + "/addresses/" + addresses[num].id,
      "overlayShow" : true,
      "centerOnScroll" : true,
      "speedIn" : 100,
      "speedOut" : 50,
      "width" : "80%",
      "height" : "80%"
    });
  });
}

function calcRoute(target_lat, target_lng) {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var lat = position.coords.latitude;
      var lng = position.coords.longitude;
      var start = new google.maps.LatLng(lat, lng);
      var end = new google.maps.LatLng(target_lat, target_lng);
      var selectedMode = document.getElementById("travel-mode").value;
      var request = {
        origin:start,
        destination:end,
        travelMode: google.maps.TravelMode[selectedMode]
      };
      directionsService.route(request, function(result, status) {
        if (status == google.maps.DirectionsStatus.OK) {
          directionsDisplay.setDirections(result);
          var dis = result.routes[0].legs[0].distance.value;
          document.getElementById("distance").innerHTML = dis/1000;
        }
      });
      document.getElementById("mode").style.visibility = "visible";
    });
  } else {
    alert("No Gelocation Support!");
  }
}

$(document).ready(function() {
  $(".carousel").carousel("pause");
});

function remove_fields(link) {
  var tabAddImage = $("#tab-add-image");
  li_current_active = tabAddImage.find("li.active");
  li_previous = li_current_active.prev();

  li_previous.attr("class", "active");
  li_current_active.remove();

  var tabContent = $(".tab-content");
  div_curr_active = tabContent.find("div.active");
  div_pre_active = div_curr_active.prev();
  div_pre_active.attr("class", "tab-pane active")
  div_curr_active.remove();

  if (tabContent.find("div").length === 0) {
    $("#images-form").hide("slow");

    $(".btn-action-show-images").attr("class",
      "btn-action-show-images btn btn-info toggler disabled");

    $(".btn-action-show-images").find("i").
      removeClass("glyphicon-chevron-down").
      addClass("glyphicon-chevron-right");
  }
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");

  var tabAddImage = $("#tab-add-image");
  tabAddImage.find("li.active").attr("class", "");

  var new_tab = ("<li class=\"active\"><a data-toggle=\"tab\" href="
    + "#" + new_id + ">New Image</a></li>");
  tabAddImage.append(new_tab);

  var tabContent = $(".tab-content");
  tabContent.find("div.active").attr("class", "tab-pane fade");

  var divTabPane = ("<div id=" + new_id + " class= \"tab-pane active\">"
    + content.replace(regexp, new_id) + "</div>");
  tabContent.append(divTabPane);

  $(".btn-action-show-images").attr("class",
    "btn-action-show-images btn btn-info toggler active");

  $(".btn-action-show-images").find("i").
    removeClass("glyphicon-chevron-right").
    addClass("glyphicon-chevron-down");

  $("#images-form").show("slow");
}

$(".tooltip").tooltip();

$(document).ready(function() {
  $(".btn-action-show-images").on("click", function(e) {
    var icon = $(e.currentTarget).find("i");
    if (icon.hasClass("glyphicon-chevron-down")) {
      icon.removeClass("glyphicon-chevron-down").
      addClass("glyphicon-chevron-right");
    }
    else if (icon.hasClass("glyphicon-chevron-right")) {
      icon.removeClass("glyphicon-chevron-right").
      addClass("glyphicon-chevron-down");
    }

    var imgForm = $("#images-form");
    imgForm.toggle("slow");
  });
});
