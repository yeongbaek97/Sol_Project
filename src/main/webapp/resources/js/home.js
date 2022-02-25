$(function() {
    var ticker = function() {
        timer = setTimeout(function() {
            $('#ticker li:first').animate( {marginTop: '-20px'}, 400, function() {
                $(this).detach().appendTo('ul#ticker').removeAttr('style');
            });
            ticker();
        }, 2000);         
    };
      
    var tickerover = function() {
    	$('#ticker').mouseover(function(){
    		clearTimeout(timer);
    	});
    	
    	$('#ticker').mouseout(function(){
    		ticker();
    	});  
    };
    
  tickerover();
  ticker();
  
});

