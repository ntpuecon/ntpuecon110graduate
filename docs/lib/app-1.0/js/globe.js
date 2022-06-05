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
