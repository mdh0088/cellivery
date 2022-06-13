<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/admin/common/header.jsp"/>

<div id="container">
	<div class="inner index_inner">
		<div class="index_txt_box">
            <div class="imgBox"><img src="/img/admin/login_logo.png"></div>
            <h2 class="sub_txt ft-24">안녕하세요, 셀리버리 L&H 관리자 시스템입니다.</h2>
            <p class="sub_txt_desc ft-18">
				본 시스템은 셀리버리L&H 임직원 및 관계자 중 사전 등록된 사용자에 한해 사용할 수 있습니다.<br>
				불법적인 접근 및 사용시 관련 법규에 의해 처벌될 수 있습니다.
            </p>
            <a href="/" target="_blank" class="page_btn ft-18">셀리버리L&H 웹사이트 바로가기</a>
        </div>
	</div>
</div>
       
<jsp:include page="/WEB-INF/admin/common/footer.jsp"/>