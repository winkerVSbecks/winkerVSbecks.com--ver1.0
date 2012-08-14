var current = 0;


$(document).ready(function(){
 $("#content").animate({ opacity: 1.0 }, 300, function() { });
 $(".case").click(function(){
 $(this).children(".desc").stop(true, true);
 $(this).children(".desc").slideDown("fast");
 },function(){
 $(this).children(".desc").stop(true, true);
 $(this).children(".desc").slideUp("slow");
 });
});

