<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/front/common/header.jsp"/>
<script>

$(document).ready(function() {
	getList();
	insta_getList();
});

function getList(){
	
	var use_yn="";
	
	if (
			($("#show_y").prop('checked')==true && $("#show_n").prop('checked')==true)||
			$("#show_y").prop('checked')==false && $("#show_n").prop('checked')==false
		) 
	{
		use_yn="";
	}
	else if($("#show_y").prop('checked')==true)
	{
		use_yn="Y";
	}
	else if($("#show_n").prop('checked')==true)
	{
		use_yn="N";
	}
	
	$.ajax({
		type : "POST", 
		url : "/getPrSNSList",
		dataType : "text",
		data : 
		{
			page : page,
			order_by : 'desc',
			search_name : $('#search_name').val(),
			sort_type : 'up_show_yn',
			cate : youtube_cate_idx,
			listSize : '4',
			tbl : 'youtube'
		},
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
				var str="'준비중입니다.'";
				for(var i = 0; i < result.list.length; i++)
				{
					if(i==0)
					{
						inner +='<div id="target_link" class="img_box">';
						inner +=result.list[i].url;						
						inner +='</div>';
						inner +='<div class="li_tit"><span id="target_cate">'+result.list[i].cate_title+'</span></div>';
						inner +='<p class="sm_txt" id="target_title">'+result.list[i].title+'</p>';
						$('#first_youtube').html(inner);
						inner ='';
					}
					
					inner +='<li onclick="change_video('+result.list[i].idx+')">';
					inner +='	<div class="img_box"><img src="'+result.list[i].thumb+'" alt="'+result.list[i].cate_title+'"></div>';
					inner +='	<div id="youtube_imbed_'+result.list[i].idx+'" class="iframe_box">';
					inner +=		result.list[i].url;
					inner +='	</div>';
					inner +='	<div class="li_tit"><span id="youtube_cate_'+result.list[i].idx+'">'+result.list[i].cate_title+'</span></div>';
					inner +='	<p class="sm_txt" id="youtube_title_'+result.list[i].idx+'" >'+result.list[i].title+'</p>';
					inner +='</li>';
				}
			}
			else
			{
				$('#first_youtube').empty();
				inner +='	<li>';
				inner +='		<div class="img_box"></div>';
				inner +='		<div class="sm_txt"><span></span><span></span></div>';
				inner +='		<p class="li_tit">등록된 게시물이 없습니다.</p>';
				inner +='	</li>';
			}
			
			order_by = result.order_by;
			sort_type = result.sort_type;
			listSize = result.listSize;
			$("#pagination").html(makePaging(result.page, result.s_page, result.e_page, result.pageNum, 1));
			$('#youtube_list').html(inner);
		}
	});
}

function change_video(snsSeq) {
	$('#target_link').html($('#youtube_imbed_'+snsSeq).html());
	$('#target_cate').text($('#youtube_cate_'+snsSeq).text());
	$('#target_title').text($('#youtube_title_'+snsSeq).text());

}


var cate_idx="";
function choose_cate(idx,cate_title){
	cate_idx = idx;
	$('#cate_title').text(cate_title);
}


function insta_getList(){
	var use_yn="";
	
	if (
			($("#show_y").prop('checked')==true && $("#show_n").prop('checked')==true)||
			$("#show_y").prop('checked')==false && $("#show_n").prop('checked')==false
		) 
	{
		use_yn="";
	}
	else if($("#show_y").prop('checked')==true)
	{
		use_yn="Y";
	}
	else if($("#show_n").prop('checked')==true)
	{
		use_yn="N";
	}
	
	$.ajax({
		type : "POST", 
		url : "/getPrSNSList",
		dataType : "text",
		data : 
		{
			page : insta_page,
			order_by : 'desc',
			search_name : $('#search_name').val(),
			sort_type : 'up_show_yn',
			cate : insta_cate_idx,
			listSize : '6',
			tbl : 'insta'
		},
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
				var str="'준비중입니다.'";
				for(var i = 0; i < result.list.length; i++)
				{
					inner +='<li>';
					inner +='	<div class="img_box"><img src="'+result.list[i].thumb+'" alt="셀리버리L&H"></div>';
					inner +='	<div class="txt_box">';
					inner +='		<p class="tit_txt">'+result.list[i].cate_title+'</p>';
					inner +='		<p class="con_txt">'+result.list[i].title+'</p>';
					inner +='		<a href="'+result.list[i].url+'" class="browse-more" target="_blank"> ';
					inner +='			<strong class=""> ';
					inner +='				<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 240.1 240.3" class="svgImg">';
					inner +=					temp
					inner +='				</svg>';
					inner +='				<span class="link-wrap">';
					inner +='					<img src="img/arrow-w.png" alt="셀리버리L&H">';
					inner +='				</span>';
					inner +='			</strong>';
					inner +='		</a>';
					inner +='	</div>';
					inner +='</li>';
				}
			}
			else
			{
				inner +='<li>';
				inner +='	<div class="img_box"></div>';
				inner +='	<div class="txt_box">';
				inner +='		등록된 게시물이 없습니다.';
				inner +='	</div>';
				inner +='</li>';
			}
		
			
			insta_order_by = result.order_by;
			insta_sort_type = result.sort_type;
			insta_listSize = result.listSize;
			$("#insta_pro-pagination").html(insta_makePaging(result.page, result.s_page, result.e_page, result.pageNum, 1));
			$('#insta_list').html(inner);
		}
	});
}


var youtube_cate_idx="";
var insta_cate_idx="";
function choose_cate(idx,cate_title,type){
	if(type=='youtube')
	{
		youtube_cate_idx = idx;
		$('#cate_title_youtube').text(cate_title);
		getList();
	}
	else
	{
		insta_cate_idx = idx;
		$('#cate_title_insta').text(cate_title);
		insta_getList();
	}
	
}
</script>
<div class="subpage sns">
	 <div class="sub_banner">
	 	<h2 class="sub_page_name lato">PR</h2>	 	
	 	<div class="sub_nav_wrap"> 	
	 		<p class="mo-ver current_menu">SNS<img src="/img/sub/m_sub_nav_btn.png" alt="셀리버리L&H"></p>
	 		<ul class="sub_nav">
	 			<li class="lato"><a href="/notice">NOTICE</a></li>
	 			<li class="lato"><a href="/news">NEWS</a></li>
	 			<li class="lato"><a href="/media">MEDIA</a></li>
	 			<li class="lato on">
	 				<a href="/sns">SNS</a>
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
	 		</ul>	
	 	</div> 	
	 </div>
	 <div class="sub_content">
	 
	 	<section class="sec01">
 			<div class="sub_container">
	 		<div class="sub_top_box">
	 			<h3 class="sub_title lato black">Youtube</h3>
		 		<div class="sub_search_box">
		 			<div class="select_box">
                        <P id="cate_title_youtube" class="lato">All</P>
                        <img src="/img/sub/pr/select-down2.png" alt="셀리버리L&H" />     
                        <ul>
	                        <li><a onclick="choose_cate('','All','youtube')">All</a></li>
                        	<c:forEach var="i" items="${cate_list}" varStatus="loop">
	                            <li><a onclick="choose_cate('${i.idx}','${i.title}','youtube')">${i.title}</a></li>
                            </c:forEach>
						</ul>
                    </div>
		 		</div>
	 		</div>
	 		
	 		<div class="sns_youtube">
	 		
	 			<div id="first_youtube" class="sns_big">
<!--  					<div class="img_box"> -->
<!-- 						<iframe width="771" height="431" src="https://www.youtube.com/embed/hOKNmn_yS8U" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->
<!-- 					</div> -->
<!-- 	 				<div class="li_tit"><span>더라퓨즈</span></div> -->
<!-- 	 				<p class="sm_txt">더라퓨즈 브랜드 소개 영상(Feat. 런칭행사)</p> -->
	 			</div>
	 			
	 			<!-- youtube_ul li 를 클릭하면  sns_big 으로 보이는 구조-->
		 		<ul id="youtube_list" class="youtube_ul">
		 		
		 			<li>
		 				<div class="img_box"><img src="/img/sub/pr/yt-thumb01.png" alt="셀리버리L&H"></div>
		 				<div class="iframe_box">
		 					<iframe width="771" height="431" src="https://www.youtube.com/embed/hOKNmn_yS8U" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		 				</div>
		 				<div class="li_tit"><span>더라퓨즈</span></div>
	 					<p class="sm_txt">더라퓨즈 브랜드 소개 영상(Feat. 런칭행사)</p>
		 			</li>
		 				 					
		 		</ul>
	 		</div>
	 		<jsp:include page="/WEB-INF/front/common/paging_new.jsp"/>
	 	</div>
	 	</section>
	 	
	 	<section class="sec02">	 		
		 	<div class="sub_container">
		 		<div class="sub_top_box">
		 			<h3 class="sub_title lato black">Instagram</h3>
			 		<div class="sub_search_box">
			 			<div class="select_box">
	                        <P id="cate_title_insta" class="lato">All</P>
	                        <img src="/img/sub/pr/select-down2.png" alt="셀리버리L&H" />     
	                        <ul>
		                        <li><a onclick="choose_cate('','All','insta')">All</a></li>
	                        	<c:forEach var="i" items="${cate_list}" varStatus="loop">
		                            <li><a onclick="choose_cate('${i.idx}','${i.title}','insta')">${i.title}</a></li>
	                            </c:forEach>
							</ul>
	                    </div>
			 		</div>
		 		</div>
		 		<div class="sns_insta">	 			
			 		<ul id="insta_list" class="insta_ul">
			 		
			 			
			 		</ul>
		 		</div>
				<jsp:include page="/WEB-INF/front/common/paging_new2.jsp"/>
	 		</div>
	 	
	 	</section>
	 </div>
</div>
   <script src="/js/sub.js"></script>
	<script>
	var temp='';
	temp +='	<g>';
	temp +='   <circle cx="120.1" cy="67.6" r="4.6" style="fill:#fff"></circle>';
	temp +='   <circle cx="157.4" cy="82.9" r="4.6" style="fill:#fff"></circle>';
	temp +='   <circle cx="172.7" cy="120.1" r="4.6" style="fill:#fff"></circle>';
	temp +='   <circle cx="157.5" cy="157.3" r="4.6" style="fill:#fff"></circle>';
	temp +='   <circle cx="120.2" cy="172.7" r="4.6" style="fill:#fff"></circle>';
	temp +='   <circle cx="83" cy="157.3" r="4.6" style="fill:#fff"></circle>';
	temp +='   <circle cx="67.6" cy="120.1" r="4.6" style="fill:#fff"></circle>';
	temp +='   <circle cx="82.8" cy="82.8" r="4.6" style="fill:#fff"></circle>';
	temp +=' </g>';
	temp +=' <g>';
	temp +='    <circle cx="136.3" cy="39.3" r="5.8" style="fill:#fff"></circle>';
	temp +='    <circle cx="166" cy="51.7" r="5.8" style="fill:#fff"></circle>';
	temp +='    <circle cx="188.7" cy="74.4" r="5.8" style="fill:#fff"></circle>';
	temp +='    <circle cx="201" cy="104" r="5.8" style="fill:#fff"></circle>';
	temp +='    <circle cx="200.9" cy="136.2" r="5.8" style="fill:#fff"></circle>';
	temp +='    <circle cx="188.7" cy="165.9" r="5.8" style="fill:#fff"></circle>';
	temp +='    <circle cx="165.9" cy="188.6" r="5.8" style="fill:#fff"></circle>';
	temp +='    <circle cx="136.2" cy="200.9" r="5.8" style="fill:#fff"></circle>';
	temp +='    <circle cx="104.2" cy="200.9" r="5.8" style="fill:#fff"></circle>';
	temp +='    <circle cx="74.4" cy="188.7" r="5.8" style="fill:#fff"></circle>';
	temp +='    <circle cx="51.5" cy="166" r="5.8" style="fill:#fff"></circle>';
	temp +='    <circle cx="39.4" cy="136.4" r="5.8" style="fill:#fff"></circle>';
	temp +='    <circle cx="39.3" cy="104" r="5.8" style="fill:#fff"></circle>';
	temp +='    <circle cx="51.7" cy="74.5" r="5.8" style="fill:#fff"></circle>';
	temp +='    <circle cx="74.3" cy="51.7" r="5.8" style="fill:#fff"></circle>';
	temp +='    <circle cx="104" cy="39.3" r="5.8" style="fill:#fff"></circle>';
	temp +='</g>';
	temp +='<g>';
	temp +='    <circle cx="120.1" cy="8.1" r="8.1" style="fill:#fff"></circle>';
	temp +='    <circle cx="162.9" cy="16.6" r="8.1" style="fill:#fff"></circle>';
	temp +='    <circle cx="199.5" cy="40.8" r="8.1" style="fill:#fff"></circle>';
	temp +='    <circle cx="223.7" cy="77.6" r="8.1" style="fill:#fff"></circle>';
	temp +='    <circle cx="232" cy="120.3" r="8.1" style="fill:#fff"></circle>';
	temp +='    <circle cx="223.8" cy="162.9" r="8.1" style="fill:#fff"></circle>';
	temp +='    <circle cx="199.5" cy="199.4" r="8.1" style="fill:#fff"></circle>';
	temp +='    <circle cx="163" cy="223.8" r="8.1" style="fill:#fff"></circle>';
	temp +='    <circle cx="120.1" cy="232.3" r="8.1" style="fill:#fff"></circle>';
	temp +='    <circle cx="77.3" cy="223.6" r="8.1" style="fill:#fff"></circle>';
	temp +='    <circle cx="40.9" cy="199.4" r="8.1" style="fill:#fff"></circle>';
	temp +='    <circle cx="16.6" cy="163" r="8.1" style="fill:#fff"></circle>';
	temp +='    <circle cx="8.1" cy="120.1" r="8.1" style="fill:#fff"></circle>';
	temp +='    <circle cx="16.6" cy="77.4" r="8.1" style="fill:#fff"></circle>';
	temp +='    <circle cx="40.9" cy="41" r="8.1" style="fill:#fff"></circle>';
	temp +='    <circle cx="77" cy="16.5" r="8.1" style="fill:#fff"></circle>';
	temp +=' </g>';
	
	</script>
<jsp:include page="/WEB-INF/front/common/footer.jsp"/>