<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자페이지</title>
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$.each($(".departmentCode"), function(){
		var num=$(this).attr("code");
		param="num="+num;
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/departmentCode/getByNum",
			data:param,
			success:function(data){
				alert(data);
				var arr=eval("("+data+")");
				var str="";
				for(var i=0; i<arr.length; i++){
					str=arr[i].name;
				}
				$(this).attr("value", str);
			}
		});
	});
});
</script>
</head>
<body>
<h3>관리자페이지</h3>
 	<input type="button" id="approval" value="가입승인">
	<input type="button" id="del" value="강제탈퇴">              	
 <table id="mytable" border="1" style="text-align:center">
    <tr>
    <td><input type="checkbox" id="checkall" style="width:20px;height:20px;margin:10px"/></td>
    <td>사번</td>
    <td>이름</td>
    <td>휴대폰번호</td>
    <td>Email</td>
    <td>주소</td>
    <td>부서코드</td>
    <td>사원코드</td>
    <td>입사일</td>
    </tr>
    
    
    <c:forEach var="list" items="${list }">
    <tr>
    <td><input type="checkbox" class="checkthis" style="width:20px;height:20px;margin:10px"/></td>
	<td>${list.id }</td>
	<td>${list.name }</td>
	<td>${list.hp }</td>
	<td>${list.email }</td>
	<td>${list.address }</td>
	<td>${list.departmentCode }</td>
	<td>${list.gradeCode }</td>
	<td>${list.hiredate }</td>
	</tr> 
    </c:forEach>   
</table>
<c:forEach var="list" items="${list}">
<div id="div1"><input type="button" value="+"><input type="text" value="" class="departmentCode" code="${list.departmentCode}" style="border:none"></div>
<div id="div2"></div>
</c:forEach>
</body>
</html>