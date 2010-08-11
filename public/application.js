function toggle(id) {
  var pre  = document.getElementById("pre-" + id);
  var post = document.getElementById("post-" + id);
  var context = document.getElementById("context-" + id);

  if (pre.style.display == 'block') {
    pre.style.display = 'none';
    post.style.display = 'none';
    context.style.background = "none";
  } else {
    pre.style.display = 'block';
    post.style.display = 'block';
    context.style.background = "#fffed9";
  }
}

function toggleBacktrace(){
  var bt = document.getElementById("backtrace");
  var toggler = document.getElementById("expando");

  if (bt.className == 'condensed') {
    bt.className = 'expanded';
    toggler.innerHTML = "(condense)";
  } else {
    bt.className = 'condensed';
    toggler.innerHTML = "(expand)";
  }
}
         
function initializeGoogleMap(latitude, longitude) {
  geocoder = new google.maps.Geocoder();
  var latlng = new google.maps.LatLng(latitude, longitude);
  var myOptions = {
    zoom: 6,
    center: latlng,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
  var marker = new google.maps.Marker({
      position: latlng, 
      map: map,
      title: "Device Location"
  });
}

function codeAddress(address) {
  if (geocoder) {
    geocoder.geocode( { 'address': address }, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        map.setCenter(results[0].geometry.location);
        var marker = new google.maps.Marker({
            map: map, 
            position: results[0].geometry.location,
            title:"Device Location"
        });
      } else {
        $('#map_canvas').replaceWith('No location data available.')
      }
    });
  }
}

function refreshLiveView() {
  el = $("#snapshot");
  my_date = new Date;
  path = "/snapshot.jpg?" + my_date.getTime();
  el.fadeOut('slow', function() {
    el.attr("src", path);
    el.fadeIn('slow');
  });
}

function refreshMap() {
    el = $('#map_canvas');
    el.fadeOut('slow', function() {
        $.getJSON('/location.json', function(data) {
            initializeGoogleMap(data[0], data[1]);
        });
        el.fadeIn('slow'); 
    });
}

