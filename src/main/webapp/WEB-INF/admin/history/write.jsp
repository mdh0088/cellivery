<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/admin/common/header.jsp"/>
<jsp:include page="/WEB-INF/admin/common/date_picker.jsp"/>
<script>
$(document).ready(function(){
	setToday();
	if("${idx}"!=="")
	{
	    if("${use_yn}"=='Y')
		{
			$("#use_yn").prop('checked',true);
		}
	    else
	    {
	    	$("#use_yn").prop('checked',false);
	    }
	    
		$('#title_year').val("${title_year}");
		$('#hidden_title_year').val('${title_year}');
		//$('#title_year').attr('readonly','readonly');
		getList();
	}
	else
	{
		add_history();
	}
})

function fncSubmit(){
	var f = document.fncForm;
	var target_year_line =document.getElementsByClassName("target_history_year");	//첨부파일 세팅
	var target_year = "";
	
	var target_cont_line =document.getElementsByClassName("target_history_cont");	//첨부파일 세팅
	var target_cont = "";
	
	var target_effect_line =document.getElementsByClassName("target_history_effect");	//첨부파일 세팅
	var target_effect = "";
	
	var target_logo_line =document.getElementsByClassName("target_history_logo");	//첨부파일 세팅
	var target_logo = "";
	

    
    if (f.create_date.value=="") 
	{
		alert("등록일을 정해주세요.");
		f.create_date.focus();
		return;
	}
    
    if (f.title_year.value=="") 
	{
		alert("연도를 지정해주세요.");
		f.title_year.focus();
		return;
	}
    
    if (containsNum(f.title_year)==true) 
	{
		alert("숫자만 입력해주세요.");
		f.title_year.value='';
		f.title_year.focus();
		return;
	}
    
    if (f.title_year.value.length != 4) 
	{
		alert("연도를 입력해주세요.");
		f.title_year.value='';
		f.title_year.focus();
		return;
	}
    
    
    var use_yn="N";
    
    if($("#use_yn").prop('checked')==true)
	{
		use_yn="Y";
	}
    f.hidden_use_yn.value = use_yn;
    
	
	if(target_year_line.length == 0)
	{
		alert('연혁 내용이 필요합니다.');
		return;
	}
    
    
    for (var i = 0; i < target_year_line.length; i++) 
    {
    	// ********* target year 세팅 start ********* //
    	if( target_year_line[i].value=="")
		{
    		alert('연도를 입력해주세요.');
    		target_year_line[i].focus();
    		return;
		}
    	if(containsCustom(target_year_line[i]))
    	{
    		alert("사용할 수 없는 문자가 포함되어 있습니다. \n (숫자 혹인 '.'로 구분해주세요. ex)2022.02 )");
    		return;
    	}
    	if(target_year_line[i].value.indexOf('.')!=-1)
    	{
    		var temp = target_year_line[i].value.split('.');
    		target_year_line[i].value = (temp[1]*1) < 10 ? temp[0]+'.0'+(temp[1]*1) : target_year_line[i].value;
    	}
  		target_year +=target_year_line[i].value+"|";
  		
  		// ********* target year 세팅 end ********* //
  	
  		// ********* target cont 세팅 end ********* //
  		if( target_cont_line[i].value=="")
		{
    		alert('내용을 입력해주세요.');
    		target_cont_line[i].focus();
    		return;
		}
  		if(target_cont_line[i].value.indexOf('|')!=-1)
    	{
  			alert('입력할 수 없는 문자가 포함되어 있습니다.("|") ');
  			return;
    	}
  		target_cont +=target_cont_line[i].value+"|";
  		// ********* target cont 세팅 end ********* //
  		
  		// ********* target effect 세팅 end ********* //
  		if( target_effect_line[i].checked===true)
		{
  			target_effect+="Y|";
		}
  		else
  		{
  			target_effect+="N|";
  		}
  		// ********* target effect 세팅 end ********* //
  		
  		// ********* target logo 세팅 end ********* //
  		if( target_logo_line[i].checked===true)
		{
  			target_logo+="Y|";
		}
  		else
  		{
  			target_logo+="N|";
  		}
  		// ********* target logo 세팅 end ********* //
  		
	}
    
    //데이터 확인용
    //alert("year : "+target_year+"\ncont : "+target_cont+"\neffect : "+target_effect+"\nlogo : "+target_logo);

    f.history_ymd.value		= target_year;
    f.history_cont.value	= target_cont;
    f.effect_yn.value		= target_effect;
    f.logo_yn.value			= target_logo;
    
	f.action="/admin/history/write_his_target";
	$("#fncForm").ajaxSubmit({ 
		success: function(data)
		{
			console.log(data);
			var result = JSON.parse(data);
			alert(result.msg);
			if(result.isSuc=='success')
			{
				location.href="/admin/history/list";
			}
		}
	});
}

function setToday(){
	var date = new Date(),
		year = date.getFullYear(),
		month = date.getMonth() + 1,
		day = date.getDate();
	month < 10?month="0"+month:'';
	day < 10?day="0"+day:'';
	$('#create_date').val(year+"-"+month+"-"+day);
}



var target_cnt=0;
function add_history(){
	var inner ="";
	inner +='<div id="target_div_'+target_cnt+'" class="history_target_cnt">';
	inner +='	<p class="writebox_tit target_div">연혁 내용'+(target_cnt+1)+'</p>';
	inner +='	<div class="writebox_cont">';
	inner +='		<input type="text" id="target_history_year_'+target_cnt+'" class="month-i target_history_year" placeholder="연도.월">';
	inner +='		<input type="button" value="삭제" class="btn del_btn" onclick="del_history('+target_cnt+');">';
	inner +='		<div class="history_cont">';
	inner +='			<textarea id="target_history_cont_'+target_cnt+'" class="target_history_cont" placeholder="내용을 입력해주세요."></textarea>';
	inner +='			<div class="history_check_Box">';
	inner +='				<label for="target_history_effect_'+target_cnt+'">';
	inner +='					<input type="checkbox" id="target_history_effect_'+target_cnt+'" name="target_history_effect" class="target_history_effect">하이라이트 효과';
	inner +='				</label>';
	
	inner +='				<label for="target_history_logo_'+target_cnt+'">';
	inner +='					<input type="checkbox" id="target_history_logo_'+target_cnt+'" name="target_history_logo" class="target_history_logo">셀리버리 LH 로고 삽입';
	inner +='				</label>';
	inner +='			</div>';
	inner +='		</div>';
	inner +='	</div>';
	inner +='</div>';
	
	$('#target_area').append(inner);
	target_cnt++;
}

function del_history(idx){
	$('#target_div_'+idx).remove();
}

function getList(){

	$.ajax({
		type : "POST", 
		url : "/admin/history/getHistoryTargetList",
		dataType : "text",
		data : 
		{
			idx : '${idx}'
		},
		error : function() 
		{
			console.log("AJAX ERROR");
		},
		success : function(data) 
		{
			console.log(data);
			var result = JSON.parse(data);
			if(result.list.length > 0)
			{
				for(var i = 0; i < result.list.length; i++)
				{
					add_history();
					$('#target_history_year_'+i).val(result.list[i].history_ymd);
					$('#target_history_cont_'+i).val(repWord(result.list[i].cont));
					result.list[i].effect_yn=='Y'?$('#target_history_effect_'+i).prop('checked',true) : $('#target_history_effect_'+i).prop('checked',false);
					result.list[i].logo_yn=='Y'?$('#target_history_logo_'+i).prop('checked',true) : $('#target_history_logo_'+i).prop('checked',false);
				}
			}
		}
	});
}


</script>

<div id="container">
	<div class="inner">
		<div class="inner_top">
			<h2 class="ad_tit">연혁 등록/수정</h2>
			<p class="ad_titDesc">연혁을 수정하고 관리합니다.</p>
		</div>	
		<form id="fncForm" name="fncForm" class="history_form" method="post" enctype="multipart/form-data">
			<input type="hidden" name="hidden_use_yn">
			<input type="hidden" id="hidden_title_year" name="hidden_title_year">
			<input type="hidden" name="idx" name="idx" value="${idx}">
			<input type="hidden" name="history_ymd">
			<input type="hidden" name="history_cont">
			<input type="hidden" name="effect_yn">
			<input type="hidden" name="logo_yn">
						

			
			
			<div class="inner_cont write_cont">
				<div class="write_date">
					<p class="writebox_tit">등록일</p>
					<div class="writebox_cont">
						<input type="text" id="create_date" name="create_date" class="date-i">
					</div>		
					
				
								
					<p class="writebox_tit">노출 여부</p>
					<div class="writebox_cont switch">
						<input type="checkbox" id="use_yn" class="switch" checked="checked">
						<label for="use_yn" class="switch_label">			
							<span class="onf_btn"></span>			
							<span class="onf_btn_text off on">OFF</span>			
							<span class="onf_btn_text on_2">ON</span>		
						</label>
					</div>
				</div>
	
				<div class="write_date">
					<p class="writebox_tit">연도</p>
					<div class="writebox_cont">
						<input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" id="title_year" placeholder="연도를 입력하세요" name="title_year" class="title_year">
						<input type="button" class="btn" value="연혁 내용 추가" onclick="add_history();">	
					</div>
				</div>
				
				<div id="target_area" class="write_title">
				
					
				</div>

			</div>
			<div class="btn_box">
				<label for="goList_btn" class="btn goList_btn">목록</label>
				<input type="button" id="goList_btn" value="목록" onclick="location.href='/admin/history/list'">
				<label for="save_btn" class="btn btn2 save_btn">저장</label>	
				<input type="button" id="save_btn" value="저장" onclick="fncSubmit();">			
			</div>
		</form>
		
	</div>
</div>

<jsp:include page="/WEB-INF/admin/common/footer.jsp"/>