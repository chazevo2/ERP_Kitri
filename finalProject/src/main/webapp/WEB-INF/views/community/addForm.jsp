<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.js"></script>
<script>
	var $$ = jQuery.noConflict();
</script>
<script type="text/javascript">
	$(document).ready(function() {
		var $ = jQuery.noConflict();
		$.note = function() {
			$$("#summernote").summernote({
				tabsize : 2,
				height : 400,
				width : '100%',
				minHeight : null,
				maxHeight : null,
				focus : true,
				disableResizeEditor : true
			});
		}
		$.note();
		$('#summernote').val("");

		$('#back').click(function() {
			history.go(-1);
		});

		$('#add').click(function() {
			var title = $('#title').val();
			$$("#summernote").summernote("destroy");
			var content = $('#summernote').val();
			var location = $('#location').val();
			if (title == null || title == "") {
				alert("제목을 입력해주세요.");
				$.note();
				return;
			} else if (content == null || content == "") {
				alert("내용을 입력해주세요.");
				$.note();
				return;
			} else if (location == null || location == "") {
				alert("장소를 입력해주세요.");
				$.note();
				return;
			} else {
				$('#f').submit();
			}

		})
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
									<span> 모임 등록 </span>
								</h2>
							</div>
						</div>
					</div>
					<div class="m-portlet__body">
						<form action="${pageContext.request.contextPath }/community/add" id="f" method="post" accept-charset="UTF-8">
							<div class="container">
								<table class="table table-hover">
									<tr>
										<th>제목</th>
										<td>
											<input type="text" name="title" id="title" style="width: 99%;">
										</td>
									</tr>
									<tr>
										<th>내용</th>
										<td>
											<textarea name="content" id="summernote"></textarea>
										</td>
									</tr>
									<tr>
										<th>장소</th>
										<td>
											<input type="text" id="location" name="location" style="width: 99%;">
										</td>
									</tr>
									<tr>
										<th>모임 정원</th>
										<td>
											<select name="maxnop" style="width: 50%;">
												<c:forEach var="i" begin="1" end="15" step="1">
													<option value="${i }">${i }명</option>
												</c:forEach>
											</select>
										</td>
									<tr>
										<th>작성자</th>
										<td>
											<input type="text" name="writer" value="${sessionScope.id }" style="width: 99%; text-align: center;" readonly>
										</td>
									</tr>
									<tr>
										<td colspan="2" align="right">
											<input type="button" id="add" value="등록" class="btn btn-secondary">
											<input type="button" class="btn btn-secondary" id="back" value="뒤로">
										</td>
									</tr>
								</table>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
