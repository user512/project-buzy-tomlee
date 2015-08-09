

  // For AJAX
  // $('a').click(function() {
  //   event.preventDefault();
  // });
var x = document.getElementById("demo");

var startUp = function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.watchPosition(success, failure);
    } else {
        x.innerHTML = "Geolocation is not supported by this browser.";}
    }

window.onload = startUp();

function success(position) {
    x.innerHTML="Latitude: " + position.coords.latitude +
    "<br>Longitude: " + position.coords.longitude;
    var map;
    map = new google.maps.Map(document.getElementById('map-canvas'), {
      zoom: 12,
      center: {lat: position.coords.latitude, lng: position.coords.longitude}
    });
    google.maps.event.addDomListener(window, 'load', success);
}


function failure(position) {
  switch(error.code) {
        case error.PERMISSION_DENIED:
            x.innerHTML = "User denied the request for Geolocation."
            break;
        case error.POSITION_UNAVAILABLE:
            x.innerHTML = "Location information is unavailable."
            break;
        case error.TIMEOUT:
            x.innerHTML = "The request to get user location timed out."
            break;
        case error.UNKNOWN_ERROR:
            x.innerHTML = "An unknown error occurred."
            break;
    }
}

google.maps.event.addDomListener(window, 'load');

