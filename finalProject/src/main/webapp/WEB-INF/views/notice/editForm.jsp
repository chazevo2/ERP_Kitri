<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>공지사항 수정폼</h3>
	<form action="${pageContext.request.contextPath }/notice/edit" method="post">
		<input type="hidden" name="num" value="${n.num }">
		<table border="1">
			<tr><th>작성자</th>
				<td>
					<input type="text" name="writer" value="${n.writer }" readonly>
				</td></tr>
			<tr><th>작성날짜</th>
				<td>
					<input type="text" name="w_date" value="${n.w_date }" readonly>
				</td></tr>
			<tr><th>제목</th>
				<td>
					<input type="text" name="title" value="${n.title }">
				</td></tr>
			<tr><th>내용</th>
				<td>
					<textarea name="content" id="content" cols="30" rows="10">${n.content }</textarea>
				</td></tr>
			<%-- <tr><th>이미지</th><td><img src="${n.path }" style="width:200px;height:200px"></td></tr> --%>
			<tr><td colspan="2">
					<input type="submit" value="수정">
				</td></tr>
		</table>
	</form>
</body>
</html>