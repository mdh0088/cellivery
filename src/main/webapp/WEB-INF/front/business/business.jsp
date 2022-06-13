<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/front/common/header.jsp"/>

<!-- <div class="subpage real-server">
	 <img src="/img/sub/busi_pc.jpg" alt="셀리버리L&H" class="subImg pc-ver">
	 <img src="/img/sub/busi_m.jpg" alt="셀리버리L&H" class="subImg mo-ver">
	 <img src="/img/sub03.png" alt="셀리버리L&H" class="pc-ver subImg">
	 <img src="/img/m_sub03.png" alt="셀리버리L&H" class="mo-ver subImg">
</div> -->
<div class="subpage business beauty">
	 <div class="sub_banner">
	 	<h2 class="sub_page_name lato">BUSINESS</h2>	 
	 	<div class="sub_nav_wrap">
	 		<p class="mo-ver current_menu">BEAUTY<img src="/img/sub/m_sub_nav_btn.png" alt="셀리버리L&H"></p> 		
	 		<ul class="sub_nav">
	 			<li class="on lato">
	 				<a href="business">BEAUTY</a>
	 				 <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 240.1 240.3" class="svgImg pc-ver">
	                     <g>
	                         <circle cx="120.1" cy="67.6" r="4.6" style="fill:#fff"></circle>
	                         <circle cx="157.4" cy="82.9" r="4.6" style="fill:#fff"></circle>
	                         <circle cx="172.7" cy="120.1" r="4.6" style="fill:#fff"></circle>
	                         <circle cx="157.5" cy="157.3" r="4.6" style="fill:#fff"></circle>
	                         <circle cx="120.2" cy="172.7" r="4.6" style="fill:#fff"></circle>
	                         <circle cx="83" cy="157.3" r="4.6" style="fill:#fff"></circle>
	                         <circle cx="67.6" cy="120.1" r="4.6" style="fill:#fff"></circle>
	                         <circle cx="82.8" cy="82.8" r="4.6" style="fill:#fff"></circle>
	                     </g>
	                     <g>
	                         <circle cx="136.3" cy="39.3" r="5.8" style="fill:#fff"></circle>
	                         <circle cx="166" cy="51.7" r="5.8" style="fill:#fff"></circle>
	                         <circle cx="188.7" cy="74.4" r="5.8" style="fill:#fff"></circle>
	                         <circle cx="201" cy="104" r="5.8" style="fill:#fff"></circle>
	                         <circle cx="200.9" cy="136.2" r="5.8" style="fill:#fff"></circle>
	                         <circle cx="188.7" cy="165.9" r="5.8" style="fill:#fff"></circle>
	                         <circle cx="165.9" cy="188.6" r="5.8" style="fill:#fff"></circle>
	                         <circle cx="136.2" cy="200.9" r="5.8" style="fill:#fff"></circle>
	                         <circle cx="104.2" cy="200.9" r="5.8" style="fill:#fff"></circle>
	                         <circle cx="74.4" cy="188.7" r="5.8" style="fill:#fff"></circle>
	                         <circle cx="51.5" cy="166" r="5.8" style="fill:#fff"></circle>
	                         <circle cx="39.4" cy="136.4" r="5.8" style="fill:#fff"></circle>
	                         <circle cx="39.3" cy="104" r="5.8" style="fill:#fff"></circle>
	                         <circle cx="51.7" cy="74.5" r="5.8" style="fill:#fff"></circle>
	                         <circle cx="74.3" cy="51.7" r="5.8" style="fill:#fff"></circle>
	                         <circle cx="104" cy="39.3" r="5.8" style="fill:#fff"></circle>
	                     </g>
	                     <g>
	                         <circle cx="120.1" cy="8.1" r="8.1" style="fill:#fff"></circle>
	                         <circle cx="162.9" cy="16.6" r="8.1" style="fill:#fff"></circle>
	                         <circle cx="199.5" cy="40.8" r="8.1" style="fill:#fff"></circle>
	                         <circle cx="223.7" cy="77.6" r="8.1" style="fill:#fff"></circle>
	                         <circle cx="232" cy="120.3" r="8.1" style="fill:#fff"></circle>
	                         <circle cx="223.8" cy="162.9" r="8.1" style="fill:#fff"></circle>
	                         <circle cx="199.5" cy="199.4" r="8.1" style="fill:#fff"></circle>
	                         <circle cx="163" cy="223.8" r="8.1" style="fill:#fff"></circle>
	                         <circle cx="120.1" cy="232.3" r="8.1" style="fill:#fff"></circle>
	                         <circle cx="77.3" cy="223.6" r="8.1" style="fill:#fff"></circle>
	                         <circle cx="40.9" cy="199.4" r="8.1" style="fill:#fff"></circle>
	                         <circle cx="16.6" cy="163" r="8.1" style="fill:#fff"></circle>
	                         <circle cx="8.1" cy="120.1" r="8.1" style="fill:#fff"></circle>
	                         <circle cx="16.6" cy="77.4" r="8.1" style="fill:#fff"></circle>
	                         <circle cx="40.9" cy="41" r="8.1" style="fill:#fff"></circle>
	                         <circle cx="77" cy="16.5" r="8.1" style="fill:#fff"></circle>
	                     </g>
	                 </svg>
	 			
	 			</li>
	 			<li class="lato"><a href="/livingHealth">LIVING &amp; HEALTH</a></li>
	 			<li class="lato"><a href="biocareTissue">BIO-CARE TISSUE</a></li>
	 			<li class="lato"><a href="/odm">ODM</a></li>
	 		</ul>	
	 	</div> 	
	 </div>
	 <div class="sub_content">	 	
	 		<section class="sec01 section">
	 			<!-- <img src="/img/sub/busi/beauty-sec01-img01.png" alt="셀리버리L&H"> -->
 				<div class="sub-center-tit">
	 				<h3 class="sub_title lato black">Beauty</h3>
 				</div>
	 			<div class="center-content-box sub-txt">
	 				<div class="box01 txtEffect">
	 					<div class="sub-sec-tit-box">
	 						<p class="sub-sec-sub-tit spoqa-R "><strong class="">피부와 바이오의 결합</strong></p>
	 						<h4 class="sub-sec-tit spoqa-B "><strong class=""><span class="lato">Bio-Brid</span> 코스메틱</strong></h4>
	 					</div>
	 				</div>
	 				<div class="box02 txtEffect">
	 					<div class="sm-txt ">
 							<p class="spoqa-R ">
	 							㈜셀리버리 리빙앤헬스의 뷰티사업은 화장품 원료 개발부터<br class="mo-ver"/> 완제품까지 모든 부문을 <br class="pc-ver"/>
								아우르는 사업입니다.<br/><br class="height-trans">
								
								그동안의 화장품이 피부와 과학기술의 결합이었다면,<br/>
								셀리버리 리빙앤헬스의 뷰티사업은 피부와 <br class="mo-ver"> 바이오기술의 결합을 지향합니다.
	 						</p>
	 					</div>
	 					<a href="#" class="browse-more pc-ver">   
	                     	<strong class="">   
	                     	 <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 240.1 240.3" class="svgImg">
                                    <g>
                                        <circle cx="120.1" cy="67.6" r="4.6" style="fill:#9fbee4"></circle>
                                        <circle cx="157.4" cy="82.9" r="4.6" style="fill:#9fbee4"></circle>
                                        <circle cx="172.7" cy="120.1" r="4.6" style="fill:#9fbee4"></circle>
                                        <circle cx="157.5" cy="157.3" r="4.6" style="fill:#9fbee4"></circle>
                                        <circle cx="120.2" cy="172.7" r="4.6" style="fill:#9fbee4"></circle>
                                        <circle cx="83" cy="157.3" r="4.6" style="fill:#9fbee4"></circle>
                                        <circle cx="67.6" cy="120.1" r="4.6" style="fill:#9fbee4"></circle>
                                        <circle cx="82.8" cy="82.8" r="4.6" style="fill:#9fbee4"></circle>
                                    </g>
                                    <g>
                                        <circle cx="136.3" cy="39.3" r="5.8" style="fill:#9fbee4"></circle>
                                        <circle cx="166" cy="51.7" r="5.8" style="fill:#9fbee4"></circle>
                                        <circle cx="188.7" cy="74.4" r="5.8" style="fill:#9fbee4"></circle>
                                        <circle cx="201" cy="104" r="5.8" style="fill:#9fbee4"></circle>
                                        <circle cx="200.9" cy="136.2" r="5.8" style="fill:#9fbee4"></circle>
                                        <circle cx="188.7" cy="165.9" r="5.8" style="fill:#9fbee4"></circle>
                                        <circle cx="165.9" cy="188.6" r="5.8" style="fill:#9fbee4"></circle>
                                        <circle cx="136.2" cy="200.9" r="5.8" style="fill:#9fbee4"></circle>
                                        <circle cx="104.2" cy="200.9" r="5.8" style="fill:#9fbee4"></circle>
                                        <circle cx="74.4" cy="188.7" r="5.8" style="fill:#9fbee4"></circle>
                                        <circle cx="51.5" cy="166" r="5.8" style="fill:#9fbee4"></circle>
                                        <circle cx="39.4" cy="136.4" r="5.8" style="fill:#9fbee4"></circle>
                                        <circle cx="39.3" cy="104" r="5.8" style="fill:#9fbee4"></circle>
                                        <circle cx="51.7" cy="74.5" r="5.8" style="fill:#9fbee4"></circle>
                                        <circle cx="74.3" cy="51.7" r="5.8" style="fill:#9fbee4"></circle>
                                        <circle cx="104" cy="39.3" r="5.8" style="fill:#9fbee4"></circle>
                                    </g>
                                    <g>
                                        <circle cx="120.1" cy="8.1" r="8.1" style="fill:#9fbee4"></circle>
                                        <circle cx="162.9" cy="16.6" r="8.1" style="fill:#9fbee4"></circle>
                                        <circle cx="199.5" cy="40.8" r="8.1" style="fill:#9fbee4"></circle>
                                        <circle cx="223.7" cy="77.6" r="8.1" style="fill:#9fbee4"></circle>
                                        <circle cx="232" cy="120.3" r="8.1" style="fill:#9fbee4"></circle>
                                        <circle cx="223.8" cy="162.9" r="8.1" style="fill:#9fbee4"></circle>
                                        <circle cx="199.5" cy="199.4" r="8.1" style="fill:#9fbee4"></circle>
                                        <circle cx="163" cy="223.8" r="8.1" style="fill:#9fbee4"></circle>
                                        <circle cx="120.1" cy="232.3" r="8.1" style="fill:#9fbee4"></circle>
                                        <circle cx="77.3" cy="223.6" r="8.1" style="fill:#9fbee4"></circle>
                                        <circle cx="40.9" cy="199.4" r="8.1" style="fill:#9fbee4"></circle>
                                        <circle cx="16.6" cy="163" r="8.1" style="fill:#9fbee4"></circle>
                                        <circle cx="8.1" cy="120.1" r="8.1" style="fill:#9fbee4"></circle>
                                        <circle cx="16.6" cy="77.4" r="8.1" style="fill:#9fbee4"></circle>
                                        <circle cx="40.9" cy="41" r="8.1" style="fill:#9fbee4"></circle>
                                        <circle cx="77" cy="16.5" r="8.1" style="fill:#9fbee4"></circle>
                                    </g>
                                </svg>
		                        <span class="link-wrap" onclick="javascript:location.href='/brand_therapuez'">
		                            <img src="img/arrow.png" alt="셀리버리L&H">
		                            <span class="lato navy">GO TO THE RAPUEZ</span>
		                        </span>
	                        </strong>
	                    </a>  
	                    <a href="#" class="browse-more mo-ver">
                          <strong class="txtEffect">    
                         	<img src="/img/m_svgImg.png" alt="셀리버리L&H" >    
                         	  <span class="link-wrap" onclick="javascript:location.href='/brand_therapuez'">
                                 <img src="img/mo_arrow02.png" alt="셀리버리L&H">
                                 <span class="lato navy">GO TO THE RAPUEZ</span>
                             </span>
                             </strong>
                         </a>   
	 				</div>
	 			</div>
	 		</section>
 			<section class="sec02 section">
 				<div class="center-content-box">
 					<div class="sm-txt">
	 					<h5 class="sub-sec-tit02 lato"><strong class="">Bio-Brid Cosmetic</strong></h5>
	 					<img src="img/sub/busi/beauty-sec02-img01.png" alt="셀리버리L&H" class="pc-ver">
	 					<img src="img/sub/busi/beauty-sec02-img01-m.png" alt="셀리버리L&H" class="mo-ver">
	 					<p class=" sub-txt">
	 						<span class="txtEffect spoqa-R">
	 							<strong class="spoqa-R">세계적 바이오 기술력의 결정체와 코스메틱의 결합을 통해<br class="mo-ver"/> 재탄생한 <br class="pc-ver"/>
								Live Delivery ™ 기술과  <br class="mo-ver"/>핵심 성분 R3 Peptide™ 가 이끌어가는 <br>
								4세대 기능성 바이오 브리드 코스메틱(Bio-Brid Cosmetics)<br class="mo-ver"/> 브랜드 ‘더라퓨즈’</strong>를 통해 <br class="pc-ver"/>
								기존에 없던<br class="mo-ver"/>새로운 전달케어 영역을 선도합니다.<br/><br class="height-trans">
								
								피부 개선에 도움을 주는 스킨케어 제품을 시작으로 <br class="mo-ver"/>향후 메이크업, 핸드케어 등 품목 확대를 통해<br/> 
								국내를 넘어 글로벌 시장에서 인정 받도록 <br class="mo-ver"/>최선을 다하겠습니다.
	 						</span>
	 						
	 					</p>
	 				</div>
 				</div>
 				
 				
 			</section>
		
	 </div>
</div>
<script src="/js/sub.js"></script>
<jsp:include page="/WEB-INF/front/common/footer.jsp"/>