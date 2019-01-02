<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<style>
a {
	color: #0060B6;
	text-decoration: none;
}

a:hover {
	color: #00A0C6;
	text-decoration: none;
	cursor: pointer;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$('.listc').click(function() {
			var num = $(this).attr("data-num");
			location.href = "${pageContext.request.contextPath }/notice/detail?num=" + num;
		});

		$('#title').click(function() {
			var title = $('#titleV').val();
			location.href = "${pageContext.request.contextPath }/notice/selectList?title=" + encodeURI(title, "UTF-8");
		});
		$('#add').click(function() {
			location.href = "${pageContext.request.contextPath }/notice/addForm";
		});
		$('#back').click(function() {
			history.go(-1);
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
								<span class="m-portlet__head-icon m--hide"> </span>
								<h2 class="m-portlet__head-label m-portlet__head-label--info">
									<span> 공지사항 </span>
								</h2>
							</div>
						</div>
					</div>
					<div class="m-portlet__body">
						<form accept-charset="utf-8">
							<div class="container">
								<table class="table table-hover">
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
									<tr>
										<td colspan="5" align="right">
											<input type="button" id="back" class="btn btn-secondary" value="이전">
											<input type="button" id="add" class="btn btn-secondary" value="등록">
										</td>
									</tr>
								</table>
								<div align="center">
									<form action="/notice/selectList1" id="search">
										<input type="text" id="titleV" value="${n.title }" style="width: 50%; height: 30px; border-radius: 5px;" placeholder="&nbsp;검색할 제목을 입력하시오.">
										<input type="button" class="btn btn-secondary" name="title" id="title" value="검색">
									</form>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
