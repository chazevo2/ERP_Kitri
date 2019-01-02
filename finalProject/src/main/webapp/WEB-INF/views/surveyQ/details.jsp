<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ERP SURVEY</title>
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<h3>설문조사</h3>
	<c:forEach var="s" items="${list }">
		<h4>${s.title }</h4>
	</c:forEach>
	<c:forEach var="q" items="${list }">
		<table>
			<c:if test="${s.surveyid }">
				<tr><th>${q.qnum }.${q.qtext }</th></tr>
			</c:if>
		</table>
	</c:forEach>
</body>
</html>