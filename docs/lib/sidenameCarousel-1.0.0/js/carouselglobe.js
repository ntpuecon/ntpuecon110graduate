$(function(){

   widget.on("plotly_click",function(){$(".globe-container2").css("z-index",1)});
    $(".carousel-item").click(function(){$(".globe-container2").css("z-index",-1)});

})
