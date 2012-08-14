$(function() {
    $('#slideshow').cycle({
        fx:     'scrollLeft',
        speed:  'fast',
        timeout: 3000,
        pager:  '#nav',
		slideExpr: 'img'
    });
});