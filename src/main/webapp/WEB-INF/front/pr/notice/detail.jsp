<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/front/common/header.jsp"/>
<script>


$(document).ready(function() {
	if(nullChk("${idx}"))
	{
		$('#title').text('${title}');
		$('#create_date').text('${create_date}');
		$('#cate_title').text('${cate_title}');
		$('#thumb').attr('src','${thumb}');
		$('#cont').html(repWord('${cont}'));
		
		var file_arr = "${file}".split('|');
		var file_or_arr = "${file_ori}".split('|');
		var inner='';
		
		for(var i = 0; i < file_arr.length; i++)
		{
			if(file_arr[i]!='')
			{
				var file_loc="'"+file_arr[i]+"'";
				inner+='<li class="" onclick="window.location='+file_loc+'">';
				inner+='	<div class="left-box">';
				inner+='		<img src="/img/sub/pr/pr_view_file.png" alt="셀리버리L&H">';
				inner+='		<span>첨부파일</span>';
				inner+='	</div>';
				inner+='	<i></i>';
				inner+='	<div class="right-box">';
				inner+='		<span class="flie-name">'+file_or_arr[i]+'</span>';
				inner+='	</div>';
				inner+='</li>';
			}
		}
		$('#file_ori').html(inner);
		
		var before_nm = '${before_nm}'.split('|')[0];
		var before_date = '${before_nm}'.split('|')[1];
		var after_nm = '${after_nm}'.split('|')[0];
		var after_date = '${after_nm}'.split('|')[1];
		
		$('#before_nm').text(before_nm);
		$('#before_date').text(before_date);
		$('#after_nm').text(after_nm);
		$('#after_date').text(after_date);
		
		$('#prev_move').attr("onclick","javascript:location.href=\'/notice_board?idx=${before_idx}'");
		$('#next_move').attr("onclick","javascript:location.href=\'/notice_board?idx=${after_idx}'");
		
	}
	else
	{
		alert('잘못된 접근입니다.');
		location.href='/';
	}
});
</script>
<div class="subpage pr view-page">
	 <div class="sub_banner">
	 	<h2 class="sub_page_name lato">PR</h2>	 	
	 	<div class="sub_nav_wrap"> 	
	 		<ul class="sub_nav">
	 			
	 			<li class="on lato"><a href="/pr">NOTICE</a>
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
	 			<li class="lato"><a href="/notice">NEWS</a></li>
	 			<li class="lato"><a href="/media">MEDIA</a></li>
	 			<li class="lato"><a href="/sns">SNS</a></li>
	 		</ul>
 		</div>	 	
	 </div>
	 <div class="sub_content">
	 	<div class="sub_container">
	 		<div class="board-view-content">
	 			<div class="tit-box">
	 				<h3 class="board-view-tit" id="title"></h3>
	 				<div class="side-box">
	 					<span class="date" id="create_date"></span>
	 					<i></i>
	 					<span class="brand" id="cate_title"></span>
	 				</div>
	 			</div>
	 			<div class="con-box">
	 				<div class="img-box"> <!-- 이미지 있을 경우 -->
	 					<img id="thumb" src="" alt="셀리버리L&H">
	 				</div>
	 				<div class="txt-box" id="cont"> <!-- 텍스트 있을 경우 -->
	 					
	 				</div>
	 				
 					<ul class="file-box" id="file_ori"><!-- 첨부파일 있을 경우 -->
 						<li class="active">
 							<div class="left-box">
 								<img src="/img/sub/pr/pr_view_file.png" alt="셀리버리L&H">
 								<span>첨부파일</span>
 							</div>
 							<i></i>
 							<div class="right-box">
 								<span class="flie-name"></span>
 							</div>
 						</li>
 						<li class="">
 							<div class="left-box">
 								<img src="/img/sub/pr/pr_view_file.png" alt="셀리버리L&H">
 								<span>첨부파일</span>
 							</div>
 							<i></i>
 							<div class="right-box">
 								<span class="flie-name"></span>
 							</div>
 						</li>
 						<li class="">
 							<div class="left-box">
 								<img src="/img/sub/pr/pr_view_file.png" alt="셀리버리L&H">
 								<span>첨부파일</span>
 							</div>
 							<i></i>
 							<div class="right-box">
 								<span class="flie-name"></span>
 							</div>
 						</li>
 					</ul>
 					
	 				<div class="pager-box">
	 				
	 					<div class="prev" id="prev_move">
	 						<div class="direction">
	 							<img src="/img/sub/pr/pr_view_prev.png" alt="셀리버리L&H">
	 							<span>이전</span>
	 						</div>
	 						<span class="tit" id="before_nm"></span>
	 						<span class="date" id="before_date"></span>
	 					</div>
	 					
	 					<div class="next" id="next_move">
	 						<div class="direction">
	 							<img src="/img/sub/pr/pr_view_next.png" alt="셀리버리L&H">
	 							<span>다음</span>
	 						</div>
	 						<!-- 다음글, 이전글이 없을때 추가되는 클래스 empty -->
	 						<!--<span class="tit empty" id="after_nm">다음글이없습니다. </span>-->
	 						<span class="tit" id="after_nm"></span>
	 						<span class="date" id="after_date"></span>
	 					</div>
	 					
	 				</div>
	 				
	 			</div>	 			
 				<div class="board-button-wrap">
	 				<a href="/notice" class="browse-more pc-ver">   
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
                                 <span class="link-wrap">
                                    <img src="img/arrow.png" alt="셀리버리L&H">
                                    <span class="lato navy">NOTICE LIST</span>
                                </span>
                                </strong>
                            </a>  
                                 <a href="/notice" class="browse-more mo-ver">
                                  <strong class="">    
                            	<img src="/img/m_svgImg.png" alt="셀리버리L&H" >    
                            	  <span class="link-wrap link-wrap2">
                                    <img src="img/mo_arrow02.png" alt="셀리버리L&H">
                                    <span class="lato navy">NOTICE LIST</span>
                                </span>
                                </strong>
                            </a>    
	 			</div>
	 		</div>
	 	
		 	
	 		
	 	</div>
	 	
	 </div>
</div>
   <script src="/js/sub.js"></script>

<jsp:include page="/WEB-INF/front/common/footer.jsp"/>