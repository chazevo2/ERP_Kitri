<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>결재 문서</title>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$.getName = function(target, id) {
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath }/member/getName",
			data : "id=" + id,
			success : function(data) {
				var member = eval("(" + data + ")");
				var name = member.name;

				var deptcode = member.departmentCode;

				$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath }/departmentCode/getByNum",
					data : "num=" + deptcode,
					success : function(data) {
						var dept = eval("(" + data + ")");
						$("#" + target).html(name + " (" + dept.name + ")");
					}
				});
			}
		});
	}

	$.getSet = function(target, set) {
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath }/approval/getSet",
			data : "set=" + set,
			success : function(data) {
				var apv_set = eval("(" + data + ")");
				$("#" + target).html(apv_set.status);
			}
		});
	}

	$(document).ready(function() {
		$(".select").on("click", function() {
			var num = $(this).find("td").eq(0).html();
			location.href = "${pageContext.request.contextPath }/main?sub=/approval/detail?num=" + num;
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
				<a href="${pageContext.request.contextPath }/main?sub=/approval/docsManage">문서양식관리</a>
			</td></tr>
	</table>
	<div class="container">
		<table class="table table-hover" style="max-width: 900px;">
			<thead>
				<tr><th>#</th>
					<th>제목</th>
					<th>기안자</th>
					<th>기안일</th>
					<th>결재 상태</th></tr>
			</thead>
			<c:choose>
				<c:when test="${!empty list }">
					<tbody>
						<c:forEach var="a" items="${list }" varStatus="status">
							<tr class="select">
								<td>${a.num }</td>
								<td>${a.title }</td>
								<td id="name_${status.index }" data-code="">${a.id }</td>
								<td>${a.apv_date }</td>
								<td id="status_${status.index }">${a.apv_set_num }</td>
							</tr>
							<script>
								$(document).ready(function() {
									var target = '${status.index}';
									var id = '${a.id }';
									var set = '${a.apv_set_num}';
									$.getName("name_" + target, id);
									$.getSet("status_" + target, set);
								});
							</script>
						</c:forEach>
					</tbody>
				</c:when>
				<c:otherwise>
					<tbody>
						<tr><td colspan="5" align="center">빈 목록입니다.</td></tr>
					</tbody>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
</body>
</html>