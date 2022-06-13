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
	getCateList();
	setToday();
	if("${idx}"!=="")
	{
	    if("${use_yn}"=='Y')
		{
			$("#use_yn").prop('checked',true);
		}
		
		if("${up_show_yn}"=='Y')
		{
			$("#up_show_yn").prop('checked',true);
		}
		$('#create_date').val("${create_date}");
		$('#title').val("${title}");
		$('#board_cont').val(repWord("${cont}"));
		
		var cate_title = $('#cate_idx_${cate_idx}').text();
		choose_cate('${cate_idx}',cate_title);
		
		var file_nm_arr = "${file_ori}".split('|');
		for(var i = 0; i < file_nm_arr.length; i++)
		{
			$('#detail_receipt_nm_'+(i+1)).val(file_nm_arr[i]);
		}
		if("${thumb_ori}"!="")
		{
			$('#detail_receipt_nm_4').val("${thumb_ori}");
		}
	}
})

function setToday(){
	var date = new Date(),
		year = date.getFullYear(),
		month = date.getMonth() + 1,
		day = date.getDate();
	month < 10?month="0"+month:'';
	day < 10?day="0"+day:'';
	$('#create_date').val(year+"-"+month+"-"+day);
}

function choose_cate(idx,nm){
	var target_idx = nullChk(idx);
	if(target_idx=="")
	{
		$('.cate_list_nm').text('전체');
	}	
	$('.cate_list_nm').text(nm);
	$('#cate_list').val(idx);
}

function getCateList()
{
	$.ajax({
		type : "POST", 
		url : "/admin/pr/category/getCateList",
		dataType : "text",
		async: false,
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
				for(var i = 0; i < result.list.length; i++)
				{
					if("${cate_idx}"==result.list[i].idx)
					{
						$('#cate_list').val(result.list[i].idx);
						$('.cate_list_nm').text(result.list[i].title);
						//inner+='<option value="'+result.list[i].idx+'" selected>';
					}
					else
					{
						$('#cate_list').val(result.list[0].idx);
						$('.cate_list_nm').text(result.list[0].title);
					}

					inner +='<li id="cate_idx_'+result.list[i].idx+'" onclick="choose_cate('+result.list[i].idx+',\''+result.list[i].title+'\')">'+result.list[i].title+'</li>';
				}
			}
			else
			{
				inner +='<li>등록된 카테고리가 없습니다.</li>'
			}
			$('.cate_list').html(inner);
		}
	});
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
		if(i < 3)
		{
	    	if (temp_line[i].value!="") 
	    	{
	    		fileNm_line += temp_line[i].value+'|';
			}
		}
		else
		{
			thumbNm_line +=temp_line[i].value;
		}
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
    
    if (f.board_cont.value=="") 
	{
		alert("내용을 작성해주세요.");
		f.board_cont.focus();
		return;
	}
  
    /*
    if(nullChk(thumbNm_line)=="")
	{
    	alert("썸네일을 등록해주세요.");
    	return;
	}
    */
    
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
    
    var file_nm_arr="";
    if($('#detail_receipt_nm_1').val()!="")
    {
    	if(
			$('#detail_receipt_nm_1').val()==$('#detail_receipt_nm_2').val()||
			$('#detail_receipt_nm_1').val()==$('#detail_receipt_nm_3').val()
    	  )
    	{
    		alert('이미 같은 이름의 파일이 있습니다.');
    		return;
    	}
    	file_nm_arr+=$('#detail_receipt_nm_1').val()+"|";
    	
    }
    if($('#detail_receipt_nm_2').val()!="")
    {
    	if(
   			$('#detail_receipt_nm_2').val()==$('#detail_receipt_nm_1').val()||
   			$('#detail_receipt_nm_2').val()==$('#detail_receipt_nm_3').val()
       	  )
       	{
       		alert('이미 같은 이름의 파일이 있습니다.');
       		return;
       	}
   	file_nm_arr+=$('#detail_receipt_nm_2').val()+"|";
    }
    if($('#detail_receipt_nm_3').val()!="")
    {
    	if(
   			$('#detail_receipt_nm_3').val()==$('#detail_receipt_nm_1').val()||
   			$('#detail_receipt_nm_3').val()==$('#detail_receipt_nm_2').val()
       	  )
       	{
       		alert('이미 같은 이름의 파일이 있습니다.');
       		return;
       	}
    	file_nm_arr+=$('#detail_receipt_nm_3').val()+"|";
    }
    
    $("#hidden_file_nm_arr").val(file_nm_arr);
    $("#hidden_thumb_nm").val($('#detail_receipt_nm_4').val());
    
    
    
	f.action="/admin/pr/write_pr_target";
	$("#fncForm").ajaxSubmit({ 
		success: function(data)
		{
			console.log(data);
			var result = JSON.parse(data);
			alert(result.msg);
			location.href="/admin/pr/notice/list";
		}
	});
	
	
}
</script>

<div id="container">
	<div class="inner">
		<div class="inner_top">
			<h2 class="ad_tit">Notice 등록/수정</h2>
			<p class="ad_titDesc">Notice 게시글을 수정하고 관리합니다.</p>
		</div>	
		<form id="fncForm" name="fncForm" class="sub" method="post" enctype="multipart/form-data">
			<input type="hidden" name="hidden_use_yn">
			<input type="hidden" name="hidden_up_show_yn">
			<input type="hidden" id="hidden_file_nm_arr" name="hidden_file_nm_arr">
			<input type="hidden" id="hidden_thumb_nm" name="hidden_thumb_nm">
			<input type="hidden" id="tbl" name="tbl" value="notice">
			<input type="hidden" id="cate_list" name="cate_list" value="${cate_idx}">
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
				<div class="write_cate">
					<p class="writebox_tit">카테고리</p>
					<div class="writebox_cont">				
						<div class="select_box">
							<div class="cate_list_nm"></div>
							<ul class="cate_list"></ul>
						</div>
					</div>	
				</div>
				<div class="write_title">
					<p class="writebox_tit">제목</p>
					<div class="writebox_cont">
						<input type="text" id="title" name="title" placeholder="제목을 입력해주세요.">
					</div>
				</div>
				<div class="write_content">
					<p class="writebox_tit">내용</p>
					<div class="writebox_cont">
						<textarea id="board_cont" name="board_cont"></textarea>
					</div>
				</div>
				<div class="write_file">
					<div class="fileList fileList1">
						<p class="writebox_tit">첨부파일 1</p>
						<div class="writebox_cont">
							<div id="detail_1">
								<input id="detail_receipt_nm_1" class="upload-name file_nm" name="detail_receipt_nm" value="" readonly="readonly" placeholder="10MB 이내로 업로드">
								<input type="file" id="detail_receipt_1" class="detail_receipt" name="detail_receipt" onchange="checkSize(this,'1')">
								<input type="button" value="삭제" class="btn-del filebtn btn" onclick="del_detail('1')">
								<label class="filebtn btn" for="detail_receipt_1">파일첨부</label>
							</div>
						</div>
					</div>
					<div class="fileList fileList2">
						<p class="writebox_tit">첨부파일 2</p>
						<div class="writebox_cont">
							<div id="detail_2">
								<input id="detail_receipt_nm_2" class="upload-name file_nm" name="detail_receipt_nm" value="" readonly="readonly" placeholder="10MB 이내로 업로드">
								<input type="file" id="detail_receipt_2" class="detail_receipt" name="detail_receipt" onchange="checkSize(this,'2')">
								<input type="button" value="삭제" class="btn-del filebtn btn" onclick="del_detail('2')">
								<label class="filebtn btn" for="detail_receipt_2">파일첨부</label>
							</div>
						</div>
					</div>
					<div class="fileList fileList3">
						<p class="writebox_tit">첨부파일 3</p>
						<div class="writebox_cont">
							<div id="detail_3">
								<input id="detail_receipt_nm_3" class="upload-name file_nm" name="detail_receipt_nm" value="" readonly="readonly" placeholder="10MB 이내로 업로드">
								<input type="file" id="detail_receipt_3" class="detail_receipt" name="detail_receipt" onchange="checkSize(this,'3')">
								<input type="button" value="삭제" class="btn-del filebtn btn" onclick="del_detail('3')">
								<label class="filebtn btn" for="detail_receipt_3">파일첨부</label>
							</div>
						</div>
					</div>
				</div>
				<div class="write_thumb">
					<p class="writebox_tit">썸네일</p>
					<div class="writebox_cont">
						<div id="detail_4">
							<input id="detail_receipt_nm_4" class="upload-name file_nm" name="detail_receipt_nm" value="" readonly="readonly" placeholder="10MB 이내로 업로드 (jpg, png 파일)">
							<input type="file" id="detail_receipt_4" class="detail_receipt" name="thumb_img" onchange="checkSize(this,'4')">
							<input type="button" value="삭제" class="btn-del filebtn btn" onclick="del_detail('4')">
							<label class="filebtn btn" for="detail_receipt_4">파일첨부</label>
						</div>
						<p class="thumb_desc">메인에 노출할 썸네일을 등록하세요. (썸네일 없을 시 기본 로고 이미지로 대체) * 권장 사이즈 : 343 x 260 px</p>
					</div>
				</div>
				<div class="write_option">
					<p class="writebox_tit">옵션</p>
					<div class="writebox_cont">
						<input type="checkbox" id="up_show_yn"> 상단 고정하기
					</div>
				</div>
			</div>	
			<div class="btn_box">
				<label for="goList_btn" class="btn goList_btn">목록</label>
				<input type="button" id="goList_btn" value="목록" onclick="location.href='/admin/pr/notice/list'">
				<label for="save_btn" class="btn btn2 save_btn">저장</label>	
				<input type="button" id="save_btn" value="저장" onclick="fncSubmit();">			
			</div>
		</form>
		
	</div>
</div>

<jsp:include page="/WEB-INF/admin/common/footer.jsp"/>