(function($) { 
	$(window).load(function(){		
		img_event();
		sec();
		sec2();
		sec3();
		$(window).scroll(function(e){
			var s = $(window).scrollTop();	// 현재 window scrollTop
			if(s>50){
				img_event();
				sec();
				sec2();
				sec3();
			}
		})
		function img_event(){
			$(".img-ani").each(function(){
				var w_t = $(window).scrollTop() + $(window).height();
				var i_t = $(this).offset().top;
				if(w_t > i_t + 200){
					$(this).addClass("img-aniload");
				}else{
					$(this).removeClass("img-aniload");
				}
			})
		}

//		img_event_remove();


		/******************************************
		* 이미지 effect remove event
		* img_event() 가 적용되었던 요소들을 초기화 시켜주겠습니다.
		******************************************/
		function img_event_remove(){
			$(".img-ani").removeClass("img-aniload");
		}
		
		// 스크립트
		function sec(){
			$(".yh_ani").each(function(){
				var w_t = $(window).scrollTop();
				var i_t = $(this).offset().top;
				var _thisH = $(this).height() / 2;
				if( w_t >= (i_t - 500) ){
					$(this).addClass("img-aniload");
				}else{
					$(this).removeClass("img-aniload");
				}		
			});
		}
		
		function sec2(){
			$(".yh_ani2").each(function(){
				var w_t = $(window).scrollTop();
				var i_t = $(this).offset().top;
				var _thisH = $(this).height() / 2;
				if( w_t >= (i_t - 700) ){
					$(this).addClass("img-aniload");
				}else{
					$(this).removeClass("img-aniload");
				}		
			});
		}
		
		function sec3(){
			$(".yh_ani3").each(function(){
				var w_t = $(window).scrollTop();
				var i_t = $(this).offset().top;
				var _thisH = $(this).height() / 2;
				if( w_t >= (i_t - 1000) ){
					$(this).addClass("img-aniload");
				}else{
					$(this).removeClass("img-aniload");
				}		
			});
		}
	})
	
} ) ( jQuery);


