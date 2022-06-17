$(function(){

  $("div.sizecontainer-sizeadjustment-plus").click(function(){
    increaseGlobesize();
  });

  $("div.sizecontainer-sizeadjustment-minus").click(function(){
    decreaseGlobesize();
  });

  $("#globeopaque").click(opacityChange);
  $("div.sizecontainer-sizeadjustment-reset").click(function(){
    document.querySelector("a.modebar-btn[data-attr=reset]").dispatchEvent(new Event("click"));
  });

  /*$(".carousel").click(function(){
  if(tintId!=null){
  clearInterval(tintId);
    tintId=null;
    $("#play_arrow").toggle();
    $("#stop").toggle();
  }
  }); */
sizeControlDown = function () {
    var div = $(".sizecontainer-sizeadjustment");

    var height = div.height();

    div.css({
        overflow: "hidden",
        marginTop: 0,
        height: height
    }).animate({
        marginTop: height,
        height: 0
    }, 500, function () {
        $(this).css({
            display: "none",
            overflow: "",
            height: "",
            marginTop: ""
        });
    });
};
sizeControlUp = function () {
    var div = $(".sizecontainer-sizeadjustment:not(:visible)");

    var height = div.css({
        display: "block"
    }).height();

    div.css({
        overflow: "hidden",
        marginTop: height,
        height: 0
    }).animate({
        marginTop: 0,
        height: height
    }, 500, function () {
        $(this).css({
            display: "",
            overflow: "",
            height: "",
            marginTop: ""
        });
    });}

sizeControlToggle = function(){
        if(currentSizeToggle === 0){
          currentSizeToggle=1 } else {
            currentSizeToggle=0
          }
        globe_toggleFunctions[currentSizeToggle]()
}
globe_toggleFunctions = [sizeControlUp, sizeControlDown];
currentSizeToggle=1;

  sizeControlDown();


  $(".sizecontainer-iconsize").click(
    sizeControlToggle
  );


})

globe_sizeRange=[150, 200, 230, 264, 300, 320, 350];
currentGlobeSize=3;
increaseGlobesize = function(){
  if(currentGlobeSize >= 6) return;
  currentGlobeSize +=1;
  resize_globe(globe_sizeRange[currentGlobeSize]);
}
decreaseGlobesize = function(){
  if(currentGlobeSize<=0) return;
  currentGlobeSize -=1;
  resize_globe(globe_sizeRange[currentGlobeSize]);
}
resize_globe2 = function(size){
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
opacityStatus=0;
  opacityToggle0 = function(){
    $("#globeopaque > i").css("opacity",1);
    $(".globe-outercontainer").css("opacity", 0.4);
    opacityStatus=1;
  }
  opacityToggle1 = function(){
    $("#globeopaque > i").css("opacity",0.4);
    $(".globe-outercontainer").css("opacity", 1);
    opacityStatus=0;
  }
  opacityToggleFuns = [opacityToggle0, opacityToggle1];
opacityChange=function(){
  opacityToggleFuns[opacityStatus]()
}
