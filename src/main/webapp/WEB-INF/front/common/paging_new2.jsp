<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
var insta_page = 1;
var insta_order_by = "";
var insta_sort_type = "";

function insta_makePaging(nowPage, s_page, e_page, pageNum, val)
{
	insta_page = nowPage;
	var inner = "";
		inner += '<div class="pager">';
	if(Number(insta_page) > 5)
	{
		//inner += '		<a class="first" style="display:none;" href="javascript:insta_pageMoveAjax(1);"> ◀◀ </a>';
		//inner += '    	<a class="prev page_arrow" href="javascript:insta_pageMoveAjax('+(Number(s_page)-1)+');"></a>';
		
		inner += '  <a class="prev" href="javascript:insta_pageMoveAjax('+(Number(s_page)-1)+')">'; 
		inner +='		<img src="/img/sub/pr/board-prev.png" alt="prev" class="pc-ver">';
		inner +='		<img src="/img/sub/pr/board-prev-m.png" alt="prev" class="mo-ver">';
		inner += '	</a>';
	}
	var pagingCnt = 0;
	if(e_page != '0')
	{
		for(var i = Number(s_page); i <= Number(e_page); i++)
		{
			pagingCnt ++;
			if(i == insta_page)
			{
				inner += '			<strong class="p_btn on">'+i+'</strong>';
			}
			else
			{
				inner += '			<a href="javascript:insta_pageMoveAjax('+i+');" id="p_'+i+'" class="p_btn">'+i+'</a>';
			}
		}
	}
	if(e_page == '0')
	{
		inner += '		 <a href="javascript:insta_pageMoveAjax(1);">1</a>';
	}
	if(pageNum != insta_page)
	{
		if(Number(pageNum) > 5)
		{
			if(pagingCnt > 4)
			{
				if(Number(e_page)+1 > Number(pageNum))
				{
					//inner += '            		<a class="next page_arrow" href="javascript:insta_pageMoveAjax('+pageNum+');"></a>'; 
					//inner += '            		<a class="last" style="display:none;" href="javascript:insta_pageMoveAjax('+pageNum+');"> ▶▶ </a>'; 
				}
				else
				{
					
					inner += '  <a class="prev" href="javascript:insta_pageMoveAjax('+pageNum+');">';
					inner +='		<img src="/img/sub/pr/board-next.png" alt="next" class="pc-ver">';
					inner +='		<img src="/img/sub/pr/board-next-m.png" alt="next" class="mo-ver">';
					inner += '	</a>';
					
				//	inner += '					<a class="next page_arrow" href="javascript:insta_pageMoveAjax('+(Number(e_page)+1)+');"></a>';
				//	inner += '            		<a class="last" style="display:none;" href="javascript:insta_pageMoveAjax('+pageNum+');"> ▶▶ </a>'; 
				}
			}
		}
	}
	inner += '</div>';
	return inner;
}

function insta_reSortAjax(act)
{
	insta_sort_type = act.replace("sort_", "");
	console.log(sort_type);
	console.log(order_by);

	
	/* 김진오 강제 요청 2021-11-19 언제든 삭제 겐춘 (조건 start)*/
	if (insta_sort_type!='step_no') 								
	{
		if(insta_order_by == "")
		{
			insta_order_by = "desc";
			
			$("#"+act).attr("src", "/img/th_down.png");
		}
		else if(insta_order_by == "desc")
		{
			insta_order_by = "asc";
			$("#"+act).attr("src", "/img/th_up.png");
		}
		else if(insta_order_by == "asc")
		{
			insta_order_by = "desc";
			$("#"+act).attr("src", "/img/th_down.png");
		}
	}
	/* 김진오 강제 요청 2021-11-19 언제든 삭제 겐춘  start */
	else
	{
		if(insta_order_by == "")
		{
			insta_order_by = "asc";
			$("#"+act).attr("src", "/img/th_down.png");
		}
		else if(insta_order_by == "desc")
		{
			insta_order_by = "asc";
			$("#"+act).attr("src", "/img/th_up.png");
		}
		else if(insta_order_by == "asc")
		{
			insta_order_by = "desc";
			$("#"+act).attr("src", "/img/th_down.png");
		}
	}
	/* 김진오 강제 요청 2021-11-19 언제든 삭제 겐춘  end  */
	
	insta_page = 1;
	$("#order_by").val(insta_order_by);
	$("#sort_type").val(insta_sort_type);
	$("#page").val(insta_page);
	insta_getList();
}


function insta_pageMoveAjax(nowPage)
{
	insta_page = nowPage;
	$('#page').val(insta_page);
	 
	insta_getList();
}
/*
function pageMoveScroll(nowPage)
{
	page = nowPage;
	getList('scroll');
}
*/

</script>
<div id="insta_pro-pagination" class="pagination"></div>