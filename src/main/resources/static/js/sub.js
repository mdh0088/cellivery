$(function(){
	
	
	$('.sub_banner .sub_nav_wrap p').click(function(){
		$(this).toggleClass('on')
		$('.sub_banner .sub_nav').slideToggle(500)
	})
	$(window).resize(function(){
		if($(window).width() > 767){
			$('.sub_banner .sub_nav_wrap p').removeClass('on')
			$('.sub_banner .sub_nav').css('display','flex')
		}else{
			$('.sub_banner .sub_nav').css('display','block').hide()
		}
	})
	
	/* 셀렉트박스 클릭 */
	$('.sub_search_box .select_box').click(function(){
		$('.sub_search_box .select_box ul').stop().slideUp()
		$(this).find('ul').stop().slideToggle()
		$(this).toggleClass('active')
	})

	/* odm페이지 탭 클릭 후 새로고침시 세션저장 */
	var modechk = sessionStorage.getItem("tab");
	if(modechk == "1"){
		$('.odm .sub_title').removeClass('active')
		$('.odm .sub_title').eq(1).addClass('active')
		$('.sub_content_tab li').removeClass('active')
		$('.sub_content_tab li').eq(1).addClass('active')
		$('.tab-content').hide()
		$('.tab-content').eq(1).show()
	}else{
		$('.odm .sub_title').removeClass('active')
		$('.odm .sub_title').eq(0).addClass('active')
		$('.sub_content_tab li').removeClass('active')
		$('.sub_content_tab li').eq(0).addClass('active')
		$('.tab-content').hide()
		$('.tab-content').eq(0).show()
	}
	/* odm 페이지 탭 클릭*/
	$('.sub_content_tab li').click(function(){
		var idx = $(this).index()
		console.log(idx)
		
		if($(this).index()==2){
			alert('준비중입니다')
			return false;
		}else{
			$('.odm .sub_title').removeClass('active')
			$('.odm .sub_title').eq(idx).addClass('active')
			$('.sub_content_tab li').removeClass('active')
			$(this).addClass('active')
			$('.tab-content').hide()
			$('.tab-content').eq(idx).show()
			sessionStorage.setItem("tab", idx );
		}
	})
	
	/* 컨텐츠 위로 올라오는 효과 */
	txtEffect();
	$(window).scroll(function(e){
	
			txtEffect();
			
	})
	function txtEffect(){
		$(".txtEffect").each(function(){
			var w_t = $(window).scrollTop();
			var i_t = $(this).offset().top;
			if(w_t + 900 > i_t){
				$(this).addClass("on");
			}else{
				$(this).removeClass("on");
			}
		})
	}

	/* 로드시 서브내비 효과 */
	$(window).load(function(){

		$('.sub_banner .sub_nav li.on').addClass('active')
		
	})
	
	/* 유튜브 클릭시 좌측 큰 박스에 나타나기 -- // 220128 유튜브로 변경 - 수정 */
	if($('.youtube_ul li').length > 0){
		$('.youtube_ul li').click(function(){
			$('.youtube_ul li').removeClass('on')
			$(this).addClass('on')
			var address = $(this).find('.iframe_box iframe').attr('src'),
				title = $(this).find('.sm_txt').text(),
				cate = $(this).find('.li_tit span').text();
			console.log(address)
			$('.sns_youtube .sns_big .img_box iframe').attr('src',address)
			$('.sns_youtube .sns_big').find('.sm_txt').text(title)
			$('.sns_youtube .sns_big').find('.li_tit span').text(cate)
			
		})
	}
	/* odm - Our strangth  */
	if($('.odm .sec04-ul').length > 0){
		$('.odm .sec04-ul li').click(function(){
			
			if($(this).find('.con-box').css('display')=='block'){
				$(this).find('.con-box').slideUp()
				$(this).removeClass('on')
			}else{
				$('.odm .sec04-ul li').find('.con-box').slideUp()
				$(this).find('.con-box').slideDown()
				$('.odm .sec04-ul li').removeClass('on')
				$(this).addClass('on')
			}
			
			
		})
	}
	
	if($('.sec05-ul-slide-wrap').length > 0){
		$('.sec05-ul-slide-wrap').slick({
	       slidesToShow: 1,
	       slidesToScroll: 1,
	       autoplay: false,
	       autoplaySpeed: 5000,
	       focusOnSelect: true,
	       speed:1000,
	       arrows:true,
	       prevArrow : "<button type='button' class='slick-prev'><img src='img/arrow-left.png' alt='셀리버리L&H'></button>",		// 이전 화살표 모양 설정
	       nextArrow : "<button type='button' class='slick-next'><img src='img/arrow-right.png' alt='셀리버리L&H'></button>",		// 다음 화살표 모양 설정	     
	       dots:true
	     });
	}
	
	
	if($('.address-box').length > 0){
		$('.map-container .address-box li').click(function(){
			$('.map-container .address-box li').removeClass('on')
			$(this).addClass('on')
			var i = $(this).index()
			$('.map-container .map-box > iframe').hide()
			$('.map-container .map-box > iframe').eq(i).show()
		})
	
	}
	
	$(".inquiry-box li").each(function(){			
			$(this).mousemove(function(e) {
			
				
			   
			  var relativeXPosition =  e.pageX - $(this).offset().left;
			  var relativeYPosition =  e.pageY - $(this).offset().top
		      

			   console.log(e.clientX,'e.clientX')
			   console.log(this.offsetLeft,'this.offsetLeft')
			   
			 
		       
		        $(this).find( ".shadow-box" ).css({"top":relativeYPosition+"px", "left":relativeXPosition+"px"});
		        $( ".shadow-box" ).hide()
		        $(this).find( ".shadow-box" ).show()
			  
			}).mouseleave(function(){
				$( ".shadow-box" ).hide()
			});					
			
		});
	
	
	
})