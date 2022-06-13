<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/admin/common/header.jsp"/>


<script>
$(document).ready(function() {
	getList();
	getMainPrList();
	$('#pop_area').hide();
	pop_btn();
	
	$("#lists tbody").sortable({
		update:function(event,ui){
			
			$(this).children().each(function(index){
				$(this).find('td').first().html(index+1);
			});
			
			
		}
	});
});

function show_pop(){
	if($('#pop_area').hasClass('active'))
	{
		$('#pop_area').removeClass('active');
		$('#pop_area').hide();
	}
	else
	{
		$('#pop_area').addClass('active');
		$('#pop_area').show();
	}
}

function close_pop(){
	if($('#pop_area').hasClass('active'))
	{
		$('#pop_area').removeClass('active');
		$('#pop_area').hide();
	}
}


function save_pr_cate(){
	var arr="";
	$('.add_cate_title').each(function(index, item){
		arr+=$(this).val()+"|";
	})
	
	var idx_arr="";
	var order_no="";
	var cnt=0;
	$('.order_no').each(function(){ 
		cnt++;
		idx_arr+=$(this).attr('id').split('_')[1]+'|';
		order_no += cnt+"|";
	})

	$.ajax({
		type : "POST", 
		url : "/admin/main/save_pr_cate",
		dataType : "text",
		data : 
		{
			arr : arr,
			idx_arr : idx_arr,
			order_no : order_no
		},
		error : function() 
		{
			console.log("AJAX ERROR");
		},
		success : function(data) 
		{
			console.log(data);
			var result = JSON.parse(data);
			alert(result.msg);
			getList();
		}
	});
	
}

function del_pr_cate(idx){
	if(!confirm("정말 삭제하시겠습니까?"))
	{
		return;
	}
	
	$.ajax({
		type : "POST", 
		url : "/admin/main/del_pr_cate",
		dataType : "text",
		data : 
		{
			idx : idx,
		},
		error : function() 
		{
			console.log("AJAX ERROR");
		},
		success : function(data) 
		{
			console.log(data);
			var result = JSON.parse(data);
			alert(result.msg);
			getMainPrList();
		}
	});
}

function getMainPrList()
{
	$.ajax({
		type : "POST", 
		url : "/admin/main/getMainPrList",
		dataType : "text",
		error : function() 
		{
			console.log("AJAX ERROR");
		},
		success : function(data) 
		{
			console.log(data);
			var result = JSON.parse(data);
			var inner = "";
			
			if(result.list.length > 0)
			{
				var flag="";
				var str="";
				var str_result="";
				for(var i = 0; i < result.list.length; i++)
				{
					str = result.list[i].pr_type;
					str_result = str[0].toUpperCase() 
		              + str.slice(1, str.length);
					
					inner+='<tr id="order_'+result.list[i].idx+'" class="order_no" >';
					inner+='	<td>'+(i+1)+'</td>';
					inner+='	<td class="handle"><img src="/img/admin/bar_icon.png" alt="순서변경" /></td>';
					inner+='	<td>'+str_result+'</td>';
					inner+='	<td>'+result.list[i].title+'</td>';
					if(nullChk(result.list[i].thumb_ori)!='')
					{
						inner+='	<td>O</td>';	
					}
					else
					{
						inner+='	<td>X</td>';	
					}
					inner+='	<td>';
					inner+='		<label class="del_btn" for="del_pr_cate('+result.list[i].idx+')">삭제</label>';
					inner+='		<input type="button" value="삭제" id="del_pr_cate('+result.list[i].idx+')" onclick="del_pr_cate('+result.list[i].idx+')">';
					inner+='	</td>';
					inner+='</tr>';
				}
			}
			else
			{
				inner+='<tr>';
				inner+='	<td colspan="3">등록된 카테고리가 없습니다.</td>';
				inner+='</tr>';
			}
			$('#target_area').html(inner);
		}
	});
}

function getList(pr_type)
{
	var pr = nullChk(pr_type);
	if(pr=="")
	{
		pr="notice";
		$(".pop_inner .btn_box label").removeClass("active");
		$(".choose_notice").addClass("active");
	}
	
	$.ajax({
		type : "POST", 
		url : "/admin/main/getMainPopPrList",
		dataType : "text",
		data : 
		{
			page : page,
			order_by : order_by,
			sort_type : sort_type,
			pr : pr,
		},
		error : function() 
		{
			console.log("AJAX ERROR");
		},
		success : function(data) 
		{
			console.log(data);
			var result = JSON.parse(data);
			var inner = "";
			var temp ="";
			if(result.list.length > 0)
			{
				for(var i = 0; i < result.list.length; i++)
				{
					inner+='<tr>';
					inner+='	<td>'+(i+1)+'</td>';
					inner+='	<td>'+result.list[i].cate_title+'</td>';
					inner+='	<td class="title">'+result.list[i].title+'</td>';
					inner+='	<td>'+result.list[i].create_date+'</td>';
					if(nullChk(result.list[i].thumb_ori)!='')
					{
						inner+='	<td>O</td>';	
					}
					else
					{
						inner+='	<td>X</td>';	
					}
					inner+='	<td>';
					temp ="'"+result.list[i].pr_type+"'";
					inner+='		<label for="add_pr_cate'+result.list[i].idx+'" class="add_pr_cate btn">추가';
					inner+='			<input type="button" style="display:none;" value="추가" id="add_pr_cate'+result.list[i].idx+'" onclick="add_pr_cate('+result.list[i].idx+','+temp+')">';
					inner+='		</label>';
					inner+='	</td>';
					inner+='</tr>';
				}
			}
			else
			{
				inner+='<tr>';
				inner+='	<td colspan="3">등록된 카테고리가 없습니다.</td>';
				inner+='</tr>';
			}
			
			order_by = result.order_by;
			sort_type = result.sort_type;
			listSize = result.listSize;
			$(".pro-pagenation").html(makePaging(result.page, result.s_page, result.e_page, result.pageNum, 1));
			$('#target_pr_area').html(inner);
			$('#target_pr_area').addClass(""+result.list.length+"");
		}
	});
}

function add_pr_cate(idx,pr_type){
	var len = $('.order_no').length;
	if(len ==4)
	{
		alert('최대 4개 까지만 등록이 가능합니다.');
		return;
	}

	if(!confirm("정말 추가하시겠습니까?"))
	{
		return;
	}
	
	$.ajax({
		type : "POST", 
		url : "/admin/main/add_pr_cate",
		dataType : "text",
		data : 
		{
			idx : idx,
			pr_type : pr_type
		},
		error : function() 
		{
			console.log("AJAX ERROR");
		},
		success : function(data) 
		{
			console.log(data);
			var result = JSON.parse(data);
			alert(result.msg);
			getMainPrList();
		}
	});
}
function pop_btn(){
	var pop_btn = $(".pop_inner .btn_box label");
	pop_btn.click(function(){
		pop_btn.removeClass("active");
		$(this).addClass("active");
	});
}
</script>

<div id="container">
	<div class="inner">
		<div class="inner_top">
			<h2 class="ad_tit">메인 PR 콘텐츠 관리</h2>
			<p class="ad_titDesc">메인 PR 영역의 콘텐츠를 수정하고 관리합니다.</p>
			<div class="btn_box btn_box1">
				<label class="add_pr_cate btn btn1" for="add_pr_cate">콘텐츠 추가</label>
				<input type="button" id="add_pr_cate" value="카테고리 추가" onclick="show_pop()">
				<label class="save_pr_cate btn btn2" for="save_pr_cate">변경내용 저장</label>
				<input type="button" id="save_pr_cate" value="변경내용 저장" onclick="save_pr_cate()">
			</div>  
		</div>
		
		<div class="list_box">
			<table style="boder : 1px;" id="lists" class="cate main_cate">
				<thead>
					<tr>
						<th>No.</th>
						<th>순서 변경</th>
						<th>게시판 명</th>
						<th>제목</th>
						<th>썸네일 유무</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody id="target_area">
		
				</tbody>
			</table>
		</div>
	</div>
	
	<div id="pop_area">
		<div class="pop_inner">
			<div class="inner_top">
				<h2 class="ad_tit">메인 PR 콘텐츠 추가</h2>
				<p class="ad_titDesc">현재 PR페이지에서 노출된 콘텐츠만 리스트에 나옵니다.</p>
				<div class="btn_box btn_box1">
					<label class="choose_notice btn btn1" for="choose_notice">Notice</label>
					<input type="button" id="choose_notice" value="notice" onclick="getList('notice')">
					
					<label class="choose_news btn btn2" for="choose_news">News</label>
					<input type="button" id="choose_news" value="news" onclick="getList('news')">
					
					<label class="choose_media btn btn2" for="choose_media">Media</label>
					<input type="button" id="choose_media" value="media" onclick="getList('media')">
					
					<label for="close_btn" class="close_btn" ><img src="/img/admin/close.png" alt="닫기" /></label>
					<input type="button" id="close_btn" value="닫기" onclick="close_pop()">
				</div>  
			</div>
			<div class="inner_cont">
				<div class="list_box">
					<table style="boder : 1px;" id="lists" class="cate popup_cate">
						<colgroup>
							<col width="8%"/>
							<col width="15%"/>
							<col width=""/>
							<col width="15%"/>
							<col width="15%"/>
							<col width="10%"/>
						</colgroup>
						<thead>
							<tr>
								<th>No.</th>
								<th>게시판 명</th>
								<th>제목</th>
								<th>등록일</th>
								<th>썸네일 유무</th>
								<th></th>
							</tr>
						</thead>
						<tbody id="target_pr_area">
				
						</tbody>
					</table>
				</div>
			</div>
			<jsp:include page="/WEB-INF/admin/common/paging_new.jsp"/>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/admin/common/footer.jsp"/>