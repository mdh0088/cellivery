<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/front/common/header.jsp"/>

<!-- <script>
/* 여기 스크립트는 동현선임님! */
var openPopCnt = 0,
	$slideBox = $('.newPopupContainer.active');
$(window).ready(function(){
	var pop_idx='';
	var pop_idx_arry=[];
	$('.main_popup').each(function(){ 
		pop_idx = $(this).attr('target').trim();
		pop_idx_arry.push(pop_idx);
	})

	for (var i = 0; i < $('.main_popup').length+1; i++) {
		if(getCookie(pop_idx_arry[i])!="Y"){
			$("."+pop_idx_arry[i]).show('fade');
			if(pop_idx_arry[i] != undefined)
			{
    			openPopCnt ++;	
			}
		}
	}

	$('#pop_cnt').text(openPopCnt);
	if(openPopCnt==0)
	{
		$('.pop-up').hide();
	}
	
});

function pop_todayclose(idx){
	var	notToday = getCookie("pop_idx"+idx);
	//alert(notToday);
	if(notToday == "Y"){
		$(".pop_idx"+idx).remove();
		$slideBox.slick('slickRemove',idx);
	}else{
		setCookie("pop_idx"+idx,'Y', 1);
		$(".pop_idx"+idx).remove();
		$slideBox.slick('slickRemove',idx);
	}
	openPopCnt --;

	$('#pop_cnt').text(openPopCnt);
	
	if(openPopCnt==0)
	{
		$('.pop-up').hide();
	}
}
function pop_close(idx){
	$(".pop_idx"+idx).hide('fade');
	openPopCnt --;
	$('#pop_cnt').text(openPopCnt);
	
	if(openPopCnt==0)
	{
		$('.pop-up').hide();
	}
}
</script> -->
<script>
$(function(){
	if($('.pop-up').css('display') == 'block' && $('.newPopupContent').length() != '0'){
		$('body').on('scroll touchmove mousewheel', function(event) {
			event.preventDefault();
			event.stopPropagation();
			return false;
			});
	}else{
	
	
	}
})
</script>
 <div class="pop-up"> 
 		
   	<div class="pop-up-container ">
   		<div class="newPopupContainer active">   		   		 		
   		<jsp:useBean id="now" class="java.util.Date" />
   		
   		<c:forEach var="i" items="${popList}" varStatus="loop">
   			<c:if test="${i.use_yn eq 'Y'}">
   				<fmt:parseDate value="${fn:replace(i.start_ymd,'-','')}0000" pattern="yyyyMMddHHmm" var="startDate" />
				<fmt:parseDate value="${fn:replace(i.end_ymd,'-','')}2359" pattern="yyyyMMddHHmm" var="endDate" />

				<fmt:formatDate value="${now}" pattern="yyyyMMddHHmm" var="nowDate" />  
   				<fmt:formatDate value="${startDate}" pattern="yyyyMMddHHmm" var="openDate"/>       
				<fmt:formatDate value="${endDate}"  pattern="yyyyMMddHHmm" var="closeDate"/>    

   				<c:if test="${openDate < nowDate && closeDate > nowDate}">
	   		    	<c:set var="cnt" value="${cnt + 1}"/>
	   		    	<c:set var="class_name" value="" />
	
	   		    	<c:if test = "${fn:contains(i.cont, 'www.youtube.com/embed/')}">
	   		    		<c:set var="class_name" value="video"/>
					</c:if>
					
		   			<div target="pop_idx${i.idx}" class="pop_idx${i.idx} main_popup newPopupContent newCont0${cnt} show" data-index="${cnt}" >
			   			<div class="box box01">
			   				${fn:replace(fn:replace(fn:replace(fn:replace(fn:replace(i.cont, '&lt;', '<'), '&gt;', '>'),'&amt;','&'),'&quot;','"'),'a href','a target="_blank" href')}
			 			</div>
			   			<div class="box box02">
			   				<button class="closeDayBtn"  ><img src="img/day-btn-check.png" alt="셀리버리L&H" ><span>오늘 하루 보지않기</span></button>
				   			<button class="closeBtn" ><span>닫기</span></button>
			   				<%-- <button class="" onclick="pop_todayclose('${i.idx}')" ><img src="img/day-btn-check.png" alt="셀리버리L&H" ><span>오늘 하루 보지않기</span></button>
				   			<button class="closeBtn" onclick="pop_close('${i.idx}')"><span>닫기</span></button> --%>
			   			</div>
		   			</div>
	   			</c:if>
   			</c:if>
   		</c:forEach>

   		
   		</div> 
   		<div class="popUpBottom">
   			<div class="popUpPagination">
	   			<span id="pop_cnt" class="now">1</span>/<span class="total"></span>
	   		</div>
	   		<div class="popUpClose">모두닫기</div>
   		</div> 
	
   	</div> 
  		
</div>
   
 <div class="down-scroll pc-ver">
        <img src="img/down.png" alt="셀리버리L&H" class="pc-ver">
        <img src="img/down.png" alt="셀리버리L&H" class="mo-ver">
    </div>
    <div id="fullpage" class="main">
        <div class="section section01" id="sec01">
          <div class="down-scroll mo-ver">
	        <img src="img/down.png" alt="셀리버리L&H" class="pc-ver">
	        <img src="img/mo_down.png" alt="셀리버리L&H" class="mo-ver">
	    </div>
            <div class="fp-bg">      
            	<a href="#" class="share">
            		<img src="/img/share.png" alt="셀리버리L&H" />
            	</a>                         
                    <ul class="slider-nav">
                        <li class="lato">
                        	<div class="back"></div>
                        	<p>Bio-Based Premium Living &amp; Health</p>
                        </li>
                        <li class="lato">
	                        <div class="back"></div>
	                        <p>Make Your Life Better</p>
	                        </li>
                        <li class="lato">
	                        <div class="back"></div>
	                        <p>Think Differently, Make a Trend</p>
                        </li>
                    </ul>                                
                <div class="sec01-slide-wrap">
                    <div class="slider slide01">
                        <div class="container02">
                            
                        
                        <div class="txt-box">
                            <p class="lato tit-txt navy">
                            	<strong class="txtEffect">     
                            	  Bio-Based Premium <br>
                                Living &amp; Health                       	
                            	</strong>
                              
                            </p>
                            <span class="spoqa-M sub-txt">
	                            <strong class="txtEffect">    
	                             (주)셀리버리의 바이오 기술을 기반으로<br />
									안전하게 사용 가능한 프리미엄 생활건강 <br class="mo-ver">제품을 지향합니다                        	
	                            	</strong>
                             
                            </span>
                            <a href="#" class="browse-more pc-ver dis-no">   
                             <strong class="txtEffect">                                
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
                                 <span class="link-wrap">
                                    <img src="img/arrow.png" alt="셀리버리L&H">
                                    <span class="lato navy">BROWSE MORE</span>
                                </span>
                                </strong>
                            </a>    
                            <a href="#" class="browse-more mo-ver dis-no">
                             <strong class="txtEffect">    
                            	<img src="/img/m_svgImg.png" alt="셀리버리L&H" >    
                            	  <span class="link-wrap">
                                    <img src="img/mo_arrow02.png" alt="셀리버리L&H">
                                    <span class="lato navy">BROWSE MORE</span>
                                </span>
                                </strong>
                            </a>   
                        </div>
                        </div>
                        <div class="img-box">
                            <img src="img/mainBanner011.jpg" alt="셀리버리L&H" class="pc-ver">
                            <img src="img/m_mainBanner01.jpg" alt="셀리버리L&H" class="mo-ver">
                        </div>
                        
                    </div>       
                    <div class="slider slide02">
                        <div class="txt-box">
                            <p class="lato tit-txt navy">
                            <strong class="txtEffect">    
                                Make Your Life <br>
                                Better
                                </strong>
                            </p>
                            <span class="spoqa-M sub-txt">
                            <strong class="txtEffect">    
                                주변에서 쉽게 접할 수 있는 제품을 통해<br class="mo-ver"> 당신의 삶의 질을 업그레이드 합니다.
                                </strong>
                            </span>
                            <a href="#" class="browse-more pc-ver dis-no">       
                             <strong class="txtEffect">                            
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
                                 <span class="link-wrap">
                                    <img src="img/arrow.png" alt="셀리버리L&H">
                                    <span class="lato navy">BROWSE MORE</span>
                                </span>
                                </strong>
                            </a>  
                            <a href="#" class="browse-more mo-ver  dis-no">
                             <strong class="txtEffect">    
                            	<img src="/img/m_svgImg.png" alt="셀리버리L&H" >    
                            	  <span class="link-wrap">
                                    <img src="img/mo_arrow02.png" alt="셀리버리L&H">
                                    <span class="lato navy">BROWSE MORE</span>
                                </span>
                                </strong>
                            </a>       
                        </div>
                        <div class="img-box">
                            <img src="img/mainBanner022.jpg" alt="셀리버리L&H" class="pc-ver">
                            <img src="img/m_mainBanner02.jpg" alt="셀리버리L&H" class="mo-ver">
                        </div>
                           
                    </div>    
                    <div class="slider slide03">
                        <div class="txt-box">
                            <p class="lato tit-txt navy">
                            <strong class="txtEffect">    
                                Think Differently, <br>
                                Make a Trend
                                </strong>
                            </p>
                            <span class="spoqa-M sub-txt">
                            <strong class="txtEffect">    
					                              글로벌 시장에서 인정받은 바이오 기술력으로 <br />
								새로운 리빙앤헬스 트렌드를 만들어갑니다.
							</strong>
                            </span>
                            <a href="#" class="browse-more pc-ver dis-no">     
                             <strong class="txtEffect">                              
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
                                 <span class="link-wrap">
                                    <img src="img/arrow.png" alt="셀리버리L&H">
                                    <span class="lato navy">BROWSE MORE</span>
                                </span>
                                </strong>
                            </a>    
                            <a href="#" class="browse-more mo-ver dis-no">
                             <strong class="txtEffect">    
                            	<img src="/img/m_svgImg.png" alt="셀리버리L&H" >    
                            	  <span class="link-wrap">
                                    <img src="img/mo_arrow02.png" alt="셀리버리L&H">
                                    <span class="lato navy">BROWSE MORE</span>
                                </span>
                                </strong>
                            </a>     
                        </div>
                        <div class="img-box">
                            <img src="img/mainBanner03.jpg" alt="셀리버리L&H" class="pc-ver">
                            <img src="img/m_mainBanner03.jpg" alt="셀리버리L&H" class="mo-ver">
                        </div>
                            
                    </div>                 
                </div>
                

                         
            </div>
        </div>
        <div class="section section02" id="sec02">
            <div class="fp-bg">
                <img src="img/sec02-bg01.png" alt="셀리버리L&H">
                <div class="container03">
                   <div class="content">
                        <img src="img/sec02-img.jpg" alt="셀리버리L&H" class="pc-ver">
                        <img src="img/m_section02_img.jpg" alt="셀리버리L&H" class="mo-ver">
                        <div class="txt-box">
                            <p class="lato tit-txt navy">
                            <strong class="txtEffect">    
                                CELLIVERY <br>
                                Living & Health
                                </strong>
                            </p>
                            <span class="spoqa-R sub-txt">
                            	<strong class="txtEffect">    
                                (주)셀리버리 리빙앤헬스는  <br class="mo-ver">뷰티 & 생활건강 제품에 대한 상식을 뛰어넘어 <br>
					                                글로벌 시장을 선도하는 바이오 기술을 통해<br>
					                                모든 사람들에게 안전하고 효과적인 솔루션을 제공합니다.
					                                </strong>
                               <a href="/about" class="browse-more pc-ver">   
                             <strong class="txtEffect">                                
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
                                 <span class="link-wrap">
                                    <img src="img/arrow.png" alt="셀리버리L&H">
                                    <span class="lato navy">BROWSE MORE</span>
                                </span>
                                </strong>
                            </a>  
                                 <a href="/about" class="browse-more mo-ver">
                                  <strong class="txtEffect">    
                            	<img src="/img/m_svgImg.png" alt="셀리버리L&H" >    
                            	  <span class="link-wrap link-wrap2">
                                    <img src="img/mo_arrow02.png" alt="셀리버리L&H">
                                    <span class="lato navy">BROWSE MORE</span>
                                </span>
                                </strong>
                            </a>        
                            </span>
                                         
                        </div>
                        
                    </div>
                </div>
                <img src="img/sec02-bg02.png" alt="셀리버리L&H" class="pc-ver">
            </div>
        </div>
        <div class="section section03" id="sec03">
            <div class="fp-bg">
                <div class="container03">
                    <div class="content">
                        <p class="lato tit-txt navy">
                        <strong class="txtEffect">    
                            Business
                            </strong>
                        </p>
                        <ul class="business-box">
                            <li>
                                <span class="lato navy">Beauty</span>
                                <p class="spoqa-R">
                                    화장품의 패러다임을 바꾸는 새로운 제품을 <br>
                                    선보입니다. 바이오 기술력을 기반으로 실질적인<br>
                                    피부 개선을 보이는뷰티 제품을 제안합니다.
                                    <a href="/business" class="circle-link">
                                        <img src="img/arrow.png" alt="셀리버리L&H" class="pc-ver">
                                        <img src="img/mo_arrow03.png" alt="셀리버리L&H" class="mo-ver">                                        
                                    </a>
                                </p>
                               <div class="shadow-box"></div>
                            </li>
                            <li>
                                <span class="lato navy">Living&Health</span>
                                <p class="spoqa-R">
									안심하고 사용할 수 있는 프리미엄 리빙앤헬스<br>
									제품을 만듭니다. 헤어케어, 바디케어 등<br>
									일상생활에 편리한 다양한 제품을 선보입니다.
                                    <a href="/livingHealth" class="circle-link">
                                        <img src="img/arrow.png" alt="셀리버리L&H" class="pc-ver">
                                        <img src="img/mo_arrow03.png" alt="셀리버리L&H" class="mo-ver">
                                    </a>
                                </p>
                              <div class="shadow-box"></div>
                            </li>
                            <li>
                                <span class="lato navy">Biocare Tissue</span>
                                <p class="spoqa-R">
						                                    바이오케어 티슈 시장의 새로운 트렌드를<br> 선도합니다.
										완제품의 안전성 뿐만 아니라 <br>원단·부재료 등에서도
										새로운 표준을 제시합니다.
                                    <a href="/biocareTissue" class="circle-link">
                                        <img src="img/arrow.png" alt="셀리버리L&H" class="pc-ver">
                                        <img src="img/mo_arrow03.png" alt="셀리버리L&H" class="mo-ver">
                                    </a>
                                </p>
                                <div class="shadow-box"></div>
                            </li>
                            <li>
                                <span class="lato navy">ODM</span>
                                <p class="spoqa-R">
                                    34년 업력의 물티슈 자체 생산시설을 보유하고 <br>
									있습니다. 고객사와의 동반 성장을 위해 꾸준한 <br>
									연구개발을 거쳐 우수한 제품을 개발합니다.
                                    <a href="/odm" class="circle-link">
                                        <img src="img/arrow.png" alt="셀리버리L&H" class="pc-ver">
                                        <img src="img/mo_arrow03.png" alt="셀리버리L&H" class="mo-ver">
                                    </a>
                                </p>
                                <div class="shadow-box"></div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="section section04" id="sec04">
            <div class="fp-bg">
                <div class="container03">
                        <div class="sec04-box">
                            <div class="txt-box">
                                <p class="tit-txt lato"><strong class="txtEffect">Technology</strong></p>
                                <div>
                                    <!-- <p class="tit-txt2 lato"><strong class="txtEffect"> TSDT</strong></p> -->
                                    <p class="sub-txt spoqa-R"><strong class="txtEffect"> 진보된 바이오 기술력을 기반으로 한 특허 기술 및 원료</strong></p>
                                </div>    
                                <a href="/rnd_technology" class="browse-more pc-ver">      
                                 <strong class="txtEffect">                             
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
                                 <span class="link-wrap">
                                    <img src="img/arrow-w.png" alt="셀리버리L&H">
                                    <span class="lato white">BROWSE MORE</span>
                                </span>
                                </strong>
                            </a>       
                            <a href="/rnd_technology" class="browse-more mo-ver">
                             <strong class="txtEffect">    
                            	<img src="/img/m_svgImg.png" alt="셀리버리L&H" >    
                            	  <span class="link-wrap">
                                    <img src="img/mo_arrow01.png" alt="셀리버리L&H">
                                    <span class="lato navy">BROWSE MORE</span>
                                </span>
                                </strong>
                            </a>        
                            </div>                            
                        </div>
                        <div class="sec04-box">
                            <div class="txt-box">
                                <p class="tit-txt lato"><strong class="txtEffect">Research</strong></p>
                                <div>
                                    <!-- <p class="tit-txt2 lato"><strong class="txtEffect"> iCP-NI</strong></p> -->
                                    <p class="sub-txt spoqa-R"><strong class="txtEffect"> 외부 인체적용시험을 통해 인정받은 효능 효과</strong></p>
                                </div>                                
                                <a href="/rnd_research" class="browse-more pc-ver">      
                                 <strong class="txtEffect">                             
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
                                 <span class="link-wrap">
                                    <img src="img/arrow-w.png" alt="셀리버리L&H">
                                    <span class="lato white">BROWSE MORE</span>
                                </span>
                                </strong>
                            </a>       
                            <a href="/rnd_research" class="browse-more mo-ver">
                             <strong class="txtEffect">    
                            	<img src="/img/m_svgImg.png" alt="셀리버리L&H" >    
                            	  <span class="link-wrap">
                                    <img src="img/mo_arrow01.png" alt="셀리버리L&H">
                                    <span class="lato navy">BROWSE MORE</span>
                                </span>
                                </strong>
                            </a>        
                            </div>                            
                        </div>
                    </div>
            </div>
        </div>
        <div class="section section05" id="sec05">
            <div class="fp-bg">
                <div class="container03">
                    <img src="/img/sec05-bg01.png" alt="셀리버리L&H">
                    <div class="content">
                        <p class="lato tit-txt navy">
                        <strong class="txtEffect">
                            PR
                           <a href="/notice" class="browse-more pc-ver">   
                                                    
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
                                 <span class="link-wrap" onclick="javascript:location.href='/media'">
                                    <img src="img/arrow.png" alt="셀리버리L&H">
                                    <span class="lato navy">BROWSE MORE</span>
                                </span>
                                
                            </a>  
                            <a href="/notice" class="browse-more mo-ver">
                            	<img src="/img/m_svgImg.png" alt="셀리버리L&H" >    
                            	  <span class="link-wrap link-wrap2">
                                    <img src="img/mo_arrow02.png" alt="셀리버리L&H">
                                    <span class="lato navy">BROWSE MORE</span>
                                </span>
                            </a>       
                            </strong>
                        </p>
                        
                        <ul class="pr-box">
                        	<c:forEach var="i" items="${mainPrlist}" varStatus="loop">
	                        	<c:if test="${i.use_yn eq 'Y'}">
		                            <li>
		                                <div class="img-box">
		                                	<c:choose>
			                                	<c:when test="${empty i.thumb}">
			                                    	<img src="/img/thumbnail_pc.jpg" alt="셀리버리L&H" class="pc-ver">
			                                    	<img src="/img/thumbnail_mo.jpg" alt="셀리버리L&H" class="mo-ver">
			                                    </c:when>
											    <c:otherwise>
			                                    	<img src="${i.thumb}" alt="셀리버리L&H" class="pc-ver">
			                                    	<img src="${i.thumb}" alt="셀리버리L&H" class="mo-ver">
											    </c:otherwise>
										    </c:choose>
		                                    
		                                     <a href="javascript:void(0)" class="circle-link">
		                                        <img src="img/arrow.png" alt="셀리버리L&H" class="pc-ver">
		                                        <img src="img/mo_arrow03.png" alt="셀리버리L&H" class="mo-ver">
		                                    </a>
		                                        <a href="javascript:location.href='/${i.pr_type}_board?idx=${i.pr_idx}'" class="browse-more">                               
		                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 240.1 240.3" class="svgImg">
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
		                                             <span class="link-wrap">
		                                                <img src="img/arrow.png" alt="셀리버리L&H">
		                                                <span class="lato navy">BROWSE MORE</span>
		                                            </span>
		                                        </a> 
		                                </div>
		                                <div class="txt-box">
		                                    <p class="spoqa-M">
			                                    <strong class="txtEffect">
									                ${i.title}
												</strong>
		                                    </p>
		                                </div>
		                            </li>
	                            </c:if>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <footer class="footer section fp-auto-height">
            <div class="container01">
                 <a href="/" class="logo"><img src="/img/logo_w.png" alt="셀리버리L&H"></a>
                <div class="right-box">
                    <div class="txt-box">
                        <ul class="line line1">
                            <li><a href="#" class="spoqa-L">이용약관</a></li>
                            <li><a href="#" class="spoqa-L">개인정보처리방침</a></li>
                            <li><a href="#" class="spoqa-R">이메일무단수집거부</a></li>
                            <li><a href="/contact" class="lato">CONTACT</a></li>
                        </ul>
                        <ul class="line line2 pc-ver">
                            <li class="spoqa-R">
                                <span class="subject">ADDRESS</span>
                                <span class="con">서울시 마포구 성암로 179, B1 (03929)</span>
                            </li>
                            <li class="spoqa-R">
                                <span class="subject">TEL</span>
                                <span class="con">02-2170-7400</span>
                            </li>
                            <li class="spoqa-R">
                                <span class="subject">FAX</span>
                                <span class="con">02-303-7488</span>
                            </li>
                        </ul>
                         <ul class="line line2 mo-ver">                          
                            <li class="spoqa-R">
                                <span class="subject">TEL</span>
                                <span class="con">02-2170-7400</span>
                            </li>
                            <li class="spoqa-R">
                                <span class="subject">FAX</span>
                                <span class="con">02-303-7488</span>
                            </li>
                              <li class="spoqa-R">
                                <span class="subject">ADDRESS</span>
                                <span class="con">서울시 마포구 성암로 179, B1 (03929)</span>
                            </li>
                        </ul>
                        <ul class="line line2 line3 pc-ver">
                            <li class="spoqa-R">
                                <span class="subject">업체명</span>
                                <span class="con">(주)셀리버리 리빙앤헬스 이천공장</span>
                            </li>
                            <li class="spoqa-R">
                                <span class="subject">대표자명</span>
                                <span class="con">조대웅</span>
                            </li>
                            <li class="spoqa-R">
                                <span class="subject">사업자등록번호</span>
                                <span class="con">521-85-01838</span>
                            </li>
                            <li class="spoqa-R">
                                <span class="subject">주소</span>
                                <span class="con">경기도 이천시 백사면 청백리로 873</span>
                            </li>
                        </ul>
                       <ul class="line line4 mo-ver">                          
                            <li class="spoqa-R">
                            <div>
                            	<span class="subject">업체명</span>
                                <span class="con">(주)셀리버리 리빙앤헬스 이천공장</span>
                            </div>
                            <div>
                            	  <span class="subject">대표자명</span>
                                <span class="con">조대웅</span>
                            </div>                          
                                
                            </li>    
                             <li class="spoqa-R">
                              <div>                      
                             
                               	 <span class="subject">사업자등록번호</span>
                                <span class="con">521-85-01838</span>
                            </div>
                            <div>
                            	  <span class="subject">주소</span>
                                <span class="con">경기도 이천시 백사면 청백리로 873</span>
                            </div>
                                  
                                
                                 
                            </li>
                        </ul>     
                        <p class="lato pc-ver">Copyright ⒞ 2022. Cellivery Living & Health Inc. All Rights Reserved.</p>
                    </div>
                    <div class="family">
                        <P>Familly site</P>
                        <img src="/img/select-down.png" alt="셀리버리L&H" />     
                        <ul>
                            <li><a href="http://www.cellivery.com/" class="spoqa-L" target="_blank" >(주)셀리버리</a></li>
<!--                             <li><a href="#" class="lato">Familly site2</a></li> -->
<!--                             <li><a href="#" class="lato">Familly site3</a></li> -->
<!--                             <li><a href="#" class="lato">Familly site4</a></li> -->
<!--                             <li><a href="#" class="lato">Familly site5 </a></li> -->
                        </ul>
                    </div>
                    <p class="lato mo-ver">Copyright ⒞ 2022. Cellivery Living & Health Inc. All Rights Reserved.</p>
                </div>
            </div>
        </footer>
        </div>
        

