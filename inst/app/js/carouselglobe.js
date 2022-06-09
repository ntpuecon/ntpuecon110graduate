$(function(){

  // $("#switchPosition").toggleClass("move-back");
   $("#switchPosition").click(function(){
     $(".globe-outercontainer").toggleClass("move-back");
   });
/*
  $("#sidenav-play").click(function(){
    tintId=setInterval(function(){greetingGallery.next()},2000);
  })
  $("#sidenav-play").click(function(){
      $("#sidenav-play").toggle();
      $("#sidenav-stop").toggle();
    });
  $("#sidenav-stop").click(function(){
   // clearInterval(tintId);
    $("#sidenav-play").toggle();
    $("#sidenav-stop").toggle();
  });*/
  /*
  $("#sidenav-play").click(function(){
      $("#sidenav-play").toggle();
      $("#sidenav-stop").toggle();
    })
   $("#sidenav-stop").click(function(){
    $("#sidenav-play").toggle();
    $("#sidenav-stop").toggle();
  })*/






$("#zoom-in").click(zoomIn);
$("#zoom-out").click(zoomOut);

})
sizeRange=[150, 200, 230, 264, 300, 320, 350];
currentSize=3;
zoomIn = function(){
  if(currentSize >= 6) return;
  currentSize +=1;
  resize_globe(sizeRange[currentSize]);
}
zoomOut = function(){
  if(currentSize<=0) return;
  currentSize -=1;
  resize_globe(sizeRange[currentSize]);
}
resize_globe = function(size){
  //$("#globeplace").toggle();
//setTimeout(function(){
$(".globe-outercontainer").width(size+50)
$(".globe-outercontainer").height(size+50)
$("#globeplace").width(size+50);
  $("#globeplace").height(size+50);
  Plotly.relayout(
  widget,
  {width: size, height: size });

  setTimeout(
  function(){
  Plotly.relayout(
  widget,{geo: {projection: {type: "orthographic"},
  showland: true, showocean: true, oceancolor: "#e3f2fd", bgcolor:"#00000000", landcolor:"#fff8e1"}}
)
}, 200
)
//$("#globeplace").toggle();

}
