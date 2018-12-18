<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link href="${pageContext.request.contextPath }/resources/css/login.css" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<meta charset="EUC-KR">
<title>회원 정보 수정</title>
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#back").click(function(){
		window.close();
	});
	
	$("#hp").click(function(){
		$(this).val("");
	});
	
	$("#address").click(function(){
		$(this).val("");
	});
	
	var param="num="+'${m.gradeCode}';
	$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/gradeCode/get",
			data:param,
			success:function(data){
				var arr = eval('('+data+')');
				var str="직급: "+arr.name;
				$("#gradeCode1").html(str);
			}
	});
	
	var param="num="+'${m.departmentCode}';
	$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/departmentCode/getByNum",
			data:param,
			success:function(data){
				var arr = eval('('+data+')');
				var str="부서: "+arr.name;
				$("#departmentCode1").html(str);
			}
	});
});
</script>
</head>
<body>
  <div class="container">
        <div class="card card-container">
            <p id="profile-name" class="profile-name-card"></p>
            <form action="${pageContext.request.contextPath}/member/edit" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
                <span id="reauth-email" class="reauth-email"></span>
       		 	<div style="text-align:center;font-size:40px">회원정보수정</div>
       		 	 <img class="profile-img-card" src="${m.picture}"/>
                <input type="text" id="id" name="id" class="form-control" placeholder="비밀번호" value="${m.id}" readonly>
                <input type="password" name="pwd" class="form-control" placeholder="비밀번호" value="${m.pwd}">
                <input type="text" name="name" class="form-control" placeholder="이름" value="${m.name}" readonly>
                <input type="text" id="hp" name="hp" class="form-control" placeholder="전화번호" value="${m.hp}" >
                <input type="email" name="email" class="form-control" placeholder="메일주소" value="${m.email}" readonly>
                <input type="text" id="address" name="address" class="form-control" placeholder="주소" value="${m.address}" >
                <input type="file" name="file" class="form-control" placeholder="프로필사진">
                <div type="text" id="gradeCode1" class="form-control" value="" readonly></div>
                <div type="text" id="departmentCode1" class="form-control" value="" readonly></div>
                <input class="btn btn-lg btn-primary btn-block btn-signin" type="submit" id="submit" value="수정">
                <input class="btn btn-lg btn-primary btn-block btn-signin" type="button" id="back" value="뒤로가기">
            </form>
         </div>
    </div>
</body>
</html>