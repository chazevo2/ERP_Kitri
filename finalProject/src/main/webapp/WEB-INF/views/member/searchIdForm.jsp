<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link href="${pageContext.request.contextPath }/resources/css/login.css" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<title>���̵� ã��</title>
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#back").click(function() {
			history.go(-1);
		});
		$("#submit").click(function() {
			var name = $("#name").val();
			var email = $("#email").val();
			var cnt = 0;
			cnt == 0;
			if (name == null || name == "") {
				alert("�̸��� Ȯ�����ּ���");
				cnt++;
			}
			if (email == null || email == "") {
				alert("�̸����ּҸ� Ȯ�����ּ���");
				cnt++;
			}
			if (cnt == 0) {
				var param = "name=" + name + "&email=" + email;
				var flag = false;
				$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/member/searchId",
					data : param,
					success : function(data) {
						alert(data);
						var arr = eval("(" + data + ")");
						if (arr.id != 1) {
							flag = confirm("id=" + arr.id);
							if (flag) {
								history.go(-1);
							}
						} else {
							alert("ã�� ������ �����ϴ�.");
						}
					}
				});
			}
		});
	});
</script>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<div class="container">
		<div class="card card-container">
			<span id="reauth-email" class="reauth-email"></span>
			<input type="text" value="���̵� ã��" class="form-control" placeholder="id" style="border: none; text-align: center" readonly>
			<input type="text" id="name" name="name" class="form-control" placeholder="name">
			<input type="text" id="email" name="email" class="form-control" placeholder="email">
			<input class="btn btn-lg btn-primary btn-block btn-signin" type="button" id="submit" value="���̵�ã��">
			</button>
			<input class="btn btn-lg btn-primary btn-block btn-signin" type="button" id="back" value="�ڷΰ���">
			</button>
		</div>
		<!-- /card-container -->
	</div>
	<!-- /container -->
</body>
</html>