$(document).ready(function() {

	





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