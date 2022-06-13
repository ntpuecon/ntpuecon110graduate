$(function(){
	// ---- this would be the plugin ----
	// special event for non-preventDefault
	jQuery.event.special.touchstart = {
		setup: function( _, ns, handle ){
			if ( ns.includes("noPreventDefault") ) {
			  console.log("passive events");
			  this.addEventListener("touchstart", handle, { passive: true });
			} else {
			  console.log("non-passive events");
				return false;
			}
		}
	};
	// -----------------------------------

  $output_frame = $("#output_frame");
  $output_frame.on('DOMSubtreeModified', function(){
  console.log('changed');
});

  $inputName=$("#inputName");
  $inputId=$("#inputId");
  $inputBday=$("#inputBday");
  $inputWords=$("#inputWords");

  clearTrees();

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
