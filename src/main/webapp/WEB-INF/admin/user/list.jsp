<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/admin/common/header.jsp"/>
<jsp:include page="/WEB-INF/admin/common/date_picker.jsp"/>


<style>
  table {
    width: 50%;
    border: 1px solid #444444;
  }
  th, td {
    border: 1px solid #444444;
  }
</style>

<script>
$(document).ready(function() {
	getList();
	
	$("#chk_all").change(function() 
	{
		if($("#chk_all").is(":checked"))
		{
			$('.chk_notice').prop("checked", true);
		}
		else
		{
			$('.chk_notice').prop("checked", false);
		}
	});
	
	
});

function getList(idx){
	
	$.ajax({
		type : "POST", 
		url : "/admin/user/getUserList",
		dataType : "text",
		data : 
		{
			page : page,
			order_by : order_by,
			sort_type : sort_type
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
			$('#list_cnt').html('<p><strong style="display:none;">결과 '+result.listCount+'개 / </strong><strong>전체 관리자 수('+result.TotalCnt+')</strong></p>');
			if(result.list.length > 0)
			{
				var up_show_yn ="";
				for(var i = 0; i < result.list.length; i++)
				{
					inner+='<tr>';
					inner +='	<td><input type="checkbox" class="chk_notice" value="'+result.list[i].idx+'"></td>';
					inner+='	<td>'+(i+1)+'</td>';
					inner+='	<td>'+result.list[i].NAME+'</td>';
					inner+='	<td>'+result.list[i].id+'</td>';
					inner+='	<td>'+result.list[i].email+'</td>';
					inner+='	<td>'+result.list[i].phone+'</td>';
					inner+='	<td>'+result.list[i].submit_date+'</td>';
					inner+='	<td><input type="button" class="btn modi_btn" value="수정" onclick="javascript=location.href=\'/admin/user/join?idx='+result.list[i].idx+'\' "></td>';
					inner+='</tr>';
				}
			}
			else
			{
				inner+='<tr>';
				inner+='	<td colspan="6">등록된 게시물이 없습니다.</td>';
				inner+='</tr>';
			}
			
			order_by = result.order_by;
			sort_type = result.sort_type;
			listSize = result.listSize;
			$(".pro-pagenation").html(makePaging(result.page, result.s_page, result.e_page, result.pageNum, 1));
			$('#list_target').html(inner);
		}
	});
}

function delTarget(){
	var idx ="";
	$('.chk_notice').each(function(){ 
		if ($(this).prop('checked')==true) 
		{
			idx +=$(this).val()+"|";
		}
	})
	
	if (idx=="") 
	{
		alert('삭제할 게시물을 선택해주세요.');
		return;
	}
	
	if(!confirm("정말 삭제하시겠습니까?"))
	{
		return;
	}
	
	if (idx=="") 
	{
		alert("삭제할 게시글을 선택해주세요.");
		return;
	}
	
	$.ajax({
		type : "POST", 
		url : "/admin/pr/delTarget",
		dataType : "text",
		async : false,
		data : 
		{
			idx : idx,
			tbl : 'tbl_user'
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
<div id="container">
	<div class="inner">
		<div class="inner_top">
			<h2 class="ad_tit">관리자 설정</h2>
		</div>
		
		<div class="inner_cont">
			<div class="list_cont_top">
				<div id="list_cnt" class="list_cnt"></div>
				<div class="btn_box">
					<input type="button" class="del_btn btn" value="선택항목 삭제" onclick="delTarget()">
				</div>
				<input type="button" class="submit_btn btn" value="등록" onclick="javascript:location.href='/admin/user/join'">
			</div>
		
			<div class="list_cont_bottom">
				<table id="lists" class="pr_list user_list">
					<colgroup>
						<col width="5%"/>
						<col width="3%"/>
						<col width="15%"/>
						<col width="8%"/>
						<col width=""/>
						<col width="12%"/>
						<col width="15%"/>
						<col width="15%"/>
					</colgroup>
					<thead>
						<tr>
							<th><input type="checkbox" id="chk_all"></th> 
							<th>NO.</th>
							<th>관리자명</th>
							<th>아이디</th>
							<th>이메일</th>
							<th>연락처</th>
							<th>등록일</th>
							<th></th>
						</tr>
					</thead>
					<tbody id="list_target">
					</tbody>
				</table>
			</div>
			<jsp:include page="/WEB-INF/admin/common/paging_new.jsp"/>
		</div>
	</div>
	
</div>

<jsp:include page="/WEB-INF/admin/common/footer.jsp"/>