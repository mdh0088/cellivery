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

	if("${idx}"!='')
	{
		$('#user_nm').val('${name}');
		$('#user_id').val('${id}');
		$('#user_email').val('${email}');
		$('#user_phone').val('${phone}');
	}
});


function save_user_info(){
	
	if(nullChk($('#user_nm').val())=='')
	{
		alert('관리자 명을 입력해주세요.');
		$('#user_nm').focus();
		return;
	}
	
	if(nullChk($('#user_pw').val())=='')
	{
		alert('비밀번호를 채워주세요.');
		$('#user_pw').focus();
		return;
	}
	
	if(nullChk($('#user_pw_chk').val())=='')
	{
		alert('비밀번호 확인란을 채워주세요.');
		$('#user_pw_chk').focus();
		return;
	}
	
	if($('#user_pw_chk').val()!=$('#user_pw').val())
	{
		alert('비밀번호가 맞지 않습니다.');
		return;
	}
	
	
	if(nullChk($('#user_email').val())=='')
	{
		alert('메일을 채워주세요.');
		$('#user_email').focus();
		return;
	}
	
	
	if(nullChk($('#user_phone').val())=='')
	{
		alert('전화번호를 채워주세요.');
		$('#user_phone').focus();
		return;
	}
	
	if(isNaN($('#user_phone').val())===true)
	{
		alert("숫자만 입력해주세요.");
		$('#user_phone').focus();
		return false;
	}
	
	
	$.ajax({
		type : "POST", 
		url : "/admin/user/join_proc",
		dataType : "text",
		async : false,
		data : 
		{
			idx : '${idx}',
			user_nm : $('#user_nm').val(),
			user_id : $('#user_id').val(),
			user_pw : $('#user_pw').val(),
			user_email : $('#user_email').val(),
			user_phone : $('#user_phone').val()
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
	
</script>
<div id="container">
	<div class="inner user_inner mypage">
		<div class="inner_top">
			<h2 class="ad_tit">마이페이지</h2>
		</div>
		
		<div class="search_box user_infoBox">
			<div class="search_inner search_top">
				<div class="user_nm_box">
					<p class="search_tit">관리자명</p> 
					<input type="text" id="user_nm" placeholder="관리자명을 입력하세요.">
				</div>
				<div class="user_id_box">
					<p class="search_tit">아이디</p> 
					<input type="text" id="user_id" placeholder="아이디를 입력하세요." readonly="readonly">
					<span>* 아이디 변경을 원하시면 마스터 관리자에게 문의바랍니다.</span>
				</div>
				<div class="user_pw_box">
					<div class="pw1">
						<p class="search_tit">비밀번호</p> 
						<input type="password" id="user_pw"  placeholder="비밀번호를 입력하세요.">
					</div>
					<div class="pw2">
						<p class="search_tit">비밀번호 확인</p> 
						<input type="password" id="user_pw_chk" placeholder="비밀번호를 입력하세요.">
					</div>
				</div>
				<div class="user_email_box">
					<p class="search_tit">이메일</p> 
					<input type="text" id="user_email" placeholder="이메일을 입력하세요.">
				</div>
				<div class="user_phone_box">
					<p class="search_tit">연락처</p> 
					<input type="text" id="user_phone" placeholder="연락처를 입력하세요.">
				</div>
			</div>
		</div>
		
		<div class="btn_box">
			<label for="goList_btn" class="btn goList_btn">홈으로</label>
			<input type="button" id="goList_btn" value="목록" onclick="location.href='/admin'">
			<label for="save_btn" class="btn btn2 save_btn">저장</label>	
			<input type="button" id="save_btn" value="저장" onclick="save_user_info();">			
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/admin/common/footer.jsp"/>