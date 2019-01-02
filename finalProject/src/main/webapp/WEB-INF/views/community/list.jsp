<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/community/getList",
			success : function(data) {
				var arr = eval('(' + data + ')');
				var str = "";
				if (arr == null) {
					str += "<tr><td colspan='5'>등록된 게시글이 없습니다.</td></tr>";
					str += "<tr><td colspan=5 align=right><input type=button class=btn btn-secondary id=add value=등록></td></tr>";
				} else {
					for (i = 0; i < arr.length; i++) {
						str += "<tr class='select'><td>" + arr[i].num + "</td>";
						str += "<td>" + arr[i].title + "</td>";
						str += "<td>" + arr[i].writer + "</td>";
						str += "<td>" + arr[i].nop + "</td>";
						str += "<td>" + arr[i].w_date + "</td>";
						str += "<td>" + arr[i].clickcnt + "</td></tr>";
					}
				}
				$("#listTable").append(str);

				$(".select").on("click", function() {
					var num = $(this).find("td").eq(0).html();
					location.href = "${pageContext.request.contextPath }/community/editForm?num=" + num;
				});
			}

		});

		$('#add').click(function() {
			location.href = '${pageContext.request.contextPath }/community/gotoaddForm';
		});

		$('#search').click(function() {
			var title = $('input[name=title]').val();
			location.href = "${pageContext.request.contextPath }/community/selectByTitle?title=" + title;
			$('input[name=title]').val("");
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
									<span> 사내 모임 </span>
								</h2>
							</div>
						</div>
					</div>
					<div class="m-portlet__body">
						<div class="container">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>글 번호</th>
										<th>제목</th>
										<th>작성자</th>
										<th>참가 인원</th>
										<th>작성 날짜</th>
										<th>조회 수</th>
									</tr>
								</thead>
								<tbody id="listTable">
								</tbody>
							</table>
							<div align="right">
								<input type="button" class="btn btn-secondary" id="add" value="등록">
							</div>
							<br>
							<div align="center">
								<input type="text" name="title" style="width: 50%; height: 30px; border-radius: 5px;" placeholder="&nbsp;검색할 제목을 입력하시오.">
								&nbsp;&nbsp;&nbsp;
								<input type="button" id="search" class="btn btn-secondary" value="검색">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
