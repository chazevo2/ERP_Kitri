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
<h3>������������</h3>
<table id="mytable" border="1" style="text-align:center">
    <tr>
    <td><input type="checkbox" id="checkall" /></td>
    <td>���</td>
    <td>�̸�</td>
    <td>�޴�����ȣ</td>
    <td>Email</td>
    <td>�ּ�</td>
    <td>�μ��ڵ�</td>
    <td>����ڵ�</td>
    <td>�Ի���</td>
    <td>����</td>
    <td>����Ż��</td>
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
    <td><p data-placement="top" data-toggle="tooltip" title="����"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></p></td>
    <td><p data-placement="top" data-toggle="tooltip" title="����Ż��"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
    </c:forEach>
    </tr>   
</table>
</body>
</html>