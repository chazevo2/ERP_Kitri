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
var flag=true;
$(document).ready(function(){
	$(".codeButton").click(function(){
		var value=$(this).attr("value");
		var num=$(this).attr("num");
		param="num="+num;
		$.a(param, value);
		if(value=="+"){
			$(this).attr("value", "-");
		}else{
			$(this).attr("value", "+");	
		}
		
	});

});

$.a=function(param,value){
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/member/listByDepartmentCode",
		data:param,
		success:function(data){
			var arr=eval("("+data+")");
			var arrNum;
			var str="<table border=1 style=text-align:center><tr>";
			str+="<td>-</td>";
			str+="<td>사진</td><td>사번</td><td>이름</td><td>휴대폰번호</td><td>이메일</td><td>주소</td><td>입사일</td><td>퇴사일</td><td>승인</td></tr>";
			for(var i=0; i<arr.length; i++){
				arrNum=arr[i].departmentCode;
				str+="<tr><td><input id="+arr[i].id+" type=checkbox class=checkthis style=width:20px;height:20px;margin:10px></td>";
				str+="<td><img src="+arr[i].picture+" style=width:30px;height:30px></td>";
				str+="<td><input type=text readonly style=border:none;text-align:center;width:80px value="+arr[i].id+"></td>";
				str+="<td><input type=text readonly style=border:none;text-align:center;width:80px value="+arr[i].name+"></td>";
				str+="<td><input type=text readonly style=border:none;text-align:center value="+arr[i].hp+"></td>";
				str+="<td><input type=text readonly style=border:none;text-align:center value="+arr[i].email+"></td>";
				str+="<td><input type=text readonly style=border:none;text-align:center value="+arr[i].address+"></td>";
				str+="<td><input type=text readonly style=border:none;text-align:center;width:100px value="+arr[i].hiredate+"></td>";
				str+="<td><input type=text readonly style=border:none;text-align:center;width:100px value="+arr[i].firedate+"></td>";
				str+="<td><input type=text readonly style=border:none;text-align:center;width:20px value="+arr[i].confirm+"></td></tr>";
			}
			str+="</table>";
				if(value=="+"){
					$("#"+arrNum).html(str);
				}else{
					$("#"+arrNum).html("");
				}
				$(".checkthis").click(function(){
					var id=$(this).attr("id");
					$("#approval").click(function(){
						location.href="${pageContext.request.contextPath}/member/editApproval?id="+id;
					});
					$("#delete").click(function(){
						location.href="${pageContext.request.contextPath}/member/delete?id="+id;
					});
				});
				
		}
	});
}
</script>
</head>
<body>
<h3>관리자페이지</h3>
 	<input type="button" id="approval" value="가입승인">
	<input type="button" id="delete" value="강제탈퇴"><br/><br/>              	   
    <c:forEach var="list" items="${list }">
	<div id="div1"><input type="button" value="+" class="codeButton" num="${list.num}" style="width:30px;height:30px"><input type="text" value="${list.name }" class="departmentCode" style="border:none;font-size:30px" readonly></div>
	<div id="${list.num}"></div>
    </c:forEach>   
</body>
</html>