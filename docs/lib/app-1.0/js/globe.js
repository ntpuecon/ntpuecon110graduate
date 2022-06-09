$(function(){
   $("#zoom-in").click(animateZoom);
  $("#zoom-out").click(animateZoomBack);
  $play=$("#play");
  $stop=$("#stop");
  $play.click(
    function(){
      $play.toggle();
      $stop.toggle();
      animateRotation()});
  $stop.click(function(){
    $stop.toggle();
    $play.toggle();
    stopRotation()});
    lyStart=get_layout_center_geo();
});

function rotate_globe(right=2){
  currentLon=widget.layout.geo.projection.rotation.lon;

  Plotly.animate(widget,
  {layout: {geo: {projection: {rotation: {lon: currentLon+right}}}}},
  {
      transition: {
        duration: 500
      },
      frame: {
        duration: 500
      }
    }
  );
}
function rotate_globe2(up=5){
  currentLat=widget.layout.geo.projection.rotation.lat;
  if(currentLat>34 && up > 0){up=0}
  if(currentLat<-45 && up < 0 ){up=0}
  Plotly.animate(widget,
  {layout: {geo: {projection: {rotation: {lat: currentLat+up}}}}},
  {
      transition: {
        duration: 600
      },
      frame: {
        duration: 600
      }
    }
  );
}
function animateRotation(){
  resetPlayLat();
  intervalID = setInterval(
    function(){requestAnimationFrame(rotate_globe);},650);

}
var intervalID;
stopRotation=function(){
    clearInterval(intervalID);
  }
$(function(){
  widget.on("plotly_click", stopRotation, {passive: true});
})

var clearTree = {
    visible: false
};

clearTrees = function(){
  let nonTaiwanTraces = Array.from({length: 244}, (_, i) => i + 1)
  Plotly.restyle(widget, clearTree, nonTaiwanTraces);
  treesPlanted =1;
}

var plantTree = {
   visible: true
}
treesPlanted = 1;
plantOneMoreTree = function(){
  Plotly.restyle(widget, plantTree, treesPlanted)
  treesPlanted = treesPlanted+1
}
targetTree = function(lat, lon){
  Plotly.relayout(widget,
    {geo: {
        showland: true,
        showocean: true,
        oceancolor: "#e3f2fd",
        bgcolor: "#00000000",
        landcolor: "#fff8e1",
        center: {
        lat: lat,
        lon: lon},
        projection: {
        type: "orthographic",
        rotation: {
        lat: lat,
        lon: lon,
        roll: 0
      }}}
      }
  )
}

currentScale=1;
zoomIn = function(){
  currentScale=currentScale+1;
  var layout={geo: {projection: {scale: currentScale}}}
  Plotly.relayout(widget, layout);
}
zoomOut = function(){
  if(currentScale > 1){
    currentScale=currentScale-1;}
  var layout={geo: {projection: {scale: currentScale}}}
  Plotly.relayout(widget, layout);
}

animateZoom = function(ms=3500){
  Plotly.animate(widget, {
    layout: get_layout4zoom()
  }, {
    transition: {
      duration: ms,
      easing: 'linear-in'
    }
  })
}
animateZoomBack = function(ms=3500){
  let ly= get_layout4zoom();
  ly.geo.projection.scale=1
  Plotly.animate(widget, {
    layout: ly
  }, {
    transition: {
      duration: ms,
      easing: 'cubic-in-out'
    }
  })
}

resetPlayLat = function(){
  let ly=get_layout_center_geo();
  ly.geo_projection.rotation.lat = lyStart.geo_projection.rotation.lat;
  Plotly.relayout(widget, {geo: {projection: {rotation: ly.geo_projection.rotation, type: "orthographic"}}});
}


get_layout4zoom = function(){
let ly=get_layout_center_geo();
ly.geo_projection.scale=5;
let zoomLy= {geo: {center: ly.center, projection: ly.geo_projection}};
return zoomLy;
}



function get_layout_center_geo(){
  let center=widget._fullLayout.center;
  let geo_projection=widget._fullLayout.geo.projection;
  return {center: center, geo_projection: geo_projection}
}

