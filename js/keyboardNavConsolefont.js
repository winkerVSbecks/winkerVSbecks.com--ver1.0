document.onkeyup = KeyCheck;       
 
	function KeyCheck(e)
		{
		   var KeyID = (window.event) ? event.keyCode : e.keyCode;
 
		   switch(KeyID)
		   {
 
		   }
		}
		
		document.onkeyup = KeyCheck;       
 
	function KeyCheck(e)
		{
		   var KeyID = (window.event) ? event.keyCode : e.keyCode;
 
		   switch(KeyID)
		   {
 
		      case 37:
		      window.location = "Dial-A-Car.html";
		      break;
			   
		      case 39:
		      window.location = "firefox-commercials.html";
		      break;

		   }
		}
		
		
function gotoUrl(url) {
 window.location = url;
} 