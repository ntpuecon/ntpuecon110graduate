$(function(){
  $form = $("form");

  $progressBar = $("#progress");

  $submitButton = $("#submitButton");
  $submitButton.click(post_data);
  check_valid_flat();
})
post_data = function(){
    $form.toggle();
    $progressBar.toggle();
    get_data();
    validate_submission();
    $.ajax({
    type: "POST",
    url: "https://script.google.com/macros/s/AKfycbzOL5ZUBa2QUtCwM-jMJ0x-KpeR0baxkLy90pLjSCN74BwzcxvgsdNfrprEBd3Zk_Jrew/exec",
    data: data,
    success: success,
    dataType: "json"
  });
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

check_valid_flat = function(){
  if(!localStorage.getItem("valid_flat")){
    get_validate_data();
    valid_flat=validates.values.flat();
    localStorage.setItem("valid_flat", valid_flat.join(";"));
  } else {
    valid_flat = localStorage.getItem("valid_flat").split(";");
  }
}

validate_submission = function(){
  get_data()
  data.valid = valid_flat.includes(data.schoolId+data.bday);
}

submitForm = function(){
  validate_submission();
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

