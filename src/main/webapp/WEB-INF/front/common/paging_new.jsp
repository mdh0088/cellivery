<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
var page = 1;
var order_by = "";
var sort_type = "";
$(document).ready(function(){
	$(".listSize").show();
})
function makePaging(nowPage, s_page, e_page, pageNum, val)
{
	page = nowPage;
	var inner = "";
		inner += '<div class="pager">';
	//	inner += '<ul class="page">';
	if(Number(page) > 5)
	{
		inner += '  <a class="prev" href="javascript:pageMoveAjax('+(Number(s_page)-1)+')">'; 
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
			if(i == page)
			{
				inner += '			<strong class="p_btn on">'+i+'</strong>';
			}
			else
			{
				inner += '			<a href="javascript:pageMoveAjax('+i+');" id="p_'+i+'" class="p_btn">'+i+'</a>';
			}
		}
	}
	if(e_page == '0')
	{
		inner +='<div class="pager lato">';
		inner += '		 <a href="javascript:pageMoveAjax(1);">1</a>';
		inner +='</div">';
	}
	if(pageNum != page)
	{
		if(Number(pageNum) > 5)
		{
			if(pagingCnt > 4)
			{
				if(Number(e_page)+1 > Number(pageNum))
				{
					/*
					inner += '  <a class="prev" href="javascript:pageMoveAjax('+pageNum+');">';
					inner +='		<img src="/img/sub/pr/board-next.png" alt="next" class="pc-ver">';
					inner +='		<img src="/img/sub/pr/board-next-m.png" alt="next" class="mo-ver">';
					inner += '	</a>';
					*/
				}
				else
				{
					
					inner += '  <a class="prev" href="javascript:pageMoveAjax('+pageNum+');">';
					inner +='		<img src="/img/sub/pr/board-next.png" alt="next" class="pc-ver">';
					inner +='		<img src="/img/sub/pr/board-next-m.png" alt="next" class="mo-ver">';
					inner += '	</a>';
				}
			}
		}
	}
	//inner += '</ul>';
	return inner;
}

function reSortAjax(act)
{
	sort_type = act.replace("sort_", "");
	console.log(sort_type);
	console.log(order_by);

	
	/* ????????? ?????? ?????? 2021-11-19 ????????? ?????? ?????? (?????? start)*/
	if (sort_type!='step_no') 								
	{
		if(order_by == "")
		{
			order_by = "desc";
			
			$("#"+act).attr("src", "/img/th_down.png");
		}
		else if(order_by == "desc")
		{
			order_by = "asc";
			$("#"+act).attr("src", "/img/th_up.png");
		}
		else if(order_by == "asc")
		{
			order_by = "desc";
			$("#"+act).attr("src", "/img/th_down.png");
		}
	}
	/* ????????? ?????? ?????? 2021-11-19 ????????? ?????? ??????  start */
	else
	{
		if(order_by == "")
		{
			order_by = "asc";
			$("#"+act).attr("src", "/img/th_down.png");
		}
		else if(order_by == "desc")
		{
			order_by = "asc";
			$("#"+act).attr("src", "/img/th_up.png");
		}
		else if(order_by == "asc")
		{
			order_by = "desc";
			$("#"+act).attr("src", "/img/th_down.png");
		}
	}
	/* ????????? ?????? ?????? 2021-11-19 ????????? ?????? ??????  end  */
	
	page = 1;
	$("#order_by").val(order_by);
	$("#sort_type").val(sort_type);
	$("#page").val(page);
	getList();
}


function pageMoveAjax(nowPage)
{
	page = nowPage;
	$('#page').val(page);
	
	getList();
}
/*
function pageMoveScroll(nowPage)
{
	page = nowPage;
	getList('scroll');
}
*/

</script>
<div id="pagination" class="pagination"></div>