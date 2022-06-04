$(function(){

  $form = $("form");
  console.log($form);

  $inputName=$("#inputName");
  $inputId=$("#inputId");
  $inputBday=$("#inputBday");
  $inputWords=$("#inputWords");

data = {}

get_data = function(){
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
