<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- summer note -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.js"></script>
<script>
	var $$ = jQuery.noConflict();
</script>
<script>
	$(document).ready(function() {
		$.note = function() {
			$$("#content").summernote({
				tabsize : 2,
				height : 700,
				width : '100%',
				minHeight : null,
				maxHeight : null,
				focus : true
			});
		}
		$.note();
		$$('#content').summernote('disable');

		file = $("input[name=path]").val();
		$.get(file, function(data) {
			$$('#content').summernote("code", data);
		});

		var flag = true;

		$(".select").click(function() {
			if (flag == true) {
				num = $(this).attr("data-num");
				file = $(this).attr("data-path");
				$.get(file, function(data) {
					$$('#content').summernote("code", data);
				});
				$("input[name=num]").val(num);
				$("input[name=path]").val(file);
			} else {
				alert("현재 작업을 마치고 시도하세요.");
			}
		});

		$("#rewrite").click(function() {
			var r = confirm("정말 수정하시겠습니까?");
			if (r == true) {
				var num = $("input[name=num]").val();
				var title = $(".select[data-num=" + num + "]").html();
				$("input[name=title]").val(title);
				$$('#content').summernote('enable');
				$("#rewrite").hide();
				$("#save").show();
				$("#del").show();
				$("#cancel").show();
				$("input[name=title]").show();
				flag = false;
			}
		});

		$("#cancel").click(function() {
			$$('#content').summernote('disable');
			$("#rewrite").show();
			$("#save").hide();
			$("#del").hide();
			$("#cancel").hide();
			$("input[name=title]").hide();
			file = $("input[name=path]").val();
			$.get(file, function(data) {
				$$('#content').summernote("code", data);
			});
			flag = true;
		});

		$("#save").click(function() {
			var r = confirm("정말 저장하시겠습니까?");
			if (r == true) {
				$$("#content").summernote("destroy");
				$("#docs").submit();
			}
		});

		$("#del").click(function() {
			var r = confirm("정말 삭제하시겠습니까?");
			if (r == true) {
				$("#docs").attr("action", "${pageContext.request.contextPath }/approval/docDel");
				$("#docs").submit();
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
									<span> 문서양식관리 </span>
								</h2>
							</div>
						</div>
					</div>
					<div class="m-portlet__body">
						<div class="container">
							<form id="docs" action="${pageContext.request.contextPath }/approval/docSave" method="post" enctype="multipart/form-data" accept-charset="utf-8">
								<table class="table" style="max-width: 1000px;">
									<tr><td colspan="2" style="text-align: right;">
											<input type="text" name="title" style="display: none">
											<input type="button" value="추가" onclick="location.href='${pageContext.request.contextPath }/approval/addDocument'" class="btn btn-secondary">
											<input id="rewrite" type="button" value="수정" class="btn btn-secondary">
											<input id="save" type="button" value="저장" style="display: none;" class="btn btn-secondary">
											<input id="del" type="button" value="삭제" style="display: none;" class="btn btn-secondary">
											<input id="cancel" type="button" value="취소" style="display: none;" class="btn btn-secondary">
										</td></tr>
									<tr><td>
											<table class="table table-hover">
												<c:forEach var="d" items="${list }" varStatus="status">
													<c:if test="${status.first }">
														<input type="hidden" name="num" value="${d.num }">
														<input type="hidden" name="path" value="${d.path }">
													</c:if>
													<tr><th class="select" data-num="${d.num }" data-path="${d.path }">${d.title }</th></tr>
												</c:forEach>
											</table>
										</td>
										<td>
											<textArea id="content" name="content"></textArea>
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