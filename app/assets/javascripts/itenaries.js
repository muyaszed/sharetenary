$(document).on('turbolinks:load', function() {

	
	$("#shareBtn").on("click", function(){
		
		var theUrl = gon.currentURL+"/";
		console.log(theUrl);
		FB.ui({
	    method: 'share',
	    display: 'popup',
	    href: theUrl,
	  }, function(response){});


	});
	  
	





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