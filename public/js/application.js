(function (window, document) {
document.getElementById('toggle').addEventListener('click', function (e) {
    document.getElementById('tuckedMenu').classList.toggle('custom-menu-tucked');
    document.getElementById('toggle').classList.toggle('x');
});
})(this, this.document);

  // For AJAX
  // $('a').click(function() {
  //   event.preventDefault();
  // });
var x = document.getElementById("demo");

var startUp = function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.watchPosition(success, failure);
        // navigator.geolocation.getCurrentPosition(setGeoCookie);
    } else {
        x.innerHTML = "Geolocation is not supported by this browser.";}
    }

// function setGeoCookie(position) {
//   var cookie_val = position.coords.latitude + "|" + position.coords.longitude;
//   document.cookie = "lat_lng=" + escape(cookie_val);
// }

function success(position) {
  var buzzLatitude = document.getElementById('buzz-latitude')
  var buzzLongitude = document.getElementById('buzz-longitude')
  if (buzzLatitude) {
  buzzLatitude.value = position.coords.latitude;
  buzzLongitude.value = position.coords.longitude;}
  var myCenter = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);

  var mapProp = {
  center: myCenter,
  zoom:10,
  mapTypeId:google.maps.MapTypeId.ROADMAP
  };

  var map = new google.maps.Map(document.getElementById("map-canvas"),mapProp);

  var myCity = new google.maps.Circle({
  center:myCenter,
  radius:12000,
  strokeColor:"#0000FF",
  strokeOpacity:0.4,
  strokeWeight:2,
  fillColor:"#0000FF",
  fillOpacity:0.2
  });

  myCity.setMap(map);

  google.maps.event.addDomListener(window, 'load', success);

}


function failure(position) {
  document.getElementById("map-canvas").innerHTML = "Please enable location for best Buzy experience!"
}

window.onload = startUp();

$(document).ready(function(){

  $('.vote-button').on("click", function(e){
    // debugger
    e.preventDefault();

    var likeUrl = $(this).attr('href');


    var likeRequest = $.ajax({
      url: likeUrl,
      type: 'get',
    });

    likeRequest.done(function(responseData){

      var likePostId = $(this)[0].url.split('/')[2]
      $('#'+$(this)[0].url.split('/')[2]).html('Like: ' +responseData)
    })


  });

});
