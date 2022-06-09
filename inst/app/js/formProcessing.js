refresh_carousel = function(){
  get_gs_data(function(e){
    $("#greetingGallery").empty();
    gsData=e;
    // compute valid gsData.values row numbers: seq_alongData
    whichDataStop=gsData.values.findIndex(function(e){return e.length!=9})
    seq_alongData = Array(whichDataStop-1).fill().map((e,i) => i+1);
    split_gsData = {};
    seq_alongData.map(
      function(x){
         let valueX = gsData.values[x];
         split_gsData[valueX[0]]=valueX
         let greetingX = card_greeting(valueX[8], valueX[5], valueX[0])
         $("#greetingGallery").append(greetingX);
         M.Carousel.init($("#greetingGallery"));
         greetingGallery = M.Carousel.getInstance($("#greetingGallery"));
      });
    });
}
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
  $.get( "https://sheets.googleapis.com/v4/spreadsheets/1AE7_zIHORciJF3QmFaQrWeq4c9gmhzyycOYO1FblRbk/values/Unique_Posts!A%3AI?key=AIzaSyCS5NWgJamT12ABAhNpXjYEnD7Zy3sg9n0", success);
}

get_validate_gsData = function(gsData){
  valid_gsData=gsData.values.filter(function(a){return a.includes("TRUE")})
}
reduce_validate_gsData = function(){
  valid_gsData=get_validate_gsData();

}
get_capitals_data = function(success){
  $.get( "https://sheets.googleapis.com/v4/spreadsheets/1AE7_zIHORciJF3QmFaQrWeq4c9gmhzyycOYO1FblRbk/values/Capitals!A%3AD?key=AIzaSyCS5NWgJamT12ABAhNpXjYEnD7Zy3sg9n0", success);
}
seq_along = function(a){
  return Array(a.length).fill().map((e,i)=>i);
}
capitalDict={}
capitalsDictionary = function(capitals){
  seq_along(capitals.values).map(
    function(x){
      capitalDict[capitals.values[x][0]]=capitals.values[x]
    }
  )
}
processValidate_data=function(validates){
  valid_flat=validates.values.flat();
  localStorage.setItem("valid_flat", valid_flat.join(";"));
}
get_validate_data = function(success){
  $.get( "https://sheets.googleapis.com/v4/spreadsheets/1AE7_zIHORciJF3QmFaQrWeq4c9gmhzyycOYO1FblRbk/values/ValidInput!C%3AC?key=AIzaSyCS5NWgJamT12ABAhNpXjYEnD7Zy3sg9n0", success);
}
dblclickGetTree = function(capitals){
  capitalsData = capitals;
  capitalsDictionary(capitalsData);
  $(".carousel").dblclick(function(){
    countryName = $(".carousel-item.active")[0].ariaLabel;
    lat=capitalDict[countryName][2];
    lon=capitalDict[countryName][3];
    targetTree(lat, lon);
  })
}
content_paragraph = function(content){
  let result='';
  let ct = content.replace(/\n+/,"\n");
  //ct.split("\n").forEach(
  /\n+/[Symbol.split](ct).forEach(
    function(p){
    console.log(p);
      result+='<p class="flow-text">'+p+'</p>';
    });
  return result;
}

card_greeting=function(content, signature, country){
  let content2=content_paragraph(content);
  let greetingHTML = `
  <a class="carousel-item" aria-label="${country}" data-country="${country}">
  <div class="card-greeting">
        <div class="divider"></div>
        <div class="section elegant-scroll">
          ${content2}
        </div>
        <div class="divider"></div>
        <div class="signature">
          <div class="signature-img" style="background:center no-repeat url(lib/appImg-1.0.0/tree.png);background-size:contain;"></div>
          <div class="signature-name">${signature}</div>
        </div>
      </div></a>`;
  return greetingHTML;
}

get_latestPosts= function(){
  latestPosts = Object.entries(splitData).map(item => {return item[1][item[1].length-1]});
  return latestPosts;
}
update_postData = function(){
 get_gs_data(obtain_validGsData);
}
update_greetingCarousel = function(){
update_postData();
  setTimeout(
  () => {
  $("#greetingGallery").empty();
  posts = get_latestPosts();

  posts.forEach(function(post_i){
    let content_i = post_i[4];
    let signature_i =post_i[1];
    let greet_i = card_greeting(content_i, signature_i);
    $("#greetingGallery").append(greet_i);
  });

  var elemsgreetingGallery = document.querySelectorAll('.carousel');
  greetingGallery = M.Carousel.init(elemsgreetingGallery);
}, 2000);


};


$(function(){
  refresh_carousel();
  get_capitals_data(dblclickGetTree);
  //obtain valid_gsDat as an object with studentId
  // as key, his/her submission as array value whose last entry should be the latest.
  //get_gs_data(obtain_validGsData);
  //valid_gsData=obtain_validGsData();
})
