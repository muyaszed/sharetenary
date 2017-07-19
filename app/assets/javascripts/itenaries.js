$(document).ready(function() {

	

// 	$(".add_fields").on("click", function() {
// 		console.log($(this).data());
// 		time = new Date().getTime();
// 		regexp = new RegExp($(this).data('id'), 'g');
// console.log(time);
// 		console.log(regexp);
// 		$(this).before($(this).data('fields').replace(regexp, time))
// 		event.preventDefault();
// 	});

// 	 $("a.remove_fields").on("click", function() { 
//     console.log("Hellor");
// 	    $(this).prev('input[type=hidden]').val('1');
// 	    $(this).closest('#sub-item-wrapper').hide();
// 	    event.preventDefault();
// 	  });

	
	// $(".close-button").on("click", function() {
	// 	$("#item-form").hide();
	// 	$(".edit-item-form").hide();
	// })

	//allow only the last item to have delete button
	// hideDeleteButton();
	
	



});

function openEdit(id) {
		
		$("#edit-item-form-"+id).show();
		$(window).scrollTop(0);
}

function openDel(id) {
	
	$("#delete-item-form-"+id).show();
	$(window).scrollTop(0);
}

function closeEdit(id) {
	$("#edit-item-form-"+id).hide();
}

function closeDel(id) {
	$("#delete-item-form-"+id).hide();
}