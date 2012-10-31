$(document).ready(function(){

	  
		 $('#slides .left')
	.click(function()
	       {
		   var inner = $(this).siblings('#slides .slide_container')
		   ,   first = inner.children(':last')
		   

		   first.prependTo(inner).fadeOut('fast')
		   inner.children(':last').fadeIn('fast')

	       })

    $('#slides .right')
	.click(function()
	       {
		   var inner = $(this).siblings('#slides .slide_container')
		   ,   last  = inner.children(':first')
		   ,   first = inner.children(':last')

		   first.fadeOut('fast')
		   last.appendTo(inner).fadeIn('fast')
		  
	       })

});
