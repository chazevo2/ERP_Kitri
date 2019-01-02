<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.js"></script>
<script>
	var $$ = jQuery.noConflict();
</script>
<script>
	$(document).ready(function() {
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

		$('#add').click(function() {
			$$("#summernote").summernote("destroy");
			var t = $('#title').val();
			var c = $('#summernote').val();
			if (t == null || t == '') {
				alert("제목을 입력해 주세요");
				$.note();
				return;
			} else if (c == null || c == '') {
				alert("내용을 입력해 주세요");
				$.note();
				return;
			} else {
				$("#f").submit();
			}
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
									<span> 공지사항 등록 </span>
								</h2>
							</div>
						</div>
					</div>
					<div class="m-portlet__body">
						<div class="container">
							<form action="${pageContext.request.contextPath }/notice/add" method="post" id="f" accept-charset="utf-8">
								<table class="table">
									<tr><th>공지명</th>
										<td>
											<input type="text" name="title" id="title" style="width: 100%" placeholder=" 제목을 입력바랍니다.">
										</td></tr>
									<tr><th>공지내용</th>
										<td>
											<textarea style="resize: none" name="content" id="summernote"></textarea>
											<input type="hidden" name="writer" value="${sessionScope.id }">
										</td></tr>
									<tr><td colspan="2" align="right">
											<input type="button" class="btn btn-secondary" value="등록" id="add">
										</td></tr>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>