// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .
/* 
DOES NOT WORK WHEN ANGULAR IS SETUP
ask why dislikeCount does not work.. ? */


$(document).ready(function() {
	$('.dislike-link').on('click', function(event) {
		var likeCount = $(this).siblings('.dislike-count')
		event.preventDefault();

		$.post(this.href, function(response) {
			
			likeCount.text(response.new_dislike_count + response.new_sentence)
		});
	});
	$('.like-link').on('click', function(event) {
		var likeCount = $(this).siblings('.like-count')
		event.preventDefault();

		$.post(this.href, function(response) {
			likeCount.text(response.new_like_count + response.new_sentence)
		});

	});

});

// Pusher 






// jQuery to collapse the navbar on scroll
$(window).scroll(function() {
    if ($(".navbar").offset().top > 50) {
        $(".navbar-fixed-top").addClass("top-nav-collapse");
    } else {
        $(".navbar-fixed-top").removeClass("top-nav-collapse");
    }
});

// jQuery for page scrolling feature - requires jQuery Easing plugin
$(function() {
    $('a.page-scroll').bind('click', function(event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: $($anchor.attr('href')).offset().top
        }, 1500, 'easeInOutExpo');
        event.preventDefault();
    });
});

// Closes the Responsive Menu on Menu Item Click
$('.navbar-collapse ul li a').click(function() {
    $('.navbar-toggle:visible').click();
});
