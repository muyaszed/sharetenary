// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require social-share-button
//= require cocoon
//= require ckeditor/init
//= require_tree .

$(document).on('turbolinks:load', function() {
  $(function(){ $(document).foundation(); });
  

  if (Foundation.MediaQuery.atLeast('medium')) {
	// console.log($("#logo").children(":first").html());
		 $("#logo").children(":first").removeClass("text-center");
	  $("#logo").detach().prependTo("#logo-web");
	  $("#tag-line").detach().appendTo("#logo-web");
	  $("#tag-line").removeClass("text-center");
	}

	$("#new-item").on("click", function() {
		
		$("#item-form").show();
		 
	});
	

	hideDeleteButton();

	// $(".add-sub-item").on('cocoon:after-insert', function() {
	// 	console.log($(".ckeditor").closest('form').attr('id'));
 //        var id = $(".ckeditor").closest("form.edit_item").attr('id');
	// 	id = id.split("_");
	// 	id = id[id.length-1];
 //        $('.ckeditor').attr('id', $('#ckeditor').attr('id')+id);
 //      });

	
});

function makeIdForEditor() {
	
	$(".my-ckeditor").each(function() {
		var id = $(this).closest("form.edit_item").attr('id');
		id = id.split("_");
		id = id[id.length-1];
		console.log(id);
		var newId = $(this).attr("id")+id;
		CKEDITOR.replace($(this).attr("id"));
		

	});
}

function closeNewItem() {

		$("#item-form").hide();
		$(window).scrollTop(0);

}

function myFunction() {
	// $("#item-form").css("height", "100%");
}



function hideDeleteButton() {
		var lists = $("#item-list").children("li");
		for (i=0; i<lists.length-1; i++) {
			$(lists[i]).find(".delete-button").css("visibility", "hidden");
		}
	}