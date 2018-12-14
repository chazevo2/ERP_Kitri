<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- summernote -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.js"></script>
<script>
	var $$ = jQuery.noConflict();
	$(document).ready(function() {
		$$("#content").summernote({
			tabsize : 2,
			height : 500,
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
	$.getName = function(id) {
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
						var str = name + " (" + dept.name + " / " + id + ")";
						$("#" + id).html(str);
					}
				});
			}
		});
	}

	$.getSet = function(set) {
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath }/approval/getSet",
			data : "set=" + set,
			success : function(data) {
				var apv_set = eval("(" + data + ")");
				$("#" + set).html(apv_set.status);
			}
		});
	}

	$(document).ready(function() {
		var file = $("#path").val();
		$.get(file, function(data) {
			$$('#content').summernote("code", data);
			$$('#content').summernote('disable');
		});
		

		$(".control")
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
				<a href="${pageContext.request.contextPath }/main?sub=/approval/write">???</a>
			</td></tr>
	</table>
	<div class="container">
		<table class="table" style="max-width: 900px;">
			<c:set var="a" value="${approval }" />
			<tr><th>���� ��ȣ</th>
				<td>${a.num }</td>
				<th>���� ����</th>
				<td>${a.title }</td></tr>
			<tr><th>�ۼ���</th>
				<c:if test="${!empty a.id }">
					<td id="${a.id }">${a.id }</td>
					<script>
						$(document).ready(function() {
							var id = '${a.id }';
							if (id != "") {
								$.getName(id);
							}
						});
					</script>
				</c:if>
				<th>�ۼ���</th>
				<td>${a.apv_date }</td></tr>
			<tr><th>������(�߰�)</th>
				<c:choose>
					<c:when test="${!empty a.mid_id }">
						<td id="${a.mid_id }">${a.mid_id }</td>
						<script>
							$(document).ready(function() {
								var id = '${a.mid_id }';
								if (id != "") {
									$.getName(id);
								}
							});
						</script>
					</c:when>
					<c:otherwise>
						<td>������</td>
					</c:otherwise>
				</c:choose>
				<th>���� ����</th>
				<c:if test="${!empty a.apv_set_num }">
					<td id="${a.apv_set_num }">${a.apv_set_num }</td>
					<script>
						$(document).ready(function() {
							var set = '${a.apv_set_num }';
							if (set != "") {
								$.getSet(set);
							}
						});
					</script>
				</c:if>
			</tr>
			<tr><th>������(����)</th>
				<c:choose>
					<c:when test="${!empty a.fnl_id }">
						<td id="${a.fnl_id }">${a.fnl_id }</td>
						<script>
							$(document).ready(function() {
								var id = '${a.fnl_id }';
								if (id != "") {
									$.getName(id);
								}
							});
						</script>
					</c:when>
					<c:otherwise>
						<td>������</td>
					</c:otherwise>
				</c:choose>
				<%-- 1 ���� 2 ���� 3 �ݷ� 4 ���� 5 �ݷ� 6 �ݷ�/�ź� --%>
				<c:set var="id" value='${sessionScope.id }' />
				<c:choose>
					<c:when test="${a.id eq id }">
						<%-- ����, ����, �ź� / �ݷ� --%>
						<c:choose>
							<c:when test="${a.apv_set_num eq 3 && a.apv_set_num eq 5 }">
								<td colspan="2">
									<input type="button" value="����">
								</td>
							</c:when>
							<c:otherwise>
								<td colspan="2">${id }</td>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:when test="${a.mid_id eq id }">
						<c:choose>
							<%-- �����ؾ��� --%>
							<c:when test="${a.apv_set_num eq 1 }">
								<td colspan="2">
									<input class="control" type="button" value="����">
									<input class="control" type="button" value="�ݷ�">
									<input class="control" type="button" value="�ݷ�/�ź�">
								</td>
								<script>
									$(document).ready(function() {
										$("#view").show();
									});
								</script>
							</c:when>
							<c:otherwise>
								<td colspan="2">${id }</td>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:when test="${a.fnl_id eq id }">
						<c:choose>
							<%-- 2���� --%>
							<c:when test="${a.apv_set_num eq 2 }">
								<td colspan="2">
									<input class="control" type="button" value="����">
									<input class="control" type="button" value="�ݷ�">
									<input class="control" type="button" value="�ݷ�/�ź�">
								</td>
								<script>
									$(document).ready(function() {
										$("#view").show();
									});
								</script>
							</c:when>
							<c:otherwise>
								<td colspan="2">${id }</td>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<td colspan="2">�ٸ��� ${id }</td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr id="view" style="display: none;"><th>�ǰ�</th>
				<td colspan="3">
					<input id="comment" type="text" style="width: 100%;">
				</td></tr>
			<tr></tr>
			<tr><th>���� ����</th>
				<td colspan="3">
					<input type="hidden" id="path" value="${a.path }">
					<textArea id="content" name="content"></textArea>
				</td></tr>
		</table>
	</div>
</body>
<style>
.control {
	width: 32%;
}
</style>
</html>