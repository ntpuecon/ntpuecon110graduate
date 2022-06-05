$(function(){

  $play=$("#play");
  $stop=$("#stop");
  $play.click(animateRotation);
  $stop.click(stopRotation);

  //$btnTree=$("#btn-tree");

  //$btnTree.click(function(){
  //  location.replace("/form.html")
  //})


  // pick Date
  option1 = {defaultDate: new Date(2002, 1, 1)};
option1.setDefaultDate = new Date(2001, 12, 1);

//https://stackoverflow.com/questions/50674764/materialize-css-datepicker-yearrange-not-working
option1.yearRange = [1992, 2005];
//option1.minDate = new Date(1998, 1, 1);

  var elems = document.querySelectorAll('.datepicker');
  instances = M.Datepicker.init(elems,
    option1
  );

  var elemsModal = document.querySelectorAll('.modal');
    var instancesMdl = M.Modal.init(elemsModal);

  //$submitbutton = $("#submit");
  //$submitbutton.click(send_data);

  $form = $("form");

  success=function(response){
    submitResponse=response;
    $progressBar.toggle();
    if(submitResponse.result==="success"){
      console.log("success");
      $("#success").toggle();
      $("#successtitle").toggle();
    }
    console.log(response);
  }
  $progressBar = $("#progress");

  post_data = function(){
    $form.toggle()
    $progressBar.toggle()
    get_data()
    $.ajax({
    type: "POST",
    url: "https://script.google.com/macros/s/AKfycbzOL5ZUBa2QUtCwM-jMJ0x-KpeR0baxkLy90pLjSCN74BwzcxvgsdNfrprEBd3Zk_Jrew/exec",
    data: data,
    success: success,
    dataType: "json"
  });
  }
  $submitButton = $("#submitButton");
  $submitButton.click(post_data);
  console.log($form);

  $(".pushpin").pushpin();

  $output_frame = $("#output_frame");
  $output_frame.on('DOMSubtreeModified', function(){
  console.log('changed');
});

  $inputName=$("#inputName");
  $inputId=$("#inputId");
  $inputBday=$("#inputBday");
  $inputWords=$("#inputWords");

data = {}

get_data = function(){
  data["timestamp"]=Date.now();
  data[$inputName.attr("name")]=
  $inputName.val() || '未填寫';
data[$inputId.attr("name")]=
  $inputId.val() || '未填寫';
data[$inputBday.attr("name")]=
  $inputBday.val() || '未填寫';
data[$inputWords.attr("name")]=
  $inputWords.val() || '未填寫';
console.log(data)
}
var datasent;
function send_data(){
        var form_data = document.getElementsByClassName("form-data"); //retrieve filled form data
        var i;
        var data = [];
        for(i=0; i<form_data.length; i++){
          data.push(form_data[i].value);
        }
        datasent=data;
        console.log(data);
        google.script.run.saveData(data); // send to google app script
        document.getElementById("form").style.display = "none"; // make form invisible
}
submitForm = function(){
jQuery.ajax({
        type: "GET",
        crossOrigin: true,
        url: "https://script.google.com/macros/s/AKfycbxgfsaTIynwLgLUNnAsGlTcnH3D_C1W7_l8lwgnQ41fCd2f_bo9VQN7Z_A3cumPgdl56w/exec", //Enter your script url obtained in Step 7
        data: data,
        success: function(response) {
			console.log("Result:"+response.result);
            if (response.result == 'success') {
                jQuery('#suce_message').show();
                jQuery("#contact-form")[0].reset();
            } else {
                jQuery('#err_message').show();
				console.log(response);
            }
        }
    });
}
/*submitForm = function(){
  $.ajax({
  type: 'POST',
  url: $form.attr("action"),
  data: data,
  contentType: 'application/json',
  dataType: 'jsonp',
  complete: function() {
    alert('資料已送出！');
  }
});
};*/


})
