$(function(){
   $("#play_arrow").click(function(){
      tintId=setInterval(function(){greetingGallery.next()},2000);
      $("#play_arrow").toggle();
      $("#stop").toggle();
    });
  $("#stop").click(function(){
    clearInterval(tintId);
    tintId=null;
    $("#play_arrow").toggle();
    $("#stop").toggle();
  });
  $(".carousel").click(function(){
  if(tintId!=null){
  clearInterval(tintId);
    tintId=null;
    $("#play_arrow").toggle();
    $("#stop").toggle();
  }
  });
speedControlDown = function () {
    var div = $(".speedcontainer-speedadjustment");

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
speedControlUp = function () {
    var div = $(".speedcontainer-speedadjustment:not(:visible)");

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

speedControlToggle = function(){
        if(currentToggle === 0){
          currentToggle=1 } else {
            currentToggle=0
          }
        toggleFunctions[currentToggle]()
}
toggleFunctions = [speedControlUp, speedControlDown];
currentToggle=1;

  speedControlDown();


  $(".speedcontainer-iconspeed").click(
    speedControlToggle
  );


})

