<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/css/login.css" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	setTimeout("$.a()", 2500);
	});
$.a=function(){
	window.opener.location.href="${pageContext.request.contextPath }/member/home";
	window.close();
}
</script>
</head>
<body>
  <div class="container">
        <div class="card card-container">
                <input type="text" value="3초후 자동 페이지 이동" class="form-control" style="border:none;text-align:center;font-size:20px" readonly>
        </div><!-- /card-container -->
    </div><!-- /container -->
</body>
</html>