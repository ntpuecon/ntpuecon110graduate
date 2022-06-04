option1 = {defaultDate: new Date(2002, 1, 1)};
option1.setDefaultDate = new Date(2001, 12, 1);

//https://stackoverflow.com/questions/50674764/materialize-css-datepicker-yearrange-not-working
option1.yearRange = [1992, 2005];
//option1.minDate = new Date(1998, 1, 1);
$(function(){
  var elems = document.querySelectorAll('.datepicker');
  instances = M.Datepicker.init(elems,
    option1
  );
})
