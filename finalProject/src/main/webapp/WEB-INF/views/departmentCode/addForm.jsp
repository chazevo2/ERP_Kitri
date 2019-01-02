<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/css/login.css" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$.a();
		$("#add").click(function() {
			var name = $("#name").val();
			if (name == "" || name == null) {
				alert("추가할 부서를 입력하세요");
			} else {
				$("#f").attr("action", "${pageContext.request.contextPath}/departmentCode/add");
				$("#f").submit();
				$.a();
			}

		});

		$("#edit").click(function() {
			var num = $("#departmentCode").val();
			if (num == 0) {
				alert("수정할 부서명을 고르세요.");
			} else {
				var name = $("#name").val();
				if (name != "" && name != null) {
					var param = "num=" + num;
					param += "&name=" + name;
					$.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/departmentCode/edit",
						data : param,
						success : function() {
							$.a();
						}
					});
					$("#name").val("");
				} else {
					alert("수정할 부서명을 입력하세요.");
				}
			}
		});

		$("#back").click(function() {
			$.b();
		});
	});
	$.a = function() {
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/departmentCode/list",
			success : function(data) {
				var arr = eval('(' + data + ')');
				var str = "";
				str += "<select id=departmentCode style=width:250px;height:25px>";
				str += "<option value=0>부서</option>";
				for (i = 0; i < arr.length; i++) {
					str += "<option value="+arr[i].num+">부서 코드:" + arr[i].num + " / 부서명:" + arr[i].name + "</option>";
				}
				str += "</select>";
				$("#select1").html(str);
			}
		});
	}
	$.b = function() {
		window.close();
		window.opener.location.href = "${pageContext.request.contextPath }/departmentCode/adminForm";
	}
</script>
</head>
<body>
	<div class="container">
		<div class="card card-container">
			<p id="profile-name" class="profile-name-card"></p>
			<form id="f" action="" method="post" accept-charset="UTF-8">
				<div style="text-align: center; font-size: 40px">부서 추가</div>
				<div id="select1" class="form-control"></div>
				<input type="text" id="name" name="name" class="form-control" placeholder="추가/수정 부서이름">
				<input class="btn btn-lg btn-primary btn-block btn-signin" type="button" id="add" value="추가">
				<input class="btn btn-lg btn-primary btn-block btn-signin" type="button" id="edit" value="수정">
				<input class="btn btn-lg btn-primary btn-block btn-signin" type="button" id="back" value="적용 및 페이지 이동">
			</form>
		</div>
	</div>
</body>
</html>