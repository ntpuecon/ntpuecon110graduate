$(function(){


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
