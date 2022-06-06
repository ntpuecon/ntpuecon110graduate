var splitData={}
obtain_validGsData = function(gsData){
  valid_gsData=gsData.values.filter(function(a){return a.includes("TRUE")})
  update_splitData = function(arrayX){
    let idx=arrayX[2];
    if(!splitData[idx]){
      splitData[idx]=[arrayX];
    } else {
      splitData[idx].push(arrayX);
    }
  }
  valid_gsData.forEach(update_splitData);
  //return splitData;
}
get_gs_data = function(success){
  $.get( "https://sheets.googleapis.com/v4/spreadsheets/1AE7_zIHORciJF3QmFaQrWeq4c9gmhzyycOYO1FblRbk/values/Sheet1!A%3AF?key=AIzaSyCS5NWgJamT12ABAhNpXjYEnD7Zy3sg9n0", success);
}

get_validate_gsData = function(gsData){
  valid_gsData=gsData.values.filter(function(a){return a.includes("TRUE")})
}
reduce_validate_gsData = function(){
  valid_gsData=get_validate_gsData();

}
get_capitals_data = function(){
  $.get( "https://sheets.googleapis.com/v4/spreadsheets/1AE7_zIHORciJF3QmFaQrWeq4c9gmhzyycOYO1FblRbk/values/Capitals!A%3AD?key=AIzaSyCS5NWgJamT12ABAhNpXjYEnD7Zy3sg9n0", function( data ) {
    capitals =data;
  console.log( data );
});
}
processValidate_data=function(validates){
  valid_flat=validates.values.flat();
  localStorage.setItem("valid_flat", valid_flat.join(";"));
}
get_validate_data = function(success){
  $.get( "https://sheets.googleapis.com/v4/spreadsheets/1AE7_zIHORciJF3QmFaQrWeq4c9gmhzyycOYO1FblRbk/values/ValidInput!C%3AC?key=AIzaSyCS5NWgJamT12ABAhNpXjYEnD7Zy3sg9n0", success);
}

$(function(){
  get_gs_data(obtain_validGsData);
  //valid_gsData=obtain_validGsData();
})
