<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		$(".select").on("click", function() {
			var num = $(this).find("td").eq(0).html();
			location.href = "${pageContext.request.contextPath }/approval/detail?num=" + num;
		});
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
									<span> 결재문서함 </span>
								</h2>
							</div>
						</div>
					</div>
					<div class="m-portlet__body">
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
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
