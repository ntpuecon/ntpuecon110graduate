$(function(){

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

  $output_frame = $("#output_frame");
  $output_frame.on('DOMSubtreeModified', function(){
  console.log('changed');
});

  $inputName=$("#inputName");
  $inputId=$("#inputId");
  $inputBday=$("#inputBday");
  $inputWords=$("#inputWords");
});

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
