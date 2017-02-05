$(document).ready(function() {

	$("#new-item").on("click", function() {
		$("#item-form").show();
	});

	$(".close-button").on("click", function() {
		$("#item-form").hide();
		$(".edit-item-form").hide();
	})


});

function openEdit(id) {
		
		var num = id.slice(7);

		$("#edit-item-form-"+num).show()
	}