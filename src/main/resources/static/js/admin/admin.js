$(document).ready(function () {
	
    var dep1Tit = $(this).find('.dep1 > li');

    $.each(dep1Tit, function (index, item) {
        $(this).click(function () {
            showSub(index);
        });
    });

    function showSub(_num) {
        dep1Tit.find('.dep2').stop().slideUp().parent('li').find('.arrow_icon').removeClass("on");
        dep1Tit.not('.active').removeClass('on');

        if (_num == 10000) {
            return;
        }

        dep1Tit.eq(_num).find('.dep2').stop().slideDown().parents('li').find('.arrow_icon').addClass("on");
        dep1Tit.eq(_num).addClass('on');
    }

    var dep2 = $('.dep2 > li > a'),
    	localPath = window.location.pathname,
    	pathStr = localPath.split('_'),
    	pathStr2 = localPath.split('/');
    
    $.each(dep2, function (index, item) {
        var aHref = $(this).attr('href'),
        	aaHref = aHref.split('?'),
        	aHref2 = aHref.split('/');

        if (aHref2[3] == pathStr2[3]) {
            $(this).parents('.dep2').addClass('on');
            $(this).parents('li').addClass('on');
            $(this).parents('li').addClass('active');
            $(this).parents('li').parents('ul').parents('li').find('.arrow_icon').addClass("on");
            console.log($(this).parents('li').parents('ul').parents('li'))
        }

    });
     

    
 
    // on/off 스위치
    $('.switch_label').each(function(){
    	var _this = $(this);
    	_this.click(function(ev){
    		if( _this.hasClass('on') ){
    			_this.removeClass('on');
    		} else {    			
    			_this.addClass('on');
    		}
    	})
    })
    
    
    // 테이블 글자 수 자르기
    var table_tit = $("#lists tbody tr td.tit");   
    table_tit.each(function(i,e){
    	var _this = $(this),
    		thisText = _this.text();
    	
    	if(thisText.length > 20) {
    		_this.text(thisText.substr(0, 20) + "...");
    	}else {
    		
    	}
    });
    //edit_selectbox(); 
    
    // 커스텀 셀렉트박스 동작
    $(".select_box").each(function(){
    	var $this = $(this).children(".select_box"),
			numberOfLi = $this.children('li').length,
			$styledSelect = $('.cate_list_nm'),
			$listItems = $('.cate_list li'),
			$list = $(".cate_list");
    	
    	$styledSelect.click(function (e) {
			e.stopPropagation();
			$styledSelect.addClass('click')
			$(this).toggleClass('active').next('ul.cate_list').toggle();
		});
		$listItems.click(function (e) {	
			e.stopPropagation();
			$styledSelect.removeClass('active');
			$styledSelect.removeClass('click');
			$list.hide();
		});
		$(document).click(function () {
			$styledSelect.removeClass('active');
			$styledSelect.removeClass('click');
			$list.hide();
		});
    });
});

function edit_selectbox(){
	// Iterate over each select element
	$('select:not([id="niceSelect"])').each(function () {

		// Cache the number of options
		var $this = $(this),
			numberOfOptions = $(this).children('option').length,
			this_id = $(this).attr("id");

		// Hides the select element
		$this.addClass('s-hidden');

		// Wrap the select element in a div
		$this.wrap('<div class="select-box selec_box"></div>');

		// Insert a styled div to sit over the top of the hidden select element
		$this.after('<div class="styledSelect '+this_id+'"></div>');
		// Cache the styled div
		var $styledSelect = $this.next('div.styledSelect');

		// Show the first select option in the styled div
		$styledSelect.text($this.children('option').eq(0).text());

		// Insert an unordered list after the styled div and also cache the list
		var $list = $('<ul />', {
			'class': this_id+'_options'
		}).insertAfter($styledSelect);

		// Insert a list item into the unordered list for each select option
		for (var i = 0; i < numberOfOptions; i++) {
			$('<li />', {
				text: $this.children('option').eq(i).text(),
				rel: $this.children('option').eq(i).val()
			}).appendTo($list);
		}

		// Cache the list items
		var $listItems = $list.children('li');

		// Show the unordered list when the styled div is clicked (also hides it if the div is clicked again)
		$styledSelect.click(function (e) {
			e.stopPropagation();
			$styledSelect.addClass('click')
//			$('div.styledSelect.active').each(function () {
//				$(this).removeClass('active').next('ul.options').fadeOut();
//				
//			});
			$(this).toggleClass('active').next('ul.'+this_id+'_options').toggle();
			$(".news_wrap .search .select_box button").toggleClass('active');
		});

		// Hides the unordered list when a list item is clicked and updates the styled div to show the selected list item
		// Updates the select element to have the value of the equivalent option
		$listItems.click(function (e) {			
			e.stopPropagation();
			$styledSelect.text($(this).text()).removeClass('active');
			$this.val($(this).attr('rel'));
			$list.fadeOut();
			$styledSelect.removeClass('click');
			
			/* alert($this.val()); Uncomment this for demonstration! */
		});
	
		// Hides the unordered list when clicking outside of it
		$(document).click(function () {
			$styledSelect.removeClass('active');
			$styledSelect.removeClass('click')
			$list.fadeOut();		
			$(".news_wrap .search .select_box button").removeClass('active')
			
		});

	
	});
}