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
