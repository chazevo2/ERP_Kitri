<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>결재선 지정</title>
<style>
.scroll {
	display: block;
	width: 370px;
	border-collapse: collapse;
	border: 2px solid #000;
}

.scroll th {
	border: 1px solid #000;
	background: pink;
}

.scroll td {
	border: 1px solid #000;
	border-top: 0;
}

.scroll tbody {
	display: block;
	max-height: 100px;
	overflow: auto;
}

.scroll th:nth-of-type(1), .scroll td:nth-of-type(1) {
	width: 80px;
	text-align: center;
}

.scroll th:nth-of-type(2), .scroll td:nth-of-type(2) {
	width: 100px;
	text-align: center;
}

.scroll th:nth-of-type(3), .scroll td:nth-of-type(3) {
	width: 100px;
	text-align: center;
}

.scroll th:last-child, .scroll td:last-child {
	width: 80px;
	text-align: center;
}
</style>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function() {
		$("#selectApv").val($("#selectedId", opener.document).val());

		$("#search").click(function() {
			var name = $("#name").val();
			var gname = "";
			if (name != "") {
				$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath }/member/getApvId",
					data : "name=" + name,
					success : function(data) {
						var list = eval("(" + data + ")");
						var str = "<table class='scroll'>";
						str += "<tr><th>이름</th><th>ID</th><th>부서</th><th>직급</th></tr>";
						if (list.length > 0) {
							var id = $("#loginId").val();
							for (i = 0; i < list.length; i++) {
								if (list[i].id != id) {
									str += "<tr class='select'><td>" + list[i].name + "</td><td>" + list[i].id + "</td><td id=d_" + i + "></td><td id=g_" + i + "></td></tr>";
									$.getDept("d_" + i, list[i].departmentCode);
									$.getGrade("g_" + i, list[i].gradeCode);
								}
							}
						} else {
							str += "<tr><td colspan='4'>빈목록입니다.</td></tr>"
						}
						$("#result").html(str);

						$(".select").on("click", function() {
							var id = $(this).find("td").eq(1).html();
							if ($("input[name=mid_id]", opener.document).val() == id) {
								alert("잘못된 접근입니다.");
								return;
							} else {
								$("input[name=" + $("#selectApv").val() + "]", opener.document).val(id);
							}
							window.close();
						});
					}

				});
			}
		});
	});

	$.getDept = function(id, num) {
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath }/departmentCode/getByNum",
			data : "num=" + num,
			success : function(data) {
				var dept = eval("(" + data + ")");
				$("#" + id).html(dept.name);
			}
		});
	}

	$.getGrade = function(id, num) {
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath }/gradeCode/get",
			data : "num=" + num,
			success : function(data) {
				var grade = eval("(" + data + ")");
				$("#" + id).html(grade.name);
			}
		});
	}
</script>
</head>
<body>
	<input type="hidden" id="loginId" value="${sessionScope.id }">
	<input type="hidden" id="selectApv">
	<h3>결재자 이름 검색</h3>
	<input type="text" id="name">
	<input type="button" id="search" value="검색" class="btn btn-secondary">
	<h4>검색 결과</h4>
	<div id="result"></div>
</body>
</html>