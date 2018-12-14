<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link href="${pageContext.request.contextPath }/resources/css/login.css" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<title>로그인 화면</title>
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#submit").click(function(){
		var check=$("#remember").prop("checked");
		if(check){
			var param="id="+$("#id").val();
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/member/remember",
				data:param,
				success:function(data){
				}
			});
		}else{
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/member/rememberNo",
				data:param,
				success:function(data){
				}
			});
		}
	});
	$("#submit").click(function(){
		var pwd=$("#pwd").val();
		var flag=true;
		if(pwd==null||pwd==""){
			alert("패스워드를 입력하시오");
			flag=false;
		}
		if(flag){
			$("#submit").attr("type","submit");
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
        <c:if test="${not empty sessionScope.rememberImg}">
         <img id="profile-img" class="profile-img-card" src="${sessionScope.rememberImg}"/>
        </c:if>
        <c:if test="${empty sessionScope.rememberImg  }">
       		 <img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" />
        </c:if>
            <p id="profile-name" class="profile-name-card"></p>
            <form action="${pageContext.request.contextPath}/member/login" method="post">
                <span id="reauth-email" class="reauth-email"></span>
                  <c:if test="${not empty sessionScope.rememberId }">
       		 		<input type="text" id="id" name="id" class="form-control" placeholder="id" value="${sessionScope.rememberId}">
       			 </c:if>
                 <c:if test="${empty sessionScope.rememberId  }">
       		 		<input type="text" id="id" name="id" class="form-control" placeholder="id" >
       			 </c:if>
                <input type="password" id="pwd" name="pwd" class="form-control" placeholder="Password">
                <div class="checkbox">
                    <label>
                        <input type="checkbox" id="remember" value="remember-me"> Remember me
                    </label>
                </div>
                <input class="btn btn-lg btn-primary btn-block btn-signin" type="button" id="submit" value="로그인"></button>
            </form>
            <br/>
            <a href="${pageContext.request.contextPath}/member/searchIdForm" >search id</a> &nbsp;          &nbsp;
            <a href="${pageContext.request.contextPath}/member/searchPwdForm" >search password</a> &nbsp;          &nbsp;
            <a href="${pageContext.request.contextPath}/member/joinForm" >join</a><br/>
        </div><!-- /card-container -->
    </div><!-- /container -->
</body>
</html>