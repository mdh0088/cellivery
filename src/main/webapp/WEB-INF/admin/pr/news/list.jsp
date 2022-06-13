<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/admin/common/header.jsp"/>
<jsp:include page="/WEB-INF/admin/common/date_picker.jsp"/>


<style>
  table {
    width: 50%;
    border: 1px solid #444444;
  }
  th, td {
    border: 1px solid #444444;
  }
</style>

<script>
$(document).ready(function() {
	getCateList();
	getList();
	
	$("#chk_all").change(function() 
	{
		if($("#chk_all").is(":checked"))
		{
			$('.chk_notice').prop("checked", true);
		}
		else
		{
			$('.chk_notice').prop("checked", false);
		}
	});
	
	
});

function getList(){
	
	var use_yn="";
	
	if (
			($("#show_y").prop('checked')==true && $("#show_n").prop('checked')==true)||
			$("#show_y").prop('checked')==false && $("#show_n").prop('checked')==false
		) 
	{
		use_yn="";
	}
	else if($("#show_y").prop('checked')==true)
	{
		use_yn="Y";
	}
	else if($("#show_n").prop('checked')==true)
	{
		use_yn="N";
	}
	
	$.ajax({
		type : "POST", 
		url : "/admin/pr/getPrTargetList",
		dataType : "text",
		data : 
		{
			page : page,
			order_by : order_by,
			sort_type : sort_type,
			start_ymd : $('#start_ymd').val(),
			end_ymd : $('#end_ymd').val(),
			search_name : $('#search_name').val(),
			use_yn : use_yn,
			cate : target_idx,
			tbl : 'news'
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
			$('#list_cnt').html('<p><strong>결과 '+result.listCount+'개</strong> / 전체 '+result.TotalCnt+'개</p>');
			if(result.list.length > 0)
			{
				var up_show_yn ="";
				var chk_use_yn ="";
				var tbl ='';
				for(var i = 0; i < result.list.length; i++)
				{
					chk_use_yn='';
					up_show_yn='';
					inner+='<tr>';
					inner +='	<td><input type="checkbox" class="chk_notice" value="'+result.list[i].idx+'"></td>';
					inner+='	<td>'+(i+1)+'</td>';
					inner+='	<td>'+result.list[i].cate_title+'</td>';
					inner+='	<td class="title">';
					if(result.list[i].up_show_yn=='Y')
					{
						up_show_yn="<span class='top_banner'>상단 고정</span>"
					}
					inner+=		up_show_yn+""+result.list[i].title;
					
					inner+='	</td>';
					
					inner+='	<td>'+result.list[i].create_date+'</td>';
					inner+='	<td>';
					
					if(result.list[i].use_yn =='Y')
					{
						chk_use_yn='checked';
					}
					
					tbl="'pr_news'";
					inner +='		<input type="checkbox" '+chk_use_yn+' class="switch" id="switch_chk'+result.list[i].idx+'" value="'+result.list[i].use_yn+'" onclick="change_use_yn('+result.list[i].idx+','+tbl+')">';
					inner+='		<label for="switch_chk'+result.list[i].idx+'" class="switch_label">';
					inner+='			<span class="onf_btn"></span>';
					inner+='			<span class="onf_btn_text off on">OFF</span>';
					inner+='			<span class="onf_btn_text on_2">ON</span>';
					inner+='		</label>';
					inner+='	</td>';
					inner+='	<td><input type="button" class="btn modi_btn" value="수정" onclick="javascript=location.href=\'/admin/pr/news/write?idx='+result.list[i].idx+'\' "></td>';
					inner+='</tr>';
				}
			}
			else
			{
				inner+='<tr>';
				inner+='	<td colspan="6">등록된 게시물이 없습니다.</td>';
				inner+='</tr>';
			}
			
			order_by = result.order_by;
			sort_type = result.sort_type;
			listSize = result.listSize;
			$(".pro-pagenation").html(makePaging(result.page, result.s_page, result.e_page, result.pageNum, 1));
			$('#list_target').html(inner);
		}
	});
}


function getCateList()
{
	$.ajax({
		type : "POST", 
		url : "/admin/pr/category/getCateList",
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
				inner +='<li onclick="choose_cate()">전체</li>';
				for(var i = 0; i < result.list.length; i++)
				{
					//inner+='<option value="'+result.list[i].idx+'">'+result.list[i].title+'</option>';
					inner +='<li onclick="choose_cate('+result.list[i].idx+',\''+result.list[i].title+'\')">'+result.list[i].title+'</li>';
				}
			}
			else
			{
				inner +='<li>등록된 카테고리가 없습니다.</li>'
			}
			$('.cate_list_nm').text('전체');
			$('.cate_list').html(inner);
		}
	});
	
}

var target_idx="";
function choose_cate(idx,nm){
	target_idx = nullChk(idx);
	if(target_idx=="")
	{
		$('.cate_list_nm').text('전체');
	}	
	$('.cate_list_nm').text(nm);
}

function delTarget(){
	
	
	var idx ="";
	$('.chk_notice').each(function(){ 
		if ($(this).prop('checked')==true) 
		{
			idx +=$(this).val()+"|";
		}
	})
	
	if (idx=="") 
	{
		alert('삭제할 게시물을 선택해주세요.');
		return;
	}
	
	if(!confirm("정말 삭제하시겠습니까?"))
	{
		return;
	}
	
	if (idx=="") 
	{
		alert("삭제할 게시글을 선택해주세요.");
		return;
	}
	
	$.ajax({
		type : "POST", 
		url : "/admin/pr/delTarget",
		dataType : "text",
		async : false,
		data : 
		{
			idx : idx,
			tbl : 'tbl_pr_news'
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
			if (result.isSuc=="success")
			{
				getList();			
			}
		}
	});  
	
}

function duplTarget(){
	
	
	var idx ="";
	$('.chk_notice').each(function(){ 
		if ($(this).prop('checked')==true) 
		{
			idx +=$(this).val()+"|";
		}
	})
	
	if (idx=="") 
	{
		alert('복사할 게시물을 선택해주세요.');
		return;
	}
	
	if(!confirm("정말 복사하시겠습니까?"))
	{
		return;
	}
	
	if (idx=="") 
	{
		alert("복사할 게시글을 선택해주세요.");
		return;
	}
	
	$.ajax({
		type : "POST", 
		url : "/admin/pr/duplTarget",
		dataType : "text",
		async : false,
		data : 
		{
			idx : idx,
			tbl : 'news'
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
			if (result.isSuc=="success")
			{
				getList();			
			}
		}
	});  
	
}
	
function change_period(day){
	var start_day='';
	var end_day='';
	if(nullChk($('#start_ymd').val())=='')
	{
		end_day = new Date()
	}
	else
	{
		start_day = $('#start_ymd').val().split('-');
		end_day = new Date(start_day[0],start_day[1],start_day[2]);   	
	}
	
	if(day=="7day")
	{
		end_day.setDate(end_day.getDate() + 7)
	}
	else if(day=="15day")
	{
		end_day.setDate(end_day.getDate() + 15)
	}
	else if(day=="1mon")
	{
		end_day.setMonth(end_day.getMonth() + 1)
	}
	else if(day=="3mon")
	{
		end_day.setMonth(end_day.getMonth() + 3)
	}

	var end_year = end_day.getFullYear(); // 년도
	var end_month = end_day.getMonth() + 1;  // 월
	var end_date = end_day.getDate();  // 날짜

	end_month < 10?end_month="0"+end_month:'';
	end_date < 10?end_date="0"+end_date:'';
	
	if(day=='all')
	{
		$('#start_ymd').val('');	
		$('#end_ymd').val('');		
	}
	else
	{
		if($('#start_ymd').val()=='')
		{
			var now = new Date();
			$('#start_ymd').val(now.getFullYear()+'-'+(now.getMonth()+1)+'-'+now.getDate());
		}
		$('#end_ymd').val(end_year+"-"+end_month+"-"+end_date);
	}
	
}
</script>
<div id="container">
	<div class="inner">
		<div class="inner_top">
			<h2 class="ad_tit">News 관리</h2>
			<p class="ad_titDesc">News 게시글을 수정하고 관리합니다. (상단 고정은 최대 5개까지 가능합니다.)</p>
		</div>
		<div class="search_box">
			<div class="search_inner search_top">
				<p class="search_tit">기간 검색</p> 
				<div class="term term1 left">
					<input type="text" id="start_ymd" class="date-i">
					<input type="text" id="end_ymd" class="date-i">
				</div>
				<div class="term term2 right division">
					<label for="period_all" class="radio">
						<input type="radio" name="ymd_period" checked="checked" value="01" id="period_all" onclick="change_period('all')">
						전체					
					</label>					
					<label for="period_7d" class="radio">
						<input type="radio" name="ymd_period" value="02" id="period_7d" onclick="change_period('7day')">
						7일
					</label>
					<label for="period_15d" class="radio">
						<input type="radio" name="ymd_period" value="03" id="period_15d" onclick="change_period('15day')">
						15일
					</label>					
					<label for="period_1m" class="radio">
						<input type="radio" name="ymd_period" value="04" id="period_1m" onclick="change_period('1mon')">
						1개월
					</label>
					<label for="period_3m" class="radio">
						<input type="radio" name="ymd_period" value="05" id="period_3m" onclick="change_period('3mon')">
						3개월
					</label>
				</div>
			</div>
			<div class="search_inner search_mid">
				<p class="search_tit">검색어</p>
				<div class="left">
					<input type="text" id="search_name" placeholder="여기에 검색어를 입력하세요.">
				</div>
				<div class="right division">
					<label for="show_y" class="chk_Box">
						<input type="checkbox" id="show_y" checked>
						노출 보기
					</label>
					<label for="show_n" class="chk_Box">
						<input type="checkbox" id="show_n" checked>
						미노출 보기
					</label>
				</div>
			</div>
			<div class="search_inner search_bottom">
				<div class="left">
					<p class="search_tit">카테고리 검색</p>
					<div class="select_box">
						<div class="cate_list_nm"></div>
						<ul class="cate_list">
							
						</ul>
					</div>					
				</div>				
			</div>	
			<div class="search_btn">	
				<input type="button" value="검색" onclick="getList();">	
			</div>
		</div>
		
		<div class="inner_cont">
			<div class="list_cont_top">
				<div id="list_cnt" class="list_cnt"></div>
				<div class="btn_box">
					<input type="button" class="del_btn btn" value="선택항목 삭제" onclick="delTarget()">
					<input type="button" class="copy_btn btn" value="선택항목 복사" onclick="duplTarget()">
				</div>		
				<input type="button" class="submit_btn btn" value="등록" onclick="javascript:location.href='/admin/pr/news/write'">
			</div>		
			<div class="list_cont_bottom">
				<table id="lists" class="pr_list">
					<colgroup>
						<col width="5%"/>
						<col width="5%"/>
						<col width="15%"/>
						<col width=""/>
						<col width="10%"/>
						<col width="10%"/>
						<col width="15%"/>
					</colgroup>
					<thead>
						<tr>
							<th><input type="checkbox" id="chk_all"></th> 
							<th>NO.</th>
							<th>카테고리</th>
							<th>제목</th>
							<th>등록일</th>
							<th>노출 여부</th>
							<th></th>
						</tr>
					</thead>
					<tbody id="list_target">
					</tbody>
				</table>
			</div>
		</div>

	</div>
	<jsp:include page="/WEB-INF/admin/common/paging_new.jsp"/>
</div>

<jsp:include page="/WEB-INF/admin/common/footer.jsp"/>