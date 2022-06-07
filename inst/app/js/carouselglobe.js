$(function(){
  var elemsSidenav = document.querySelectorAll('.sidenav');
    var instancesSidenav = M.Sidenav.init(elemsSidenav, {
      // specify options here
    });

    var elemsCarousel = document.querySelectorAll('.carousel');
    instCarousel = M.Carousel.init(elemsCarousel, {
      // specify options here
    });
    widget.on("plotly_click",function(){$(".globe-container2").css("z-index",1)});
    $(".carousel-item").click(function(){$(".globe-container2").css("z-index",-1)});

})
