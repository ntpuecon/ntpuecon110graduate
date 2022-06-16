$(function(){
var elemsSidenav = document.querySelectorAll('.sidenav');
    var instancesSidenav = M.Sidenav.init(elemsSidenav, {
      edge: 'right'
      // specify options here
    });
    var elemsCarousel = document.querySelectorAll('.carousel');
    /*instCarousel = M.Carousel.init(elemsCarousel, {
      // specify options here
    }); */
  // pick Date
  option1 = {defaultDate: new Date(2000, 1, 1)};
option1.setDefaultDate = new Date(2000, 1, 1);

//https://stackoverflow.com/questions/50674764/materialize-css-datepicker-yearrange-not-working
option1.yearRange = [1973, 2000];
//option1.minDate = new Date(1998, 1, 1);
option1.dateFormat="yyyy-mm-dd"

  var elemsdp = document.querySelectorAll('.datepicker');
  instancesdp = M.Datepicker.init(elemsdp,
    option1
  );

  var elemsModal = document.querySelectorAll('.modal');
    var instancesMdl = M.Modal.init(elemsModal);

  //$submitbutton = $("#submit");
  //$submitbutton.click(send_data);





  $pushpin = $(".pushpin");


  $pushpin.pushpin();


})
