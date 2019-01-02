<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		setTimeout("$.a()", 2500);
	});
	$.a = function() {
		history.go(-1);
	}
</script>
</head>
<body>
잘못된 접근입니다. 3초 후 이전 페이지로 이동합니다.
</body>
</html>