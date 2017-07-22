
$(document).ready(function() {

	
	$("#shareBtn").on("click", function(){
		console.log(gon.currentURL);
		FB.ui({
	    method: 'share',
	    display: 'popup',
	    href: gon.currentURL,
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