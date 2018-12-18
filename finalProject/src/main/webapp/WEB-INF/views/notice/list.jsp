<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<style>
a {
    color: #0060B6;
    text-decoration: none;
}

a:hover 
{
     color:#00A0C6; 
     text-decoration:none; 
     cursor:pointer;  
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$('.listc').click(function(){
		var num = $(this).attr("data-num");
		location.href="${pageContext.request.contextPath }/notice/detail?num="+num;
	});
	
	$('#title').click(function(){
		var title = $('#titleV').val();
		location.href="${pageContext.request.contextPath }/notice/selectList?title=" + encodeURI(title, "UTF-8");
	});
});
</script>
 <div class="m-grid__item m-grid__item--fluid m-wrapper">
					<div class="m-content">
						<div class="row">
							<div class="col-lg-12">
								<div class="m-portlet m-portlet--creative m-portlet--first m-portlet--bordered-semi">
									<div class="m-portlet__head">
										<div class="m-portlet__head-caption">
											<div class="m-portlet__head-title">
												<span class="m-portlet__head-icon m--hide">
													
												</span>
												
												<h2 class="m-portlet__head-label m-portlet__head-label--info">
													<span>
														공지사항
													</span>
												</h2>
											</div>
										</div>
										
									</div>
									<div class="m-portlet__body">
										<form accept-charset="utf-8">
<a href="${pageContext.request.contextPath }/notice/addForm"><h4>등록</h4></a>
<a href="${pageContext.request.contextPath }/notice/list"><h4>전체리스트</h4></a>
<br>
<table class="table">
<tr>
<td align="right">
	<form action="/notice/selectList1" id="search">
		<input type="text"  id="titleV" value="${n.title }" placeholder=" 제목으로 검색">
		<input type="button" name="title" id="title" value="검색"> 
	</form>
</td>
</tr>
</table>
<div class="container">
<table class="table table-hover" >
<tr>
	<th>번호</th>
	<th>제목</th>
	<th>작성자</th>
	<th>작성일</th>
	<th>조회수</th>
</tr>
<c:forEach var="n" items="${list }" varStatus="status">
<tr class="listc" data-num="${n.num }">
	<td>${fn:length(list)-status.index}</td>
	<td>${n.title }</td>
	<td>${n.writer }</td>
	<td>${n.w_date }</td>
	<td>${n.view_count }</td>
</tr>
</c:forEach>
<c:if test="${empty list }">
<tr>
	<td>등록된 내용이 없습니다.</td>
</tr>	
</c:if>
</table>
</div>
</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div> 
