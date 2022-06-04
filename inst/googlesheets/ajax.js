jQuery.ajax({
        type: "GET",
        crossOrigin: true,
        url: "webAppUrl", //Enter your script url obtained in Step 7
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
