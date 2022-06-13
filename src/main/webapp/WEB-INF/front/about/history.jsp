<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/front/common/header.jsp"/>


<script>
$(document).ready(function() {
	getList();
});

function getList(){
	$.ajax({
		type : "POST", 
		url : "./getHistoryList",
		dataType : "text",
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
					inner+='<section class="sec0'+(i+1)+' section">';
					inner+='	<div class="left">';
					inner+='		<h2 class="year lato">'+result.list[i].title_year+'-</h2>';
					inner+='	</div>';
					inner+='	<div class="right">';
					inner+='		<ul class="history_list">';
					for(var j = 0; j < result.sub_list.length; j++)
					{
						if(result.list[i].idx==result.sub_list[j].history_idx)
						{
							result.sub_list[j].effect_yn=='Y' ? inner+='<li class="active ">': inner+='<li class="">';
							inner+='				<span class="history_tit">'+result.sub_list[j].history_ymd+'</span>';
							inner+='				<span class="black cont">'+result.sub_list[j].cont+'</span>';
							inner+='				<div class="history_logoBox">';
							if(result.sub_list[j].logo_yn=='Y')
							{
								inner+='					<img src="/img/sub/about/history_logo.png" alt="셀리버리 L&H" class="history_logo"/>';
								inner+='					<img src="/img/sub/about/history_logo_on.png" alt="셀리버리 L&H" class="history_logo on"/>';
							}
							inner+='				</div>';
							inner+='			</li>';
						}
					}
					inner+='		</ul>';
					inner+='	</div>';
					inner+='</section>';
				}
			}
			$('#target_area').html(inner);
		}
	});
}

var cate_idx="";
function choose_cate(idx,cate_title){
	cate_idx = idx;
	$('#cate_title').text(cate_title);
}
</script>





<div class="subpage about history">
	<div class="sub_banner">
	 	<h2 class="sub_page_name lato">ABOUT</h2>	
	 	<div class="sub_nav_wrap"> 	 	
	 		<p class="mo-ver current_menu">History<img src="/img/sub/m_sub_nav_btn.png" alt="셀리버리L&H"></p> 		
	 		<ul class="sub_nav">				
	 			<li class="lato"><a href="/about">Cellivery L&H</a></li>
	 			<li class="lato on">
	 				<a href="/history">History</a>
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
	 			<li class="lato"><a href="/value">Value</a></li>
	 			<li class="lato"><a href="/ci">CI</a></li>
	 		</ul>
	 	</div>	 	
	 </div>
	 
	 <div class="sub_content">
	 	<div id="target_area" class="history_wrap">
			<section class="sec01 section"> 
				<div class="left">
					<h2 class="year lato">2020-</h2>
				</div>
				<div class="right">
					<ul class="history_list">
						<li class="active ">
							<span class="history_tit">2022. 01</span>
							<span class="black cont">더 라퓨즈 브랜드 론칭</span>
							<div class="history_logoBox">
								<img src="/img/sub/about/history_logo.png" alt="셀리버리 L&H" class="history_logo"/>
								<img src="/img/sub/about/history_logo_on.png" alt="셀리버리 L&H" class="history_logo on"/>
							</div>
						</li>
						<li class="active ">
							<span class="history_tit">2022. 01</span>
							<span class="black cont">바이오;늘 브랜드 론칭</span>
							<div class="history_logoBox">
								<img src="/img/sub/about/history_logo.png" alt="셀리버리 L&H" class="history_logo"/>
								<img src="/img/sub/about/history_logo_on.png" alt="셀리버리 L&H" class="history_logo on"/>
							</div>
						</li>
						<li class="">
							<span class="history_tit">2021. 11</span>
							<span class="black cont">(주)셀리버리 리빙앤헬스 설립</span>
							<div class="history_logoBox">
								<img src="/img/sub/about/history_logo.png" alt="셀리버리 L&H" class="history_logo"/>
								<img src="/img/sub/about/history_logo_on.png" alt="셀리버리 L&H" class="history_logo on"/>
							</div>
						</li>
						<li class="">
							<span class="history_tit">2021. 11</span>
							<span class="black cont">(주)아진크린 인수</span>
							<div class="history_logoBox">
								<img src="/img/sub/about/history_logo.png" alt="셀리버리 L&H" class="history_logo"/>
								<img src="/img/sub/about/history_logo_on.png" alt="셀리버리 L&H" class="history_logo on"/>
							</div>
						</li>
					</ul>
				</div>
			</section>
			<section class="sec02 section">
				<div class="left">
					<h2 class="year lato txtEffect">2010-</h2>
				</div>
				<div class="right">
					<ul class="history_list">
						<li class="txtEffect">
							<span class="history_tit">2020. 11</span>
							<span class="black cont">스마트 공장 구축</span>
							<div class="history_logoBox">
							
							</div>
						</li>
						<li class="txtEffect">
							<span class="history_tit">2018.</span>
							<span class="black cont">(주)셀리버리 테라퓨틱스 코스닥 상장</span>
							<div class="history_logoBox">
								<img src="/img/sub/about/history_logo.png" alt="셀리버리 L&H" class="history_logo"/>
								<img src="/img/sub/about/history_logo_on.png" alt="셀리버리 L&H" class="history_logo on"/>
							</div>
						</li>
						<li class="txtEffect">
							<span class="history_tit">2015.</span>
							<span class="black cont">벤더빌트 대학교와 연구 및 비즈니스 파트너십</span>
							<div class="history_logoBox">
								<img src="/img/sub/about/history_logo.png" alt="셀리버리 L&H" class="history_logo"/>
								<img src="/img/sub/about/history_logo_on.png" alt="셀리버리 L&H" class="history_logo on"/>
							</div>
						</li>
						<li class="txtEffect">
							<span class="history_tit">2014.</span>
							<span class="black cont">㈜셀리버리 테라퓨틱스 설립</span>
							<div class="history_logoBox">
								<img src="/img/sub/about/history_logo.png" alt="셀리버리 L&H" class="history_logo"/>
								<img src="/img/sub/about/history_logo_on.png" alt="셀리버리 L&H" class="history_logo on"/>
							</div>
						</li>
					</ul>
				</div>
			</section>
			<section class="sec03 section">
				<div class="left">
					<h2 class="year lato txtEffect">2000-</h2>
				</div>
				<div class="right">
					<ul class="history_list">
						<li class="txtEffect">
							<span class="history_tit">2009.</span>
							<span class="black cont">ISO 14001, 환경 경영 시스템 인증</span>
							<div class="history_logoBox">
								
							</div>
						</li>
						<li class="txtEffect">
							<span class="history_tit">2009.</span>
							<span class="black cont">이천 본사 준공</span>
							<div class="history_logoBox">
								
							</div>
						</li>
						<li class="txtEffect">
							<span class="history_tit">2004.</span>
							<span class="black cont">ISO 9001 품질경영 시스템 인증</span>
							<div class="history_logoBox">
								
							</div>
						</li>
						<li class="txtEffect">
							<span class="history_tit">2006.</span>
							<span class="black cont">조대웅 대표 바이오벤처 기업 설립</span>
							<div class="history_logoBox">
								<img src="/img/sub/about/history_logo.png" alt="셀리버리 L&H" class="history_logo"/>
								<img src="/img/sub/about/history_logo_on.png" alt="셀리버리 L&H" class="history_logo on"/>
							</div>
						</li>
						<li class="txtEffect">
							<span class="history_tit">1992.</span>
							<span class="black cont">㈜아진크린 법인전환</span>
							<div class="history_logoBox">
								
							</div>
						</li>
						<li class="txtEffect">
							<span class="history_tit">1988.</span>
							<span class="black cont">아진양행 설립</span>
							<div class="history_logoBox">
								
							</div>
						</li>
					</ul>
				</div>
			</section>
	 	</div>
	 </div>
</div>
<script src="/js/sub.js"></script>
<jsp:include page="/WEB-INF/front/common/footer.jsp"/>