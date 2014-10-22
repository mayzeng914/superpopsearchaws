// This encapsulates javascript
$.fn.exists = function () {
    return this.length !== 0;
}

$(function(){
	  
	  var heartOverlay = $('.heart-overlay');
	  var searchOverlay = $('.search-overlay');
	  var userExists = $('.profile-data').exists();
	  console.log(userExists);

	  if (userExists){
	  	$(document).on('keypress', function(event){
		  	var code = event.keyCode || event.which;
		  	// a - z, A - Z, numbers
		  	if ((code >= 65 && code <= 90) || (code >= 97 && code <= 122 || code >= 48 && code <= 57)){
		  		console.log('Only a-z or A-Z has been pressed, or 0 - 9');
		  		console.log(code);	
		  		searchOverlay.removeClass('fadeOut').addClass('fadeIn');
		  	}
		 });
	  }
	  
	  // This is to capture an escape key
	  $(document).on('keyup', function(event){
	  	var code = event.keyCode || event.which;
	  	console.log(code);
	  	// escape key
	  	if (code == 27){
	  		searchOverlay.removeClass('fadeIn').addClass('fadeOut');
	  	}
	  });

	  // Dbl click shows a heart and then saves the image
	  $('.Image_Wrapper').on('dblclick', function(){
	  	var heartOverlay = $(this).find('.heart-overlay');
	  	heartOverlay.removeClass('fadeOut').addClass('fadeIn');
	  	setTimeout(function(){
	  		heartOverlay.removeClass('fadeIn').addClass('fadeOut');
	  	}, 800);

	  	var post_url = $(this).find('.instaImage').attr('src');
	  	var user_id = $('.profile-data').attr('data-id');
	  	console.log(user_id);
	  	
	  	// Use a POST to save our image url to Photos
	  	$.ajax({
	      type: 'POST',
	      data: 'photo_url=' + post_url + '&user_id=' + user_id, //id=17446&chru=0
	      success: function() { console.log('SUCCESS!') },
	      error: function(){ console.log('FAILURE!!!') },
	      url: '/photos/saver',
	      cache:false
    	});
	  });


});