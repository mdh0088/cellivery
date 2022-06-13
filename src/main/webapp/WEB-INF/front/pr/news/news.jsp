<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- <script>
	var url = window.location.href
	var arrayUrl = url.split('/')
	if(arrayUrl[2]=='celliverylh.com')
	{
		history.back()
	}
	

</script> -->
<jsp:include page="/WEB-INF/front/common/header.jsp"/>
<script>
$(document).ready(function() {
	getList();
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
		url : "/getPrTargetList",
		dataType : "text",
		data : 
		{
			page : page,
			order_by : 'desc',
			search_name : $('#search_name').val(),
			sort_type : 'up_show_yn',
			cate : cate_idx,
			tbl : 'news'
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
				inner +='<div class="th_line">';
				inner +='	<div class="num">번호</div>';
				inner +='	<div class="subject">제목</div>';
				inner +='	<div class="audivor">작성자</div>';
				inner +='	<div class="date">작성일</div>';
				inner +='</div>';

				var str="'준비중입니다.'";
				var cnt=0;
				for(var i = 0; i < result.list.length; i++)
				{
					if(result.list[i].up_show_yn=='Y')
					{
						inner +='<div class="notice_line">';
						inner +='	<div class="num">공지</div>';
					}
					else
					{
						cnt++;
						inner +='<div class="basic_line">';
						inner +='	<div class="num">'+cnt+'</div>';
					}
					inner +='	<div class="subject"><a href="javascript:location.href=\'/news_board?idx='+result.list[i].idx+'\'">['+result.list[i].cate_title+'] '+result.list[i].title+'</a></div>';
					inner +='	<div class="author">'+result.list[i].manager+'</div>';
					inner +='	<div class="date">'+result.list[i].create_date+'</div>';
					inner +='</div>';
				}
			}
			else
			{
				inner +='<div class="basic_line">';
				inner +='	<div class="num"></div>';
				inner +='	<div class="subject">등록된 게시물이 없습니다.</div>';
				inner +='	<div class="author"></div>';
				inner +='	<div class="date"></div>';
				inner +='</div>';
			}
			
			order_by = result.order_by;
			sort_type = result.sort_type;
			listSize = result.listSize;
			$(".pagination").html(makePaging(result.page, result.s_page, result.e_page, result.pageNum, 1));
			$('#list_target').html(inner);
		}
	});
}

var cate_idx="";
function choose_cate(idx,cate_title){
	cate_idx = idx;
	$('#cate_title').text(cate_title);
}
</script>
<jsp:include page="/WEB-INF/front/common/header.jsp"/>

<div class="subpage pr">
	 <div class="sub_banner">
	 	<h2 class="sub_page_name lato">PR</h2>	 	
	 	<div class="sub_nav_wrap"> 	
	 		<p class="mo-ver current_menu">NEWS<img src="/img/sub/m_sub_nav_btn.png" alt="셀리버리L&H"></p>
	 		<ul class="sub_nav">
	 			<li class="lato"><a href="/notice">NOTICE</a></li>
	 			<li class="lato on"><a href="/news">NEWS</a>
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
	 			<li class="lato"><a href="/media">MEDIA</a></li>
	 			<li class="lato"><a href="/sns">SNS</a></li>
	 		</ul>	 
	 	</div>	
	 </div>
	 <div class="sub_content">
	 	<div class="sub_container">
	 		<div class="sub_top_box">
	 			<h3 class="sub_title lato black">News</h3>
		 		<div class="sub_search_box">
		 			<div class="select_box">
                        <P id="cate_title" class="lato">All</P>
                        <img src="/img/sub/pr/select-down2.png" alt="셀리버리L&H" />     
                        <ul>
	                        <li><a onclick="choose_cate('','All')">All</a></li>
                        	<c:forEach var="i" items="${cate_list}" varStatus="loop">
	                            <li><a onclick="choose_cate('${i.idx}','${i.title}')">${i.title}</a></li>
                            </c:forEach>
						</ul>
                    </div>
                    
                     <div class="search">
                  	   <input type="text" id="search_name"  placeholder="Search" onfocus="this.placeholder=''" onblur="this.placeholder='Search'" onkeypress="javascript:excuteEnter(getList);">
                  	  <button onclick="getList()"><img src="/img/sub/pr/board-search.png" alt="셀리버리L&H"></button>
		 			</div>
		 		</div>
	 		</div>
	 		
	 		<div id="list_target" class="news_table">
		 		
		 	</div>
		 	
		 	<jsp:include page="/WEB-INF/front/common/paging_new.jsp"/>
	 		
	 	</div>
	 	
	 </div>
</div>
   <script src="/js/sub.js"></script>

<jsp:include page="/WEB-INF/front/common/footer.jsp"/>