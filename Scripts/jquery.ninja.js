(function ($) {
	
	//Handles Menu Drop Down
	$.fn.dropdown = function(start, finish){
		this.find("li").click(function(){
			var pos = $(this).find(".menu-sub-item").css("top");
			if (pos == "-325px") {
				$(this).find(".menu-sub-item").stop().animate({top:finish},200); //"51px"
			} else {
				$(this).find(".menu-sub-item").stop().animate({top:start},400);//"-325px"
			}
		});
		$(document).click(function() {
			$(".menu-sub-item").each(
				function() {
				var pos = $(this).css("top");
				if (pos == finish) { //"51px"
					$(this).stop().animate({top:start},400);//"-325"
				}
			});
		});
		/*$(".menu-sub-item").click(function(e){
			e.stopPropagation();
		});*/	
	};
	
	//Handles Page Scroll
	$.fn.pageScroll = function(speed,easing){
		speed = speed || '250';
		easing = easing || 'swing';
		
		$(this).click(function(){
			var rel= $(this).attr('rel');
			if($(rel).css('display')!='none')
			{
				return false;
			}		
			$(rel).css("display", "block");
			
			$('.page').each(function(){
				$(this).stop(true,true).animate({left:'-=100%'},speed,easing, 
					function(){
						if('#' + $(this).attr('id')!=rel)
						{
							var hideID = '#' + $(this).attr('id');
							$(hideID).css({'left':'100%','display':'none'});
						}
				});
			});
		});
	
	};
	
	//Handles modal popup
	$.fn.modalPopup = function(){
		$(this).click(function(){
			$(".close, .modal-background").remove();
			
			var rel = $(this).attr("rel");
			var container = $(rel).children(".modal-container")
			var w = $(container).outerWidth();
			var h = $(container).outerHeight();
		
			var top = (parseInt(h)/2) * -1;
			var left = (parseInt(w)/2) * -1;
				
			$(container).before("<div class='modal-background' style='position: fixed; left: 0px; top: 0px; z-index: 10000; width: 100%; height: 100%;'></div>");
			$(container).css({'position':'fixed','z-index':'10001', 'top':'45%', 'left':'50%', 'margin-top': top, 'margin-left': left});
			$(container).append("<div class='close'></div>");
			
			$(".close").on('click',function(){
				$(rel).fadeOut();
			}); 
		
			$(rel).stop(true,true).fadeIn();

			return false;
		});
	};
	
}(jQuery));	

