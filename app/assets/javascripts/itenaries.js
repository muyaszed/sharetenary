$(document).ready(function() {

	$("#new-item").on("click", function() {

		$("#item-form").show();
		// console.log($("#item-list").children("li").length)
		if ($("#item-list").children("li").length === 0) {
			$("#day-numbering").html("1");
			$("#item_day").val("1");
		}else {
			// console.log($("#item-list").children("li").last().attr("id").slice(-1));
			$("#day-numbering").html(
				
				parseInt($("#item-list").children("li").last().attr("id").slice(-1)) + 1
			);
			$("#new_item").find("#item_day").val(
				parseInt($("#item-list").children("li").last().attr("id").slice(-1)) + 1	
			);
		}
		$("#new_item").find("input[type=text]").not("#item_day").val("");
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