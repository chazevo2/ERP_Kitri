<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$.makeList = function(parent) {
		var param = "parent="
		1;
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/surveyA/respond1",
			success : function(data) {
				var arr = eval('(' + data + ')');
				var str = "";
				for (i = 0; i < arr.length; i++) {
					str += arr[list].question + "<br/>";
					str += arr[list].mtext + "<br/>";
				}
				$("#test" + parent).html(str);
			}
		});
	});
</script>
</head>
<body>
	<div id="test"></div>
</body>
</html>