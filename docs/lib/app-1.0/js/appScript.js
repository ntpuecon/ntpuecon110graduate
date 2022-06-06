get_gs_data = function(){
  $.get( "https://sheets.googleapis.com/v4/spreadsheets/1AE7_zIHORciJF3QmFaQrWeq4c9gmhzyycOYO1FblRbk/values/Sheet1!A%3AE?key=AIzaSyCS5NWgJamT12ABAhNpXjYEnD7Zy3sg9n0", function( data ) {
    gsData =data;
  console.log( data );
});
}

get_capitals_data = function(){
  $.get( "https://sheets.googleapis.com/v4/spreadsheets/1AE7_zIHORciJF3QmFaQrWeq4c9gmhzyycOYO1FblRbk/values/Capitals!A%3AD?key=AIzaSyCS5NWgJamT12ABAhNpXjYEnD7Zy3sg9n0", function( data ) {
    capitals =data;
  console.log( data );
});
}
get_validate_data = function(){
  $.get( "https://sheets.googleapis.com/v4/spreadsheets/1AE7_zIHORciJF3QmFaQrWeq4c9gmhzyycOYO1FblRbk/values/ValidInput!C%3AC?key=AIzaSyCS5NWgJamT12ABAhNpXjYEnD7Zy3sg9n0", function( data ) {
    validates =data;
  console.log( data );
});
}
