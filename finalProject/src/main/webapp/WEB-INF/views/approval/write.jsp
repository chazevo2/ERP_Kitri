<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>문서 작성</title>
<style>
input[type=text] {
	width: 100%;
}

.ex {
	width: 100%;
}
</style>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<!-- <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> -->
<!-- <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> -->
<!-- <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> -->
<!-- include summernote css/js -->
<!-- <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet"> -->
<!-- <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script> -->
<script>
	var $$ = jQuery.noConflict();
	$$(document).ready(function() {
		$$("#content").summernote({
			tabsize : 2,
			height : 400,
			width : '100%',
			minHeight : null,
			maxHeight : null,
			focus : true
		});
	});
</script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	var $ = jQuery.noConflict();
	$(document).ready(function() {
		var newWin;
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath }/approval/docsList",
			success : function(data) {
				var list = eval("(" + data + ")");
				var str = "<table style='width: 100%;'><caption><h4>문서 양식</h4></caption><tr>";
				str += "<td colspan='4' align='right'><a href='${pageContext.request.contextPath }/main?sub=/approval/addDocument'>문서 양식 추가</a></td></tr>";
				str += "<tr><td colspan='4'><br/></td></tr>";
				if (list.length < 1) {
					str += "<tr><td colspan='4'>빈 목록입니다.</td></tr><tr>";
				} else {
					for (i = 0; i < list.length; i++) {
						str += "<td style='width: 25%;'><input type='button' class='ex' value='" + list[i].title + "' path='" + list[i].path + "'></td>";
						if ((i != 0 && i % 3 == 0) || i == list.length - 1) {
							str += "</tr>";
						}
					}
				}
				str += "<tr><td colspan='4'><br/></td></tr>";
				str += "</table>";
				$("#docsList").html(str);

				$(".ex").on("click", function() {
					file = $(this).attr("path");
					$.get(file, function(data) {
						$$('#content').summernote("code", data);
					});
				});
			}
		});

		$("#write").click(function() {
			$$("#content").summernote("destroy");
			$("#apv").submit();
		});

		$(".apv_id").click(function() {
			newWin = window.open('${pageContext.request.contextPath }/approval/getApvId', '결재선 지정', 'location=no, directories=no, resizable=no, status=no, toolbar=no, menubar=no, width=440, height=270, scrollbars=no, top=300, left=300');
			$("#selectedId").val($(this).attr("name"));
		});

	});
</script>
</head>
<body>
	<table>
		<tr><td>
				<a href="${pageContext.request.contextPath }/main?sub=/approval/approve">결재문서</a>
			</td></tr>
		<tr><td>
				<a href="${pageContext.request.contextPath }/main?sub=/approval/write">문서작성</a>
			</td></tr>
		<tr><td>
				<a href="${pageContext.request.contextPath }/main?sub=/approval/write">???</a>
			</td></tr>
	</table>
	<form id="apv" action="${pageContext.request.contextPath }/approval/write" method="post" enctype="multipart/form-data" accept-charset="utf-8">
		<div class="container">
			<table class="table table-hover" style="max-width: 900px;">
				<tr><td colspan="4" id="docsList"></td></tr>
				<tr><th style="text-align: center; height: 30px">파일명 :</th>
					<td>
						<input type="text" name="title">
					</td>
					<td colspan="2" align="right">
						<input type="hidden" name="id" value="${sessionScope.id }">
						<input type="button" id="write" value="문서 작성">
					</td></tr>
				<tr><th style="text-align: center; height: 30px">1차승인 :</th>
					<td>
						<input type="text" class="apv_id" name="mid_id" readonly>
					</td>
					<th style="text-align: center; height: 30px">2차승인 :</th>
					<td>
						<input type="text" class="apv_id" name="fnl_id" readonly>
					</td></tr>
				<tr><td colspan="4">
						<textArea id="content" name="content"></textArea>
					</td></tr>
			</table>
		</div>
	</form>
	<input type="hidden" id="selectedId">
</body>
</html>