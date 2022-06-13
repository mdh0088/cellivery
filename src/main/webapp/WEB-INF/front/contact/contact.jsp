<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/front/common/header.jsp"/>


<div class="subpage contact">
	 <div class="sub_banner">
	 	<h2 class="sub_page_name lato">CONTACT</h2>	
	 		
	 </div>
	 <div class="sub_content">	 	    
	 	<section class="sec01 section sub-txt">			
	 		<img src="/img/sub/contact/contact-bgImg01.png" alt="셀리버리L&H" >   			
				<div class="center-content-box txtEffect">
					<h3 class="sub-sec-sub-tit">Direction</h3>
					<div class="map-container">
						<div class="map-box">
							<iframe class="map01" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3162.108284309937!2d126.896419515312!3d37.57606777979622!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c99103b9a1d6d%3A0xf8a5a0efea14fe64!2s179%20Seongam-ro%2C%20Mapo-gu%2C%20Seoul!5e0!3m2!1sen!2skr!4v1645682689595!5m2!1sen!2skr" width="820" height="470" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
							<iframe class="map02" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3172.227147164973!2d127.50038461564355!3d37.337130744989686!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x35635a302a41a819%3A0xd34987b990936f43!2s873%20Cheongbaengni-ro%2C%20Baeksa-myeon%2C%20Icheon%2C%20Gyeonggi-do!5e0!3m2!1sen!2skr!4v1645684590613!5m2!1sen!2skr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
						</div>
						<ul class="address-box">
							<li class="on">
								<div class="tit">
									<p>서울본사</p>
									<img src="/img/sub/contact/contact-icon02.png" alt="셀리버리L&H">
									<img src="/img/sub/contact/contact-icon.png" alt="셀리버리L&H">
								</div>
								<p class="addr">서울 마포구 성암로 179, B1</p>
							</li>
							<li>
								<div class="tit">
									<p>이천 사업장</p>
									<img src="/img/sub/contact/contact-icon02.png" alt="셀리버리L&H">
									<img src="/img/sub/contact/contact-icon.png" alt="셀리버리L&H">
								</div>
								<p class="addr">경기도 이천시 백사면 청백리로 873</p>
							</li>
						</ul>
					</div>					
				</div>			
		</section>
		<section class="sec02 section">		
			<img src="/img/sub/contact/contact-bgImg02.png" alt="셀리버리L&H" >	
			<div class="center-content-box txtEffect">
				<h3 class="sub-sec-sub-tit">Inquiry</h3>
				<p class="phone">대표번호 <span>02-2170-7400</span></p>
				<p class="sub-sec-sub-txt">브랜드별 사업/제휴 문의는 아래 이메일로 연락주시기 바랍니다.</p>
				
				<ul class="inquiry-box">
                 <li>
                     <span class="logo-box">
                     	<img src="img/sub/contact/contact-logo-b01.png" alt="셀리버리L&H" class="b-ver">
                     	<img src="img/sub/contact/contact-logo-w01.png" alt="셀리버리L&H" class="w-ver">
                     </span>
                     <div class="bottom-box">
		                 <p class="brand">더 라퓨즈</p>
		                 <p class="mail">therapuez@celliverylh.com</p>
                         <a href="mailto:therapuez@celliverylh.com" class="circle-link">
                             <img src="img/sub/contact/arrow-w.png" alt="셀리버리L&H" class="white">
                             <img src="img/arrow.png" alt="셀리버리L&H" class="color">
                                                                    
                         </a>
                     </div>
                    <div class="shadow-box"></div>
                 </li>
                  <li>
                      <span class="logo-box">
                     	<img src="img/sub/contact/contact-logo-b02.png" alt="셀리버리L&H" class="b-ver">
                     	<img src="img/sub/contact/contact-logo-w02.png" alt="셀리버리L&H" class="w-ver">
                     </span>
                     <div class="bottom-box">
		                 <p class="brand">바이오늘</p>
		                 <p class="mail">bioneul@celliverylh.com</p>
                         <a href="mailto:bioneul@celliverylh.com" class="circle-link">
                             <img src="img/sub/contact/arrow-w.png" alt="셀리버리L&H" class="white">
                             <img src="img/arrow.png" alt="셀리버리L&H" class="color">                             
                         </a>
                     </div>
                    <div class="shadow-box"></div>
                  </li>
                  <!-- <li style="display:none;">
                      <span class="logo-box">
                     	<img src="img/sub/contact/contact-logo-b03.png" alt="셀리버리L&H" class="b-ver">
                     	<img src="img/sub/contact/contact-logo-w03.png" alt="셀리버리L&H" class="w-ver">
                     </span>
                     <div class="bottom-box">
		                 <p class="brand">셀리그램</p>
		                 <p class="mail">celligram@celliverylh.com</p>
                         <a href="mailto:celligram@celliverylh.com" class="circle-link">
                             <img src="img/sub/contact/arrow-w.png" alt="셀리버리L&H" class="white">
                             <img src="img/arrow.png" alt="셀리버리L&H" class="color">                                    
                         </a>
                     </div>
                      <div class="shadow-box"></div>
                  </li>          -->                 
               </ul>
			</div>
			
		</section>				
	 </div>	 
	 
</div>
<script src="/js/sub.js"></script>
<jsp:include page="/WEB-INF/front/common/footer.jsp"/>