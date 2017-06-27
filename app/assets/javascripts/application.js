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
//= require_tree .

$(function(){ $(document).foundation(); });

$(document).ready(function() {
	if (Foundation.MediaQuery.atLeast('medium')) {
	// console.log($("#logo").children(":first").html());
	 $("#logo").children(":first").removeClass("text-center");
  $("#logo").detach().prependTo("#logo-web");
  $("#tag-line").detach().appendTo("#logo-web");
  $("#tag-line").removeClass("text-center");
}

});

function hideDeleteButton() {
		var lists = $("#item-list").children("li");
		for (i=0; i<lists.length-1; i++) {
			$(lists[i]).find(".delete-button").css("visibility", "hidden");
		}
	}