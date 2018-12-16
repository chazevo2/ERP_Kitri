<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>������� ����</title>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- summer note -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.js"></script>
<script>
	var $$ = jQuery.noConflict();
</script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
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
	$(document).ready(function() {
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
				alert("���� �۾��� ��ġ�� �õ��ϼ���.");
			}
		});

		$("#rewrite").click(function() {
			var r = confirm("���� �����Ͻðڽ��ϱ�?");
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
			var r = confirm("���� �����Ͻðڽ��ϱ�?");
			if (r == true) {
				$$("#content").summernote("destroy");
				$("#docs").submit();
			}
		});

		$("#del").click(function() {
			var r = confirm("���� �����Ͻðڽ��ϱ�?");
			if (r == true) {
				$("#docs").attr("action", "${pageContext.request.contextPath }/approval/docDel");
				$("#docs").submit();
			}
		});
	});
</script>
</head>
<body>
	<table>
		<tr><td>
				<a href="${pageContext.request.contextPath }/main?sub=/approval/approve">���繮��</a>
			</td></tr>
		<tr><td>
				<a href="${pageContext.request.contextPath }/main?sub=/approval/write">�����ۼ�</a>
			</td></tr>
		<tr><td>
				<a href="${pageContext.request.contextPath }/main?sub=/approval/docsManage">������İ���</a>
			</td></tr>
	</table>
	<div class="container">
		<form id="docs" action="${pageContext.request.contextPath }/approval/docSave" method="post" enctype="multipart/form-data" accept-charset="utf-8">
			<table class="table" style="max-width: 1000px;">
				<tr><td colspan="2" style="text-align: right;">
						<input type="text" name="title" style="display: none">
						<input type="button" value="�߰�" onclick="location.href='${pageContext.request.contextPath }/main?sub=/approval/addDocument'">
						<input id="rewrite" type="button" value="����">
						<input id="save" type="button" value="����" style="display: none;">
						<input id="del" type="button" value="����" style="display: none;">
						<input id="cancel" type="button" value="���" style="display: none;">
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
</body>
</html>