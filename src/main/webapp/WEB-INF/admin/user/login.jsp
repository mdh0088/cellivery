<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
var isLogin = "<%=session.getAttribute("login_idx")%>";
var link = location.href;
if (isLogin != "null") {
	location.href = "/admin";
}
</script>


<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="Compatible" content="no-cache"/>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<title>Musign</title>
		<link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon">
		<link rel="stylesheet" type="text/css" href="/inc/css/family_musign.css" />
		<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
		<script src="http://malsup.github.io/min/jquery.form.min.js"></script>
		<script src="/inc/js/domain_chk_family.js"></script>
		<link rel="stylesheet" href="/css/admin/musign.css">
<script>

function login()
{
	if($("#login_user_id").val() == "")
	{
		alert("아이디를 입력해주세요.");
		$("#login_user_id").focus();
		return;
	}
	if($("#login_pw").val() == "")
	{
		alert("비밀번호를 입력해주세요.");
		$("#login_pw").focus();
		return;
	}
	$("#loginForm").ajaxSubmit({
		success: function(data)
		{
    		var result = JSON.parse(data);
    		if(result.isSuc == "success")
    		{
    			alert(result.msg);
    			location.replace('/admin');
    		}
    		else
    		{
    			alert('아이디와 비밀번호를 확인해주세요.');
    		}
		}
	});
}


function enter_check_login()
{
	if(event.keyCode == 13){
		login();
		return;
	}
}

</script>


	</head>
	<body class="log_page">		
		<div class="user_login">
		  	<form id="loginForm" class="user_login_form" name="loginForm" method="post" action="/admin/user/login_proc">
		  		<div class="logo_img"><img src="/img/admin/login_logo.png"></div>
		      	<div class="log-line">
		      		<input type="text" class="user_id" id="login_user_id" name="login_user_id" placeholder="아이디">
		      	</div>       	
		      	<input type="password" class="user_pw" id="login_pw" name="login_pw" placeholder="비밀번호" onkeydown="javascript:enter_check_login();">
		      	<!-- 
		      	<div class="chk-wrap chkbox">
		      		<input type="checkbox" id="remember_pw" name="remember_pw"/>        		
		      		<label for="remember_pw"><span></span>기억하기</label>
		      	</div>
		      	 -->
		      	 <label for="login_btn" class="login_btn">로그인</label>
		      	<input id="login_btn" type="button" onclick="login()" value="LOGIN">
		  	</form>
		</div>
		<jsp:include page="/WEB-INF/admin/common/footer.jsp"/>
	</body>
</html>