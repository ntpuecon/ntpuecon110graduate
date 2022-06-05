function rotate_globe(){
  currentLon=widget.layout.geo.projection.rotation.lon;

  Plotly.animate(widget,
  {layout: {geo: {projection: {rotation: {lon: currentLon+15}}}}},
  {
      transition: {
        duration: 100
      },
      frame: {
        duration: 100
      }
    }
  );
}
function animateRotation(){
  intervalID = setInterval(
    function(){requestAnimationFrame(rotate_globe);},200);

}
var intervalID;
stopRotation=function(){
    clearInterval(intervalID);
  }
$(function(){
  widget.on("plotly_click", stopRotation, {passive: true});
})


