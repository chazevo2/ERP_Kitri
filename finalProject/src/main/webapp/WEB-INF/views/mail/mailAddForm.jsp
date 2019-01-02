<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#back").click(function() {
			history.go(-1);
		});

		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/departmentCode/list",
			success : function(data) {
				var arr = eval('(' + data + ')');
				var str = "";
				str += "<select id=departmentSel name=departmentCode class=form-control>";
				str += "<option value=0>부서</option>";
				for (i = 0; i < arr.length; i++) {
					str += "<option value="+arr[i].num+">" + arr[i].name + "</option>";
				}
				str += "</select>";
				$("#department").html(str);
				$("#departmentSel").change(function() {
					$("#getEmail").val("");
					var param = "num=" + $(this).val();
					$.ajax({
						type : "POST",
						url : "${pageContext.request.contextPath}/member/listByDepartmentCode",
						data : param,
						success : function(data) {
							var check = '${sessionScope.id}';
							var arr = eval("(" + data + ")");
							var arrNum;
							var str = "";
							str += "<select id=memberSel class=form-control>";
							str += "<option value=0>사번-직책-이름</option>";
							for (i = 0; i < arr.length; i++) {
								if (check != arr[i].id) {
									str += "<option value="+arr[i].email+">" + arr[i].id + "-" + arr[i].gradeCode + "-" + arr[i].name + "</option>";
								}
							}
							str += "</select>";
							$("#member").html(str);

							$("#memberSel").change(function() {
								var value = $(this).val();
								if (value != 0) {
									$("#getEmail").val(value);
								}
							});
						}
					});
				});
			}
		});
		$("#submit").click(function() {
			var sendEmail = $("#sendEmail").val();
			var getEmail = $("#getEmail").val();
			var title = $("#title").val();
			/* $("#content").val(); */
			var content = $("#content").val().replace(/\n/g, '<br>');
			var cnt = 0;
			if (getEmail == null || getEmail == "") {
				alert("메일주소를 입력하시오");
				cnt++;
			}
			if (title == null || title == "") {
				alert("제목을 입력하시오");
				cnt++;
			}
			if (content == null || content == "") {
				alert("내용을 입력하시오");
				cnt++;
			}
			if (cnt == 0) {
				var param = "sendEmail=" + sendEmail + "&title=" + title + "&getEmail=" + getEmail + "&content=" + content;
				$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/mail/add",
					data : param,
					success : function() {

					}
				});
				$("#mySpan").html("new");
				ws.send(getEmail);
				location.href = "${pageContext.request.contextPath}/mailList/list";
			}
		});
	});
</script>
<style>
.myButton {
	-moz-box-shadow: inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow: inset 0px 1px 0px 0px #ffffff;
	box-shadow: inset 0px 1px 0px 0px #ffffff;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ffffff), color-stop(1, #f6f6f6));
	background: -moz-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
	background: -webkit-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
	background: -o-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
	background: -ms-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
	background: linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#f6f6f6', GradientType=0);
	background-color: #ffffff;
	-moz-border-radius: 6px;
	-webkit-border-radius: 6px;
	border-radius: 6px;
	border: 1px solid #dcdcdc;
	display: inline-block;
	cursor: pointer;
	color: #666666;
	font-family: Arial;
	font-size: 15px;
	font-weight: bold;
	padding: 6px 24px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #ffffff;
}

.myButton:hover {
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f6f6f6), color-stop(1, #ffffff));
	background: -moz-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
	background: -webkit-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
	background: -o-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
	background: -ms-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
	background: linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#f6f6f6', endColorstr='#ffffff', GradientType=0);
	background-color: #f6f6f6;
}

.myButton:active {
	position: relative;
	top: 1px;
}
</style>
</head>
<body>
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
										<span> 쪽지 작성 </span>
									</h2>
								</div>
							</div>
						</div>
						<div class="m-portlet__body">
							<div class="container">
								<div class="row">
									<div class="col-md-12 col-md-offset-0">
										<div class="well well-sm">
											<form id="f" class="form-horizontal" action="${pageContext.request.contextPath}/mail/add" method="post">
												<fieldset>
													<legend class="text-center">message</legend>
													<!-- Name input-->
													<div class="form-group">
														<label class="col-md-3 control-label" for="email">사람찾기</label> <span class="col-md-5" id="department"> </span> <span class="col-md-5" id="member"> </span>
													</div>
													<div class="form-group">
														<label class="col-md-3 control-label" for="name">받는사람</label>
														<div class="col-md-10">
															<input id="getEmail" name="getEmail" type="text" placeholder="받는 사람을 입력하시오" class="form-control" value="">
														</div>
													</div>
													<div class="form-group">
														<label class="col-md-3 control-label" for="email">제목</label>
														<div class="col-md-10">
															<input id="title" name="title" type="text" placeholder="제목을 입력하시오" class="form-control">
														</div>
													</div>
													<!-- Message body -->
													<div class="form-group">
														<label class="col-md-3 control-label" for="message">내용</label>
														<div class="col-md-10">
															<textarea class="form-control" id="content" name="content" placeholder="내용을 입력하시오" rows="25"></textarea>
														</div>
													</div>
													<!-- Form actions -->
													<div class="form-group">
														<div class="col-md-12 text-right">
															<input type="hidden" id="sendEmail" name="sendEmail" value="${sessionScope.email}">
															<input type="button" id="back" class="btn btn-secondary" value="뒤로가기">
															<input type="button" id="submit" class="btn btn-secondary" value="쪽지전송">
														</div>
													</div>
												</fieldset>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>