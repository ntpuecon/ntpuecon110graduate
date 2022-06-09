$(function(){
  $("#globeSwitch").change(
    function(){$("#globeplace").toggle();});

  $("#zoom-in").click(earthZoomIn);
  $("#zoom-out").click(earthZoomOut);

  $("#setting").click(function(){
    $("#controlContainer").toggle();
  });

  $(".top-control").click(moveUp);
  $(".bottom-control").click(moveDown);

  $(".left-control").click(moveLeft);
  $(".right-control").click(moveRight);

/*
  $("#globeplace").css("bottom","5%");
  $("#globeplace")
  $(".top-control").click(function(){rotate_globe2()});
  $(".bottom-control").click(function(){rotate_globe2(-5)});
  $(".left-control").click(function(){rotate_globe()});
  $(".right-control").click(function(){rotate_globe(-15)});*/

})
  verticalPos=Array(8).fill().map(function(e, i){return (i+1)*10+'%'});
  horizontalPos=Array(8).fill().map(function(e, i){return (i+1)*10+'%'});
  vindex=0;
  hindex=0;
moveDown=function(){
    if(vindex>1){
    vindex=vindex-1;
    newVPosition=verticalPos[vindex]
    $("#globeplace").css("bottom",newVPosition);
  }
  }
moveLeft=function(){
    if(hindex>0){
    hindex=hindex-1;
    newVPosition=horizontalPos[hindex]
    $("#globeplace").css("left",newVPosition);
  }
  }

moveRight = function(){
    if(hindex<7){
    hindex=hindex+1;
    newVPosition=horizontalPos[hindex];
    $("#globeplace").css("left",newVPosition);
  }
  }
moveUp = function(){
    if(vindex<7){
    vindex=vindex+1;
    newVPosition=verticalPos[vindex];
    $("#globeplace").css("bottom",newVPosition);
  }
  }

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
