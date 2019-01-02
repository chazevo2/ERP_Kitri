<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	ws.onmessage = function(event) {
		var email = event.data;
		var email1 = '${sessionScope.email}';
		if (email == email1) {
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/mail/listJson",
				success : function(data) {
					var arr = eval("(" + data + ")");
					var str = "";
					for (var i = 0; i < arr.length; i++) {
						str += "<tr><td num="+arr[i].num+"><input id="+arr[i].num+" type=checkbox name=checkthis style=width:20px;height:20px;margin:10px></td>";
						str += "<td class=move num="+arr[i].num+">" + arr[i].read + "</td>";
						str += "<td class=move num="+arr[i].num+">" + arr[i].sendEmail + "</td>";
						str += "<td class=move num="+arr[i].num+">" + arr[i].title + "</td>";
						str += "<td class=move num="+arr[i].num+">" + arr[i].content + "</td></tr>";
					}
					$("#tbody").html(str);
					$(".move").click(function() {
						var num = $(this).attr("num");
						location.href = "${pageContext.request.contextPath}/mail/detail?num=" + num;
					});
				}
			});
		}
	};

	$(document).ready(function() {
		$("#write").click(function() {
			location.href = "${pageContext.request.contextPath }/mail/addForm";
		});
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/mail/listJson",
			success : function(data) {
				var arr = eval("(" + data + ")");
				var str = "";
				for (var i = 0; i < arr.length; i++) {
					str += "<tr><td num="+arr[i].num+"><input id="+arr[i].num+" type=checkbox name=checkthis style=width:20px;height:20px;margin:10px></td>";
					str += "<td class=move num="+arr[i].num+">" + arr[i].read + "</td>";
					str += "<td class=move num="+arr[i].num+">" + arr[i].sendEmail + "</td>";
					str += "<td class=move num="+arr[i].num+">" + arr[i].title + "</td>";
					str += "<td class=move num="+arr[i].num+">" + arr[i].content + "</td></tr>";
				}
				$("#tbody").html(str);
				$(".move").click(function() {
					var num = $(this).attr("num");
					location.href = "${pageContext.request.contextPath}/mail/detail?num=" + num;
				});
				$("#delete").click(function() {
					$('input:checkbox[name="checkthis"]').each(function() {
						if (this.checked) {//checked 처리된 항목의 값
							var num = $(this).attr("id");
							var param = "num=" + num;
							$.ajax({
								type : "POST",
								url : "${pageContext.request.contextPath }/mail/del",
								data : param,
								success : function(data) {
									var arr = eval("(" + data + ")");
									var str = "";
									for (var i = 0; i < arr.length; i++) {
										str += "<tr><td num="+arr[i].num+"><input id="+arr[i].num+" type=checkbox name=checkthis style=width:20px;height:20px;margin:10px></td>";
										str += "<td class=move num="+arr[i].num+">" + arr[i].read + "</td>";
										str += "<td class=move num="+arr[i].num+">" + arr[i].sendEmail + "</td>";
										str += "<td class=move num="+arr[i].num+">" + arr[i].title + "</td>";
										str += "<td class=move num="+arr[i].num+">" + arr[i].content + "</td></tr>";
									}
									$("#tbody").html(str);
								}
							});
						}
					});
				});
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
										<span> 쪽지함 </span>
									</h2>
								</div>
							</div>
						</div>
						<div class="m-portlet__body">
							<input type="button" id="write" class="btn btn-secondary" value="쪽지쓰기">
							<input type="button" id="delete" class="btn btn-secondary" value="쪽지삭제">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>-</th>
										<th>읽음</th>
										<th>보낸사람</th>
										<th>제목</th>
										<th>내용</th>
									</tr>
								</thead>
								<tbody id="tbody"></tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
