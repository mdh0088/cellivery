<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/admin/common/header.jsp"/>
<jsp:include page="/WEB-INF/admin/common/date_picker.jsp"/>
<script>
$(window).ready(function(){
	CKEDITOR.replace('board_cont', {
		height:'500px',
		filebrowserUploadUrl : '/admin/pr/ckeditor_upload'
	});
})

$(document).ready(function(){
	setToday();
	change_period();
	if("${idx}"!=="")
	{
	    if("${use_yn}"=='Y')
		{
			$("#use_yn").prop('checked',true);
		}
		$('#create_date').val("${create_date}");
		$('#title').val("${title}");
		$('#start_ymd').val("${start_ymd}");
		$('#end_ymd').val("${end_ymd}");
		$('#board_cont').val(repWord("${cont}"));
	}
})


//노출기간
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
			var start_year = now.getFullYear(); // 년도
			var start_month = now.getMonth()+1;  // 월
			var start_date = now.getDate();  // 날짜			
			
			start_month < 10?start_month="0"+start_month:'';
			start_date < 10?start_date="0"+start_date:'';
			
			$('#start_ymd').val(start_year+'-'+start_month+'-'+start_date);
		}
		$('#end_ymd').val(end_year+"-"+end_month+"-"+end_date);
	}
	
}

//등록일
function setToday(){
	var date = new Date(),
		year = date.getFullYear(),
		month = date.getMonth() + 1,
		day = date.getDate();
	month < 10?month="0"+month:'';
	day < 10?day="0"+day:'';
	$('#create_date').val(year+"-"+month+"-"+day);
}

function del_detail(cnt){
	$('#detail_receipt_nm_'+cnt).val('');
	$('#detail_receipt_'+cnt).val('');
}



function fncSubmit(){
	
	CKEDITOR.instances.board_cont.updateElement(); 
	
	var f = document.fncForm;
	var temp_line ="";
	temp_line = document.getElementsByClassName("file_nm");	//첨부파일 세팅
	var fileNm_line = "";
	var thumbNm_line = "";
    for (var i = 0; i < temp_line.length; i++) 
    {
		thumbNm_line +=temp_line[i].value;
	}
    
    if (f.create_date.value=="") 
	{
		alert("등록일을 정해주세요.");
		f.create_date.focus();
		return;
	}
    
    if (f.title.value=="") 
	{
		alert("제목을 작성해주세요.");
		f.title.focus();
		return;
	}
    
    if (f.start_ymd.value=="") 
	{
		alert("시작일을 지정해주세요.");
		f.start_ymd.focus();
		return;
	}
    
    if (f.end_ymd.value=="") 
	{
		alert("종료일을 지정해주세요.");
		f.end_ymd.focus();
		return;
	}
    
    if (f.board_cont.value=="") 
	{
		alert("내용을 작성해주세요.");
		f.board_cont.focus();
		return;
	}
  
    var use_yn="N";
    var up_show_yn="N";
    
    if($("#use_yn").prop('checked')==true)
	{
		use_yn="Y";
	}
    
    if($("#up_show_yn").prop('checked')==true)
	{
    	up_show_yn="Y";
	}
    
    f.hidden_use_yn.value = use_yn;
    f.hidden_up_show_yn.value = up_show_yn; 
    

    $("#hidden_thumb_nm").val($('#detail_receipt_nm_4').val());
    
    
    
	f.action="/admin/main/write_proc";
	$("#fncForm").ajaxSubmit({ 
		success: function(data)
		{
			console.log(data);
			var result = JSON.parse(data);
			alert(result.msg);
			location.href="/admin/main/popup/list";
		}
	});
	
	
}
</script>

<div id="container">
	<div class="inner">
		<div class="inner_top">
			<h2 class="ad_tit">메인 팝업 등록/수정</h2>
			<p class="ad_titDesc">메인에 노출되는 팝업창을 수정하고 관리합니다. (팝업은 최대 9개까지 노출 가능합니다.)</p>
		</div>	
		<form id="fncForm" name="fncForm" method="post" enctype="multipart/form-data">
			<input type="hidden" name="hidden_use_yn">
			<input type="hidden" name="hidden_up_show_yn">
			<input type="hidden" id="hidden_file_nm_arr" name="hidden_file_nm_arr">
			<input type="hidden" id="hidden_thumb_nm" name="hidden_thumb_nm">
			<input type="hidden" id="tbl" name="tbl" value="news">
			<input type="hidden" name="idx" name="idx" value="${idx}">
			<div class="inner_cont write_cont">
				<div class="write_date">
					<p class="writebox_tit">등록일</p>
					<div class="writebox_cont">
						<input type="text" id="create_date" name="create_date" class="date-i">
					</div>					
					<p class="writebox_tit">노출 여부</p>
					<div class="writebox_cont">
						<input type="checkbox" id="use_yn" class="switch" checked="checked">
						<label for="use_yn" class="switch_label">			
							<span class="onf_btn"></span>			
							<span class="onf_btn_text off on">OFF</span>			
							<span class="onf_btn_text on_2">ON</span>		
						</label>
					</div>
				</div>
				<div class="write_title">
					<p class="writebox_tit">제목</p>
					<div class="writebox_cont">
						<input type="text" id="title" name="title" placeholder="제목을 입력해주세요.">
					</div>
				</div>
				<div class="write_term">
					<p class="writebox_tit">노출 기간</p>
					<div class="writebox_cont">
						<input type="text" id="start_ymd" name="start_ymd" class="date-i">
						<input type="text" id="end_ymd" name="end_ymd" class="date-i">
					</div>
				</div>
				<div class="write_content">
					<p class="writebox_tit">내용</p>
					<div class="writebox_cont">
						<textarea id="board_cont" name="board_cont"></textarea>
					</div>
				</div>
			</div>
			<div class="btn_box">
				<label for="goList_btn" class="btn goList_btn">목록</label>
				<input type="button" id="goList_btn" value="목록" onclick="location.href='/admin/main/popup/list'">
				<label for="save_btn" class="btn btn2 save_btn">저장</label>	
				<input type="button" id="save_btn" value="저장" onclick="fncSubmit();">			
			</div>
		</form>
		
	</div>
</div>

<jsp:include page="/WEB-INF/admin/common/footer.jsp"/>