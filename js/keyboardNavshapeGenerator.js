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
		      window.location = "evolve.html";
		      break;
			   
		      case 39:
		      window.location = "tetheredMotion.html";
		      break;

		   }
		}
		
		
function gotoUrl(url) {
 window.location = url;
} 
