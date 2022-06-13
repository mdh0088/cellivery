<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/admin/common/header.jsp"/>


<script>
$(document).ready(function() {
	getList();
	
	$("#lists tbody").sortable({
		update:function(event,ui){
			
			$(this).children().each(function(index){
				$(this).find('td').first().html(index+1);
			});
			
			
		}
	});
});

function add_pr_cate(){
	var inner ="";
	var new_cnt = $('.add_cate').length;
	var str = "add_cate_"+new_cnt;
	inner +='<tr id="'+str+'" class="add_cate">';
	inner +='	<td></td>';
	inner +='	<td class="handle"><img src="/img/admin/bar_icon.png" alt="순서변경" /></td>';
	inner +='	<td><input type="text" class="add_cate_title" placeholder="카테고리 명을 입력하세요."></td>';
	inner +='	<td>';
	inner +='		<label class="del_btn" for="del_pr_cate('+new_cnt+')">삭제</label>';
	inner +='		<input type="button" value="삭제" id="del_pr_cate('+new_cnt+')" onclick="del_pr_cate('+new_cnt+')">';
	inner +='	</td>';
	inner +='</tr>';
	$('#target_area').append(inner);
}

function save_pr_cate(){
	var arr="";
	$('.add_cate_title').each(function(index, item){
		arr+=$(this).val()+"|";
	})

	var idx_arr="";
	var order_no="";
	var cnt=0;
	$('.order_no').each(function(){ 
		cnt++;
		idx_arr+=$(this).attr('id').split('_')[1]+'|';
		order_no += cnt+"|";
	})

	
	$.ajax({
		type : "POST", 
		url : "./save_pr_cate",
		dataType : "text",
		data : 
		{
			arr : arr,
			idx_arr : idx_arr,
			order_no : order_no
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
			getList();
		}
	});
	
	
}

function del_pr_cate(idx){
	if(!confirm("정말 삭제하시겠습니까?"))
	{
		return;
	}
	
	$.ajax({
		type : "POST", 
		url : "./del_pr_cate",
		dataType : "text",
		data : 
		{
			idx : idx,
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
			getList();
		}
	});
}

function getList()
{
	$.ajax({
		type : "POST", 
		url : "./getCateList",
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
					inner+='<tr id="order_'+result.list[i].idx+'" class="order_no" >';
					inner+='	<td>'+(i+1)+'</td>';
					inner+='	<td class="handle"><img src="/img/admin/bar_icon.png" alt="순서변경" /></td>';
					inner+='	<td>'+result.list[i].title+'</td>';
					inner+='	<td>';
					inner+='		<label class="del_btn" for="del_pr_cate('+result.list[i].idx+')">삭제</label>';
					inner+='		<input type="button" value="삭제" id="del_pr_cate('+result.list[i].idx+')" onclick="del_pr_cate('+result.list[i].idx+')">';
					inner+='	</td>';
					inner+='</tr>';
				}
			}
			else
			{
				inner+='<tr>';
				inner+='	<td colspan="3">등록된 카테고리가 없습니다.</td>';
				inner+='</tr>';
			}
			$('#target_area').html(inner);
		}
	});
}


</script>

<div id="container">
	<div class="inner">
		<div class="inner_top">
			<h2 class="ad_tit">PR 카테고리 관리</h2>
			<p class="ad_titDesc">PR 게시판 카테고리를 수정하고 관리합니다.</p>
			<div class="btn_box btn_box1">
				<label class="add_pr_cate btn btn1" for="add_pr_cate">카테고리 추가</label>
				<input type="button" id="add_pr_cate" value="카테고리 추가" onclick="add_pr_cate()">
				<label class="save_pr_cate btn btn2" for="save_pr_cate" onclick="save_order()">변경내용 저장</label>
				<input type="button" id="save_pr_cate" value="변경내용 저장" onclick="save_pr_cate()">
			</div>  
		</div>
		
		<div class="list_box">
			<table style="boder : 1px;" id="lists" class="cate pr_cate">
				<thead>
					<tr>
						<th>No.</th>
						<th>순서 변경</th>
						<th>카테고리명</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody id="target_area">
					
				</tbody>
			</table>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/admin/common/footer.jsp"/>