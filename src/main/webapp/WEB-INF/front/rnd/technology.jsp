<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/front/common/header.jsp"/>

<div class="subpage rnd tech">
	  <div class="sub_banner">
	 	<h2 class="sub_page_name lato">R&D</h2>	
	 	<div class="sub_nav_wrap"> 	 	
	 		<p class="mo-ver current_menu">Technology<img src="/img/sub/m_sub_nav_btn.png" alt="셀리버리L&H"></p> 		
	 		<ul class="sub_nav">	
	 			<li class="lato on">
					<a href="/rnd_technology">Technology</a>
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
				<li class="lato"><a href="/rnd_research">Research</a></li>
	 		</ul>
	 	</div>	 	
	 </div>
	 <div class="sub_content">
 		<div class="sub-center-tit">
			<h3 class="sub_title lato black">Technology</h3>			
		</div>		
		<section class="sec01 section">
			<div class="center-content-box container">
				<div class="tab_cont_tit">
					<h2 class="black">핵심 기술</h2>
				</div>
				<div class="img-box tit-txt">
					<img src="/img/sub/rnd/tech_img01.png" alt="셀리버리L&H" class="txtEffect pc-ver">
					<img src="/img/sub/rnd/tech_img02.png" alt="셀리버리L&H" class="txtEffect pc-ver">
					<img src="/img/sub/rnd/tech_img03.png" alt="셀리버리L&H" class="txtEffect pc-ver">
					
					<img src="/img/sub/rnd/tech_mo_img01.png" alt="셀리버리L&H" class="txtEffect mo-ver">
					<img src="/img/sub/rnd/tech_mo_img02.png" alt="셀리버리L&H" class="txtEffect mo-ver">
					<img src="/img/sub/rnd/tech_mo_img03.png" alt="셀리버리L&H" class="txtEffect mo-ver">
				</div>
				
			</div>
		</section>
		<section class="sec02 section">
			<div class="center-content-box container">
				<div class="box box01 tit-txt">
					<div class="left-box txtEffect">
						<p>Technology</p>
						<span>피부 고민 부위를 찾아가는 독자적 New 바이오 테크놀로지</span>
					</div>
					<div class="right-box txtEffect">
						<span>
							유효성분도 전달되지 않으면 의미가 없습니다. <br>
							Bio-In Technology 기술을 통해 Real Damaged Skin까지<br>
							유효성분을 효과적으로 전달할 수 있습니다.<br>														
						</span>
					</div>
				</div>
				<div class="box box02 tit-txt">
					<div class="left-box txtEffect">
						<p>Ingredients</p>
						<span>세상에 없던 새로운 펩타이드</span>
					</div>
					<div class="right-box txtEffect">
						<span>
							효능이 검증된 원료 NI-Peptide를 활용해 <br>
							피부 고민에 직접 작용하는 뷰티&헬스케어 제품을 개발합니다.													
						</span>
						<div class="blue-box">
							<div class="left-box">
								<img src="/img/sub/rnd/ni-peptide.png" alt="셀리버리L&H" />
								<img src="/img/sub/rnd/tech_nip.png" alt="셀리버리L&H" />
							</div>
							<div class="right-box">
								<span>
									새롭게 인정받은 펩타이드라는 의미를 가진 원료로, <br>
									기존에 없던 새로운 시장을 선도하겠다는 포부가 담겨있습니다.									
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</div>
<script src="/js/sub.js"></script>
<jsp:include page="/WEB-INF/front/common/footer.jsp"/>