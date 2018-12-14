<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript"></script>
</head>
<body>
<h3>관리자페이지</h3>
<table id="mytable" border="1" style="text-align:center">
    <tr>
    <td><input type="checkbox" id="checkall" /></td>
    <td>사번</td>
    <td>이름</td>
    <td>휴대폰번호</td>
    <td>Email</td>
    <td>주소</td>
    <td>부서코드</td>
    <td>사원코드</td>
    <td>입사일</td>
    <td>승인</td>
    <td>강제탈퇴</td>
    </tr>
    
    <tr>
    <c:forEach var="list" items="${list }">
    <td><input type="checkbox" class="checkthis"/></td>
	<td>${list.id }</td>
	<td>${list.name }</td>
	<td>${list.hp }</td>
	<td>${list.email }</td>
	<td>${list.address }</td>
	<td>${list.departmentCode }</td>
	<td>${list.gradeCode }</td>
	<td>${list.hiredate }</td>
    <td><p data-placement="top" data-toggle="tooltip" title="승인"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></p></td>
    <td><p data-placement="top" data-toggle="tooltip" title="강제탈퇴"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
    </c:forEach>
    </tr>   
</table>
</body>
</html>