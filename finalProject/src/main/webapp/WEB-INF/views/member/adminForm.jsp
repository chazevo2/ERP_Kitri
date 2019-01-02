<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	var flag = true;
	$(document).ready(function() {
		$("input").click(function() {
			if ($(this).attr("read") == 1) {
				var value = $(this).attr("value");
				var num = $(this).attr("num");
				param = "num=" + num;
				$.a(param, value);

				if (value == "+") {
					$(this).attr("value", "-");
				} else {
					$(this).attr("value", "+");
				}
			}
		});

		$("#addDepartment").click(function() {
			win = window.open("${pageContext.request.contextPath }/departmentCode/addForm", "details", "width=500,height=600, top=200, left=500");
		});

		$("#addGrade").click(function() {
			win = window.open("${pageContext.request.contextPath }/gradeCode/addForm", "details", "width=500,height=600, top=200, left=500");
		});

		$.a = function(param, value) {
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/member/listByDepartmentCode",
				data : param,
				success : function(data) {
					var arr = eval("(" + data + ")");
					var arrNum;
					var str = "<thead><tr><th>-</th><th>사진</th><th>직급</th><th>사번</th><th>이름</th><th>휴대폰번호</th><th>이메일</th><th>주소</th><th>입사일</th><th>퇴사일</th><th>승인</th></tr></thead>";
					for (var i = 0; i < arr.length; i++) {
						arrNum = arr[i].departmentCode;
						str += "<tbody><tr><td><input id="+arr[i].id+" type=checkbox name=checkthis style=width:20px;height:20px;margin:10px></td>";
						str += "<td><img src="+arr[i].picture+" style=width:30px;height:30px></td>";
						str += "<td><input id=r"+arr[i].id+" type=text readonly style=border:none;text-align:center;width:80px value=''></td>";
						str += "<td>" + arr[i].id + "</td>";
						str += "<td>" + arr[i].name + "</td>";
						str += "<td>" + arr[i].hp + "</td>";
						str += "<td>" + arr[i].email + "</td>";
						str += "<td>" + arr[i].address + "</td>";
						str += "<td>" + arr[i].hiredate + "</td>";
						str += "<td>" + arr[i].firedate + "</td>";
						str += "<td>" + arr[i].confirm + "</td></tr></tbody>";
						$.b(arr[i].gradeCode, arr[i].id);
					}
					str += "";
					if (value == "+") {
						$("#" + arrNum).html(str);
					} else {
						$("#" + arrNum).html("");
					}
					$("#delete").click(function() {
						$('input:checkbox[name="checkthis"]').each(function() {
							if (this.checked) {//checked 처리된 항목의 값
								var id = $(this).attr("id");
								var param = "id=" + id;
								$.ajax({
									type : "post",
									url : "${pageContext.request.contextPath}/member/delete",
									data : param,
									success : function() {

									}
								});
								location.href = "${pageContext.request.contextPath }/departmentCode/adminForm";
							}
						});
					});

					$("#approval").click(function() {
						$('input:checkbox[name="checkthis"]').each(function() {
							if (this.checked) {//checked 처리된 항목의 값
								var id = $(this).attr("id");
								var param = "id=" + id;
								$.ajax({
									type : "post",
									url : "${pageContext.request.contextPath}/member/editApproval",
									data : param,
									success : function() {

									}
								});
								location.href = "${pageContext.request.contextPath }/departmentCode/adminForm";
							}
						});
					});
				}
			});
		}
		$.b = function(num, id) {
			var param = "num=" + num;
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/gradeCode/get",
				data : param,
				success : function(data) {
					var arr = eval("(" + data + ")");
					$("#r" + id).attr("value", arr.name);
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
									<span> <c:if test="${sessionScope.id=='admin'}">
														관리자페이지
														</c:if> <c:if test="${sessionScope.id!='admin'}">
														조직도
														</c:if>
									</span>
								</h2>
							</div>
						</div>
					</div>
					<div class="m-portlet__body">
						<div>
							<c:if test="${sessionScope.id=='admin'}">
								<input type="button" id="addDepartment" value="부서추가" class="btn btn-secondary">
								<input type="button" id="addGrade" value="직급추가" class="btn btn-secondary">
								<input type="button" id="approval" value="가입승인" class="btn btn-secondary">
								<input type="button" id="delete" value="강제탈퇴" class="btn btn-secondary">
								<br />
								<br />
							</c:if>
							<c:forEach var="list" items="${list }">
								<div id="div1">
									<input type="button" read="1" value="+" class="btn m-btn--pill btn-outline-info m-btn m-btn--outline-2x" num="${list.num}" style="width: 30px; height: 30px; text-align: center; vertical-align: middle;">${list.name }</div>
								<div class="container">
									<table class="table table-hover" id="${list.num}">
									</table>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
