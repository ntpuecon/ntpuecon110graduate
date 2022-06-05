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
