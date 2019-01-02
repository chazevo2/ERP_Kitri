<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link href="${pageContext.request.contextPath }/resources/css/login.css" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<meta charset="EUC-KR">
<title>ȸ������</title>
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	var check = false;
	$(document).ready(function() {
		$("#back").click(function() {
			history.go(-1);
		});
		$("#check").click(function() {
			$("#check").attr("style", "background-color:gray")
			check = true;
			var email = $("#email").val();
			var hp = $("#hp").val();
			var param = "email=" + email;
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/member/doubleEmail",
				data : param,
				success : function(data) {
					var arr = eval("(" + data + ")");
					if (arr.email == 1) {
						alert("�̸��� ��� ����");
						$("#check").attr("style", "")
					} else if (arr.email != 1 || arr.email == "") {
						alert("�ߺ��� email�� �ٽ��Է��ϼ���");
						$("#email").val("");
						$("#check").attr("style", "")
					}
				}
			});

			var param = "hp=" + hp;
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/member/doubleHp",
				data : param,
				success : function(data) {
					var arr = eval("(" + data + ")");
					if (arr.hp == 1) {
						alert("��ȭ��ȣ ��� ����");
						$("#check").attr("style", "")
					} else if (arr.hp != 1 || arr.hp == "") {
						alert("�ߺ��� hp�� �ٽ��Է��ϼ���");
						$("#hp").val("");
						$("#check").attr("style", "")
					}
				}
			});
		});

		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/gradeCode/list",
			success : function(data) {
				var arr = eval('(' + data + ')');
				var str = "";
				str += "<select id=gradeCode name=gradeCode style=width:250px;height:25px>";
				str += "<option value=0 >����</option>";
				for (i = 0; i < arr.length; i++) {
					str += "<option value="+arr[i].num+">" + arr[i].name + "</option>";
				}
				str += "</select>";
				$("#select2").html(str);
			}
		});

		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/departmentCode/list",
			success : function(data) {
				var arr = eval('(' + data + ')');
				var str = "";
				str += "<select id=departmentCode name=departmentCode style=width:250px;height:25px>";
				str += "<option value=0>�μ�</option>";
				for (i = 0; i < arr.length; i++) {
					str += "<option value="+arr[i].num+">" + arr[i].name + "</option>";
				}
				str += "</select>";
				$("#select1").html(str);
			}
		});

		$("#submit").click(function() {
			var pwd = $("#pwd").val();
			var name = $("#name").val();
			var hp = $("#hp").val();
			var email = $("#email").val();
			var address = $("#address").val();
			var file = $("#file").val();
			var departmentCode = $("#departmentCode").val();
			var gradeCode = $("#gradeCode").val();
			var cnt = 0;
			cnt == 0;

			if (pwd == null || pwd == "") {
				alert("�н����带 Ȯ���Ͻÿ�.");
				cnt++;
			}
			if (name == null || name == "") {
				alert("�̸��� Ȯ���Ͻÿ�.");
				cnt++;
			}
			if (hp == null || hp == "") {
				alert("��ȭ��ȣ�� Ȯ���Ͻÿ�.");
				cnt++;
			}
			if (email == null || email == "") {
				alert("�̸����� Ȯ���Ͻÿ�.");
				cnt++;
			}
			if (address == null || address == "") {
				alert("�ּҸ� Ȯ���Ͻÿ�.");
				cnt++;
			}
			if (file == null || file == "") {
				alert("������ Ȯ���Ͻÿ�.");
				cnt++;
			}
			if (departmentCode == 0) {
				alert("�μ����� Ȯ���Ͻÿ�.");
				cnt++;
			}
			if (gradeCode == 0) {
				alert("�����ڵ带 Ȯ���Ͻÿ�.");
				cnt++;
			}
			if (check == false) {
				alert("�ߺ�Ȯ���Ͻÿ�.");
				cnt++;
			}
			if (cnt == 0) {
				check = false;
				$("#submit").attr("type", "submit");
			}
		});
	});
</script>
</head>
<body>
	<div class="container">
		<div class="card card-container">
			<p id="profile-name" class="profile-name-card"></p>
			<form action="${pageContext.request.contextPath}/member/join" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
				<span id="reauth-email" class="reauth-email"></span>
				<div style="text-align: center; font-size: 40px">ȸ������</div>
				<input type="password" id="pwd" name="pwd" class="form-control" placeholder="��й�ȣ">
				<input type="text" id="name" name="name" class="form-control" placeholder="�̸�">
				<input type="text" id="hp" name="hp" class="form-control" placeholder="��ȭ��ȣ">
				<input type="text" id="email" name="email" class="form-control" placeholder="�����ּ�">
				<input type="button" id="check" class="form-control" placeholder="�����ּ�" value="�ߺ�Ȯ��" style="">
				<input type="text" id="address" name="address" class="form-control" placeholder="�ּ�">
				<input type="file" id="file" name="file" class="form-control" placeholder="�����ʻ���">
				<div id="select1" class="form-control"></div>
				<div class="form-control" id="select2"></div>
				<input class="btn btn-lg btn-primary btn-block btn-signin" type="button" id="submit" value="����">
				<input class="btn btn-lg btn-primary btn-block btn-signin" type="button" id="back" value="�ڷΰ���">
			</form>
		</div>
	</div>
</body>
</html>