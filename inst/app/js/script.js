$(function(){
  var elems = document.querySelectorAll('.datepicker');
  var instances = M.Datepicker.init(elems, {
    min: new Date(2016, 5, 20),
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 15 // Creates a dropdown of 15 years to control year
  });

})
