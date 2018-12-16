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
			focus : true,
			disableResizeEditor: true
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

		var log = $("#log").val();
		if (log != "") {
			$.get(log, function(data) {
				var logs = data.split(";:;");
				var str = "";
				for (i = 0; i < logs.length; i++) {
					if (i != 0) {
						str += "<br/>";
					}
					str += logs[i];
				}
				$("#apvlog").html(str);
			});
		}
		
		$(".rewrite").click(function() {
			var r = confirm("���� �����Ͻðڽ��ϱ�?");
			if (r == true) {
				$$('#content').summernote('enable');
				$(".rewrite").hide();
				$(".resubmit").show();
			}
		});

		$(".resubmit").click(function() {
			var setnum = $(this).attr("data-num");
			$("input[name=apv_set_num]").val(setnum);
			var r = confirm("���� �������Ͻðڽ��ϱ�?");
			if (r == true) {
				$$("#content").summernote("destroy");
				$("#detail").submit();
			}
		});

		$(".approve").click(function() {
			var setnum = $(this).attr("data-num");
			$("input[name=apv_set_num]").val(setnum);
			var question = "���� �����Ͻðڽ��ϱ�?";
			if (setnum != 2 && setnum != 4) {
				var rejection = $("#comment").val();
				if (rejection == "" || rejection == null) {
					alert("�ǰ��� �ۼ����ֽñ� �ٶ��ϴ�.");
					return;
				}
				question = "���� �ݷ��Ͻðڽ��ϱ�?";
				if (setnum == 6) {
					question = "���� �ݷ� �� �ź��Ͻðڽ��ϱ�?";
				}
			}
			var r = confirm(question);
			if (r == true) {
				$("#detail").submit();
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
		<form id="detail" action="${pageContext.request.contextPath }/approval/approve.do" method="post" enctype="multipart/form-data" accept-charset="utf-8">
			<input type="hidden" name="id" value="${sessionScope.id }">
			<table class="table" style="max-width: 1000px;">
				<c:set var="a" value="${approval }" />
				<tr><th>���� ��ȣ</th>
					<td>
						<input type="hidden" name="num" value="${a.num }">${a.num }</td>
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
				<tr><th>������(1��)</th>
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
					<th>
						���� ����
						<input type="hidden" name="apv_set_num">
					</th>
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
				<tr><th>������(2��)</th>
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
					<td colspan="2" style="text-align:right;">
						<c:set var="id" value='${sessionScope.id }' />
						<c:choose>
							<c:when test="${a.id eq id }">
								<%-- ����, ����, �ź� / �ݷ� --%>
								<c:if test="${a.apv_set_num eq 3 || a.apv_set_num eq 5 }">
									<input class="rewrite" type="button" value="����">
									<input class="resubmit" type="button" value="����" data-num="1" style="display: none;">
								</c:if>
							</c:when>
							<c:when test="${a.mid_id eq id }">
								<%-- �����ؾ��� --%>
								<c:if test="${a.apv_set_num eq 1 }">
									<c:choose>
										<c:when test="${!empty a.fnl_id }">
											<input class="approve" type="button" value="����" data-num="2">
											<input class="approve" type="button" value="�ݷ�" data-num="3">
										</c:when>
										<c:otherwise>
											<input class="approve" type="button" value="����" data-num="4">
											<input class="approve" type="button" value="�ݷ�" data-num="5">
										</c:otherwise>
									</c:choose>
									<input class="approve" type="button" value="�ݷ�/�ź�" data-num="6">
									<script>
										$(document).ready(function() {
											$("#view").show();
										});
									</script>
								</c:if>
							</c:when>
							<c:when test="${a.fnl_id eq id }">
								<%-- 2���� --%>
								<c:if test="${a.apv_set_num eq 2 }">
									<input class="approve" type="button" value="����" data-num="4">
									<input class="approve" type="button" value="�ݷ�" data-num="5">
									<input class="approve" type="button" value="�ݷ�/�ź�" data-num="6">
									<script>
										$(document).ready(function() {
											$("#view").show();
										});
									</script>
								</c:if>
							</c:when>
							<c:otherwise>
								���Ѿ���
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr id="view" style="display: none;"><th>�ǰ�</th>
					<td colspan="3">
						<input id="comment" name="rejection" type="text" style="width: 100%;" placeholder="�ǰ��� �ۼ����ּ���.">
					</td></tr>
				<tr><th>
						����α�
						<input type="hidden" id="log" name="log" value="${a.log }">
					</th>
					<td colspan="3"><div id="apvlog"></div></td></tr>
				<tr></tr>
				<tr><th>���� ����</th>
					<td colspan="3">
						<input type="hidden" id="path" name="path" value="${a.path }">
						<textArea id="content" name="content"></textArea>
					</td></tr>
			</table>
		</form>
	</div>
</body>
<style>
.rewrite, .resubmit, .approve {
	width: 32%;
}

#apvlog {
  height: 100px;
  overflow: auto;
}
</style>
</html>