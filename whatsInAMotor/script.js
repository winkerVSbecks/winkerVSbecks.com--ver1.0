$(document).ready(function(){
	/* This code is executed after the DOM has been completely loaded */
	
	$('div.nav a').click(function(e){
										  
		// If a link has been clicked, scroll the page to the link's hash target:
		
		$.scrollTo( this.hash || 0, 500);
		e.preventDefault();
	});
	
	
	$('div.title a').click(function(e){
										  
		// If a link has been clicked, scroll the page to the link's hash target:
		
		$.scrollTo( this.hash || 0, 500);
		e.preventDefault();
	});

});