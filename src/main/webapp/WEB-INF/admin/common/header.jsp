<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
 response.setHeader("Cache-Control","no-cache");
 response.setHeader("Pragma","no-cache");
 response.setDateHeader("Expires",0);
%>
<script>
var isLogin = "<%=session.getAttribute("login_idx")%>";
var link = location.href;

if ((isLogin == null || isLogin == "null") && link.indexOf("/admin/login") == -1) {
	alert("로그인 후 이용해주세요.");
	location.href = "/admin/user/login";
}
</script>




<html xmlns:th="http://www.thymeleaf.org" th:fragment="inc_header" lang="ko" data-dark="true">
<head>
    <link rel="icon" type="image/png" href="/img/favicon.png" sizes="16x16">	
<!--     <link rel="stylesheet" href="/css/musign.css"> -->
    <link rel="stylesheet" href="/css/admin/musign.css">
    <script src="/js/jquery.js"></script>
    <script src="/js/function.js"></script>
    <script src="/js/animation.js"></script>
    <script src="/js/admin/admin.js"></script>
    <script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" ></script>
	<script src="https://malsup.github.io/min/jquery.form.min.js"></script>
</head>

<script>
$( document ).ready(function() {
	var is_manager = "<%=session.getAttribute("is_manager")%>";
	if(is_manager=='N')
	{
		$('#manager_area').hide();
	}
	else
	{
		$('#manager_area2').hide();
	}
});

function change_use_yn(idx,tbl){
	var use_yn="";
	if($('#switch_chk'+idx).prop('checked')==true)
	{
		if(!confirm("사이트에 노출하시겠습니까?"))
		{
			$('#switch_chk'+idx).prop('checked',false);
			return;
		}
		use_yn='Y';
	}
	else
	{
		if(!confirm("사이트에서 숨기시겠습니까?"))
		{
			$('#switch_chk'+idx).prop('checked',true);
			return;
		}
		use_yn='N';
	}
	
	$.ajax({
		type : "POST", 
		url : "/admin/main/change_use_yn",
		dataType : "text",
		async : false,
		data : 
		{
			idx : idx,
			use_yn : use_yn,
			tbl : tbl
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

<body>
	<div id="header">
	    <div class="header_wrap">
	        <div class="left">
	            <a href="/admin"><img src="/img/admin/logo.png"></a>
	        </div>
	        <div class="right">
	            <ul>          
	                <li class="mypage_info">
	                    <div class="admin">
							<img src="/img/admin/user.png" alt="아이콘">
								<a href="/admin/user/mypage"><span class="userNm">Admin</span></a>
	                        <img src="/img/admin/down.png" alt="아이콘" class="arrow_icon">
	                    </div>
	
	                    <ul>

	                        <li>
	                            <div id="manager_area2" class="mypage"> <a href="/admin/user/mypage">마이 페이지</a></div>
	                        </li>
	                        <li id="manager_area">
	                            <div class="master">
	                                <!-- 마스터계정일때만 -->
	                                <a href="/admin/user/list">관리자 설정</a>
	                            </div>
	                        </li>
	                        
	                        <li>
	                            <div class="logout"><a href="/admin/user/logout">로그아웃</a></div>
	                        </li>
	                    </ul>
	                </li>
	            </ul>
	        </div>
	    </div>
	
	    <div class="lnb_wrap">
	        <div class="lnb">
	            <ul class="dep1">
	                <li>
						<div class="ft-16 dep1_tit">
							메인 콘텐츠 관리 <img src="/img/admin/down.png" alt="아이콘" class="arrow_icon">
						</div>
	                    <ul class="dep2">
	                        <li><a href="/admin/main/popup/list" class="ft-16">메인 팝업 관리</a></li>
	                        <li><a href="/admin/main/pr/list" class="ft-16">메인 PR 콘텐츠 관리</a></li>
	                    </ul>
	                </li>
	                <li>
						<div class="ft-16 dep1_tit">
							서브 콘텐츠 관리 <img src="/img/admin/down.png" alt="아이콘" class="arrow_icon">
						</div>
	                    <ul class="dep2">
	                        <li><a href="/admin/history/list" class="ft-16">연혁 관리</a></li>
	                    </ul>
	                </li>
	                <li>
	                    <div class="ft-16 dep1_tit">
							PR 관리 <img src="/img/admin/down.png" alt="아이콘" class="arrow_icon">
						</div>
	                    <ul class="dep2">
	                    	<li><a href="/admin/pr/category/list" class="ft-16">Category 관리</a></li>
	                        <li><a href="/admin/pr/notice/list" class="ft-16">Notice 관리</a></li>
	                        <li><a href="/admin/pr/news/list" class="ft-16">News 관리</a></li>
	                        <li><a href="/admin/pr/media/list" class="ft-16">Media 관리</a></li>
	                        <li><a href="/admin/pr/youtube/list" class="ft-16">Youtube 관리</a></li>
	                        <li><a href="/admin/pr/insta/list" class="ft-16">Instagram 관리</a></li>
	                    </ul>
	                </li>
	            </ul>
	        </div>
	    </div>
	
	    <script>
	        function langChange(lang) {
	            var url = new URL(location.href);
	            url.searchParams.set("lang", lang);
	            location.href = url;
	        }
	    </script>
	</div>