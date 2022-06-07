$(function(){
  $("#globeSwitch").change(
    function(){$("#globeplace").toggle();});

  $("#zoom-in").click(earthZoomIn);
  $("#zoom-out").click(earthZoomOut);

  $("#setting").click(function(){
    $("#controlContainer").toggle();
  });
  $(".top-control").click(function(){rotate_globe2()});
  $(".bottom-control").click(function(){rotate_globe2(-5)});
  $(".left-control").click(function(){rotate_globe()});
  $(".right-control").click(function(){rotate_globe(-15)});

})

toggle_globe = function(){
  $("#globeplace").toggle()
}
earthZoomIn = function(){
 if(currentScale>1){
  currentScale=currentScale-1;
  Plotly.relayout(
    widget,
    {
      height: container_height*scales[currentScale],
      width: container_width*scales[currentScale]
    }
  );

  let newh =container_height*scales[currentScale];
  let neww =
    container_width*scales[currentScale];
  $("#globeplace").height(newh);
  $("#globeplace").width(neww);
  }

}
container_width =260;
container_height = 260;
scales = [1.5, 1.4, 1.3, 1.2, 1, .8, .6, .4, .3];
currentScale=4
earthZoomOut= function(){
  if(currentScale<8){
  currentScale=currentScale+1;

  Plotly.relayout(
    widget,
    {
      height: container_height*scales[currentScale],
      width: container_width*scales[currentScale]
    }
  );

  let newh =container_height*scales[currentScale];
  let neww =
    container_width*scales[currentScale];
  $("#globeplace").height(newh);
  $("#globeplace").width(neww);
  }
}
