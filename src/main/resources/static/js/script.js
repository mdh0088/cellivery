$(document).ready(function() {
	
	
	/* hammenu */
	/* 220208 실서버 배포로 인한 주석처리*/
	 	$('.hammenu').click(function(){
		$('.header-left').toggleClass('off')
		$(this).toggleClass('on')
		setTimeout(function(){
			$('.menu span').toggleClass('on')
		},500)	
		
		$('.menu').toggleClass('on')
	})
	
	/* gnb 디자인 변경으로 인한 스크립트 추가 */
	 if($(window).width() < 768){
		 $('.ham-dep1 > li:not(:last-child) .tit span').click(function(e){
			e.preventDefault();
			if($(this).parent().siblings('.ham-dep2').css('display')=='block'){
				$(this).parent().siblings('.ham-dep2').stop().slideUp(500)
			}else{
				$('.ham-dep1 > li .tit span').parent().siblings('.ham-dep2').stop().slideUp(500)
				$(this).parent().siblings('.ham-dep2').stop().slideDown(500)
			}
			
		})
	 }
	 
	 	
//	팝업 스크롤 스크립트
	
	
	
	
	/*var url = window.location.href
	var arrayUrl = url.split('/')
	var temp ="준비중입니다.";
	if(arrayUrl[2]=='celliverylh.com'){
		$('.top_menu_pr').html(' <a href="/notice"  class="lato">PR</a>');
		//$('.top_menu_pr').html('<a onclick="javascript:alert(\''+temp+'\')"  class="lato">PR</a>');
		//$('.top_menu_rd').html('<a onclick="javascript:alert(\''+temp+'\')"  class="lato">R&AMP;D</a>');
		if($('.subpage.real-server').length > 0){
			$('.subpage').hide()
			$('.subpage.real-server').show()
		}
		
	}else{
		$('.top_menu_pr').html(' <a href="/notice"  class="lato">PR</a>');
		//$('.top_menu_rd').html(' <a href="/rnd"  class="lato">R&AMP;D</a>');
		$('.subpage').show()
		$('.subpage.real-server').hide()
	}
	*/
	

	
	$(window).scroll(function(){
		var scrTop = $(window).scrollTop();
		if(!$('.menu').hasClass('on')){
			if(scrTop > 100) {
				$('.header').addClass("fixed");
			} else {
				$('.header').removeClass("fixed");
			}
		}
		
		
	})
	
	
		
	var fullpageapi = new fullpage('#fullpage',{
		//options here
        /*menu: '.maingnb',*/
//		fitToSection:false,
//		autoScrolling:false,
        anchors:['About', 'R&D','Business','Brand','Career'],
        autoScrolling:true,
        scrollHorizontally: true,
        navigation:true,
        parallax: true,
        responsiveWidth: 1200,	
        normalScrollElements:'.pop-up',
		afterResponsive: function(isResponsive){
			$(window).scroll(function(){
				if($('.header').offset().top > 0){
					$('.header').css({background:'#fff'})	
					if($(window).width() <1200){
						$('.header').addClass('on')
					}
					
				}else{
					$('.header').css({background:'transparent'})
					if($(window).width() <1200){
						$('.header').removeClass('on')
						
					}
				}
			})
		},
        afterLoad: function(origin, destination, direction){
          var loadedSection = this;
          
      	if(destination.index == 0){
      	   $('.main .section01 .slick-active').find('.txtEffect').addClass('on')
          }else if(destination.index == 5){
        	  $('.section05').find('.txtEffect').addClass('on')
          }else{
          $('.section').not('.section01').find('.txtEffect').removeClass('on')
          $('.section.active').find('.txtEffect').addClass('on')
        }
          //using index
          if(destination.index == 0){
        	  $('.header .maingnb > li > a').css({color:'#000'})
          }else if(destination.index == 1){
        	  $('.header .maingnb > li > a').css({color:'#000'})
          }else if(destination.index == 2){
        	  $('.header .maingnb > li > a').css({color:'#000'})
          }else if(destination.index == 3){
        	  if($(window).width() > 1200){
        	  $('.header .maingnb > li > a').css({color:'#fff'})        
        	  }
          }else if(destination.index == 4){
        	  $('.header .maingnb > li > a').css({color:'#000'})
          }else if(destination.index == 5){       
        	   $('.header .maingnb > li > a').css({color:'#000'})
          }

          
          if(destination.index == 3){
            $('.down-scroll').css({
              borderColor:'#fff'
            })
            $('.hammenu span').addClass('white')
          }else{
            $('.down-scroll').css({
            	 borderColor:'rgba(0,0,0,0.5)'
            })            
            $('.hammenu span').removeClass('white')
          }
          if(destination.index == 2){
        	  $('.main .section03').addClass('on')
          }else{
        	  $('.main .section03').removeClass('on')
          }
          if(destination.index == 3){
            $('#fp-nav.fp-right').css({
              backgroundColor:'#1f232d'
            })
            $('.hammenu.pc-ver').addClass('on')
            $('#fp-nav ul li a span').css({
              backgroundColor:'#fff'
            })
            $('.down-scroll').addClass('white')
            $('.down-scroll img.pc-ver').attr('src','img/down-w.png')
           
          }else{
            $('#fp-nav.fp-right').css({
              backgroundColor:'transparent'
            })
            $('.hammenu.pc-ver').removeClass('on')
            $('#fp-nav ul li a span').css({
              backgroundColor:'#262f40'
            })
            $('.down-scroll').removeClass('white')
            if($(window).width() < 767){
            	$('.down-scroll img.mo-ver').attr('src','img/down.png')	
            }else{
            	$('.down-scroll img.pc-ver').attr('src','img/down.png')
            }
            
            
          }
         
          if(destination.index == 4){
        	  $('.down-scroll').addClass('last')
        	  $('.main .section03').addClass('on')
        	  if($(window).width() > 1200){
        	    $('.down-scroll.pc-ver').click(function(){
        	    	 fullpage_api.moveTo(1);
        		})
        	  }
          }else{
        	  if($(window).width() > 1200){
        	  $('.down-scroll.pc-ver').click(function(){   
        		  fullpage_api.moveTo(destination.index+2);
        		})
        	  }else{
        		  $('.down-scroll.mo-ver').click(function(){   
            		  fullpage_api.moveTo(2);
            		})
        	  }
        	  $('.down-scroll').removeClass('last')
          }
          if(destination.index != 5){        	  
        	 
        		 $('.down-scroll').show()
        		 $('#fp-nav.fp-right').css({zIndex:'100'})
          }else{        	
        	
        	  $('.down-scroll').hide()
        	  $('#fp-nav.fp-right').css({zIndex:'-1'})
          }
        },
        onLeave: function(origin, destination, direction){
    		var leavingSection = this;

    		//after leaving section 2
    		if(direction =='down'){
    			$(".section").find(".fp-bg").removeClass('active')	
    			if(destination.index==1){
    				$(".section02").find(".fp-bg").addClass('active')	
    			}else if(destination.index==2){
    				$(".section03").find(".fp-bg").addClass('active')	
    			}else if(destination.index==3){
    				$(".section04").find(".fp-bg").addClass('active')	
    			}else if(destination.index==4){
    				$(".section05").find(".fp-bg").addClass('active')	
    			}else if(destination.index==5){
    				$(".section05").find(".fp-bg").addClass('active')	
    			}
    			
    		}
    		else if(direction == 'up'){
    			$(".section").find(".fp-bg").removeClass('active')
    			if(destination.index==1){    				
    				$(".section02").find(".fp-bg").addClass('active')	
    			}else if(destination.index==2){
    				$(".section03").find(".fp-bg").addClass('active')	
    			}else if(destination.index==3){
    				$(".section04").find(".fp-bg").addClass('active')	
    			}else if(destination.index==4){
    				$(".section05").find(".fp-bg").addClass('active')	
    			}
    		}
    	}
	});
	
	
	/*if($(".main").length > 0){
		if($(window).width() > 1200){
			 if($(".pop-up").css("display")=="block"){
				 console.log('aa');
				 //fullpageapi.setAllowScrolling(false);
				 $('body').on('scroll touchmove mousewheel', function(event) {
						event.preventDefault();
						event.stopPropagation();
						return false;
					});
			 }else {
				//$('body').off('scroll touchmove mousewheel');
				 console.log('bb');
				 fullpageapi.setAllowScrolling(true);
			 }
		}else  {
			 if($(".pop-up").css("display")=="block"){
				  $("html").addClass("not_scroll");
				}else {
					 $("html").removeClass("not_scroll");
				}
		}
	
	 $(".closeBtn, .closeDayBtn").on("click", function(){
		//$('body').off('scroll touchmove mousewheel');
		$("html").removeClass("not_scroll");
		 console.log('bb');
		 fullpageapi.setAllowScrolling(true);
	 });
	}*/
	
	
	

	 var time =6;
     var $bar = $('.main .section01 .slider-nav li .back'),
         $slick =  $('.sec01-slide-wrap'),
         isPause,
         tick,
         percentTime;
	
     $slick.slick({
    	 fade:true,
        slidesToShow: 1,
        slidesToScroll: 1,
        autoplay: false,
        autoplaySpeed: 5000,
        focusOnSelect: true,
        speed:1000,
        arrows:true,
        prevArrow : "<button type='button' class='slick-prev'><img src='img/arrow-left.png' alt='셀리버리L&H'></button>",		// 이전 화살표 모양 설정
        nextArrow : "<button type='button' class='slick-next'><img src='img/arrow-right.png' alt='셀리버리L&H'></button>",		// 다음 화살표 모양 설정
        asNavFor: '.slider-nav',       
        dots:true
      });
      $('.slider-nav').slick({
        slidesToShow: 3,
        slidesToScroll: 1,
        arrows:false,
        dots: false,       
        focusOnSelect: true,
      infinite: false,
        
      });
      $('.main .section01 .slick-active').find('.txtEffect').addClass('on')
      $slick.on('afterChange', function(event, slick, currentSlide, nextSlide){
    	  $('.main .section01 .slick-slide').find('.txtEffect').removeClass('on')
          $('.main .section01 .slick-active').find('.txtEffect').addClass('on')
    	});
      $('.slider-nav li').click(function(){
    	  var slideNo = $(this).index()
    	  $slick.slick('slickGoTo', slideNo);
    	  startProgressbar();
      })
     $('.slick-arrow').click(function(){
    	 startProgressbar();
     })
      function startProgressbar() {
    	    resetProgressbar();
    	    percentTime = 0;
    	    isPause = false;
    	    tick = setInterval(interval, 10);
    	  }
    	  
    	  function interval() {
    	    if(isPause === false) {
    	      percentTime += 1 / (time+0.1);
    	      $bar.css({
    	        width: percentTime+"%"
    	      });
    	      if(percentTime >= 100)
    	        {
    	          $slick.slick('slickNext');
    	          startProgressbar();
    	        }
    	    }
    	  }
    	  
    	  
    	  function resetProgressbar() {
    	    $bar.css({
    	     width: 0+'%' 
    	    });
    	    clearTimeout(tick);
    	  }
    	  
  	  startProgressbar();
      // main section04
  	  
  	  if($(window).width() > 767){
  		
  	    
  		$(".business-box li").each(function(){			
  			$(this).mousemove(function( e ) {
  			   

  			   var relativeXPosition = (e.clientX - this.offsetLeft); 
  		        var relativeYPosition = (e.clientY - this.offsetTop);

  		        $(this).find( ".shadow-box" ).css({"top":relativeYPosition+"px", "left":relativeXPosition+"px"});
  		        $( ".shadow-box" ).hide()
  		        $(this).find( ".shadow-box" ).show()
  			  
  			}).mouseleave(function(){
  				$( ".shadow-box" ).hide()
  			});					
  			
  		});
  		
  		
  	    
  	  }
    

    

    
    
    
    //
  	
  	  
  	  
    $(window).resize(function(){
    	 if($(window).width() > 767){ 
        	
        	
    	 }else{
    		 $('.down-scroll.mo-ver').click(function(){
        		 fullpage_api.moveTo(2);
        	})
    	 }
    	
    	
    })
    	
    
    $(".family").click(function(){
    	if($(".family").find('ul').css('display')=='block'){
    		$(this).find('ul').hide()	
    		$(this).find('img').removeClass('rotate')
        }else{
        	$(this).find('ul').show()
        	$(this).find('img').addClass('rotate')
        }
    	
    	
    })
    
    
    $('.hammenu img').click(function(){
    	alert('준비중입니다')
    })
    
});



$(document).ready(function(){
	
	
	// 팝업 디자인 변경 스크립트 
	  var $slideBox = $('.newPopupContainer.active');
	  if(window.innerWidth < 1200){
		  $('.newPopupContent.hide').slick('slickRemove')			
		}
		$slideBox.slick({
			 slidesToShow: 1,
			 infinite:false,
	        slidesToScroll: 1,
	        autoplay: false,
	        autoplaySpeed: 5000,
	        focusOnSelect: true,
	        speed:1000,
	        arrows:true,
	        prevArrow : "<button type='button' class='slick-prev'><img src='img/popup-arrow01.png' alt='셀리버리L&H'></button>",		// 이전 화살표 모양 설정
	        nextArrow : "<button type='button' class='slick-next'><img src='img/popup-arrow02.png' alt='셀리버리L&H'></button>",		// 다음 화살표 모양 설정
	        asNavFor: '.slider-nav',       
	        dots:true,
	        responsive: [
	            {
	                breakpoint: 9999,
	                settings: "unslick"
	            },
	            {
	                breakpoint: 1200,
	                 settings: {
	                        slidesToShow: 1,
	                        slidesToScroll: 1
	                    }
	            }
	        ]
		});
		var slickOptions = { 		
			 slidesToShow: 1,
	        slidesToScroll: 1,
	        autoplay: false,
	        infinite:false,
	        autoplaySpeed: 5000,
	        focusOnSelect: true,
	        speed:1000,
	        arrows:true,
	        prevArrow : "<button type='button' class='slick-prev'><img src='img/popup-arrow01.png' alt='셀리버리L&H'></button>",		// 이전 화살표 모양 설정
	        nextArrow : "<button type='button' class='slick-next'><img src='img/popup-arrow02.png' alt='셀리버리L&H'></button>",		// 다음 화살표 모양 설정
	        asNavFor: '.slider-nav',       
	        dots:true,
	        responsive: [
	            {
	                breakpoint: 9999,
	                settings: "unslick"
	            },
	            {
	                breakpoint: 1200,
	                 settings: {
	                        slidesToShow: 1,
	                        slidesToScroll: 1
	                    }
	            }
	        ]
		  };  
		

		var popUp
		
			$slideBox.on('afterChange', function(event, slick, currentSlide, nextSlide){
				 popUp = $('.newPopupContent.show').not('.slick-cloned').length
				var ind = Number($('.slick-active').attr('data-slick-index'))
				if(ind >= popUp){
					ind=ind-popUp
					if(ind==0){
						ind = 1;
					}
				}else{
					ind = ind+1
				}
				  $('.popUpPagination .now').text(ind)
			});
		$('.popUpClose').click(function(){
			$('.pop-up').hide()						
		})
		
		
		
		$(window).on('load resize', function() { 
			 popUp = $('.newPopupContent.show').not('.slick-cloned').length;
			if($('.newPopupContent.show').length == '0'){
				$('.pop-up').hide()
			}
			$('.popUpPagination .total').text(popUp)
		    if($(window).width() >= 1200) { 			
		    	 $(".newPopupContainer").removeClass('active')
		    }else{ 			
		    	 $('.popUpPagination .total').text(popUp)
				 $(".newPopupContainer").addClass('active')
					$slideBox.not('.slick-initialized').slick(slickOptions); 	
		    } 
		});
	
    
    //
	
	
//	$(".pop-up").show();
	var layer = $('.newPopupContent');
	var btnDayClose = $('.closeDayBtn');
	var btnClose = $('.closeBtn');
	var popIndex;
	
	
	
	 layer.each(function(popIndex){
//		var $this = $(this)
		
		if($.cookie('layerCookie'+popIndex) == "none"){
			console.log('index'+popIndex, $.cookie('layerCookie'+popIndex) )
			popUp = $('.newPopupContent.show').not('.slick-cloned').length;
			
			$('.newCont0'+(popIndex+1)).addClass('removeSlide')
			$('.pop-up-container .slick-dots li').eq(popIndex).addClass('removeSlide')
			
			$('.popUpPagination .total').text(popUp)
			popUp = $('.newPopupContent.show').not('.slick-cloned').length
			
			if(window.innerWidth < 1200){			
				console.log(popIndex,'popIndex')
				$slideBox.slick('slickRemove',$('.removeSlide').index());
				//$('.removeSlide').remove()
				
			}else{
				console.log(popIndex,'popIndex')
				$('.removeSlide').remove()
				$slideBox.slick('slickRemove',$('.removeSlide').index());
			}
			
		}else{
//			$(this).show();
		}
		
	})
	
	
	btnDayClose.on("click", function(){
		popIndex = $(this).parents('.newPopupContent').attr('data-index')-1
		 popUp = $('.newPopupContent.show').not('.slick-cloned').length;
		$('.newCont0'+(popIndex+1)).addClass('removeSlide')
		$('.pop-up-container .slick-dots li').eq(popIndex).addClass('removeSlide')
		$.cookie('layerCookie'+popIndex, 'none');
		console.log(popIndex,'popIndex1')
		
		if(window.innerWidth < 1200){			
			
			
			$slideBox.slick('slickRemove',$('.removeSlide').index());
			console.log(popIndex,'popIndex1')
			//$(this).parents('.slick-track').find('.newCont0'+popIndex).remove()
			console.log(popIndex,'popIndex2')
			 popUp = $('.newPopupContent.show').not('.slick-cloned').length;
			
		}else{
			$(this).parents('.newPopupContent').hide()
			$(this).parents('.newPopupContent').removeClass('show').addClass('hide')
		}			
		
		$('.popUpPagination .total').text(popUp)
		if($('.newPopupContent.show').length == '0'){
			$('.pop-up').hide()
			$('body').off('scroll touchmove mousewheel');
		}
		
	})
	btnClose.on("click", function(){
		popIndex =$(this).parents('.newPopupContent').index()
		popUp = $('.newPopupContent.show').not('.slick-cloned').length;
		
		console.log(popIndex)
		
		if(window.innerWidth < 1200){
			$(this).parents('.newPopupContent').hide()
			$(this).parents('.newPopupContent').removeClass('show').addClass('hide')
			console.log('click')
			console.log(popIndex)
			$slideBox.slick('slickRemove',popIndex-1);
			$(this).parents('.slick-track').find('.newCont0'+ popIndex-1).slick('slickRemove')
			
			 popUp = $('.newPopupContent.show').not('.slick-cloned').length;
			
		}else{
			$(this).parents('.newPopupContent').hide()
			$(this).parents('.newPopupContent').removeClass('show').addClass('hide')
		}
		if($('.newPopupContent.show').length == '0'){
			$('.pop-up').hide()
			$('body').off('scroll touchmove mousewheel');
		}
		$('.popUpPagination .total').text(popUp)
		$(this).parents('.newPopupContent').fadeOut('fast');
		
	})
//
	
	
	
	
	//
	});


