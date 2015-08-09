$(document).ready(function() {

  // For AJAX
  // $('a').click(function() {
  //   event.preventDefault();
  // });
var x = document.getElementById("demo");

window.onload = function () {
    if (navigator.geolocation) {
        navigator.geolocation.watchPosition(success, failure);
    } else {
        x.innerHTML = "Geolocation is not supported by this browser.";}
    }

function success(position) {
    x.innerHTML="Latitude: " + position.coords.latitude +
    "<br>Longitude: " + position.coords.longitude;
}

function failure(position) {
  x.innerHTML = "Geolocation is not supported by this browser.";
}

});