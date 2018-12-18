<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
ws.onmessage = function (event) {
	var email=event.data;
	var email1='${sessionScope.email}';
	if(email==email1){
		$.a();
	}
};

$(document).ready(function(){
	$("#write").click(function(){
		location.href="${pageContext.request.contextPath }/mail/addForm1";
	});
	$("#delete").click(function(){
		location.href="${pageContext.request.contextPath }/mail/addForm1";
	});
	$.a();
});
$.a=function(){
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/mail/listJson",
		success:function(data){
			var arr=eval("("+data+")");
			var str="";
			for(var i=0; i<arr.length; i++){
				str+="<tr><td><input id="+arr[i].num+" type=checkbox name=checkthis style=width:20px;height:20px;margin:10px></td>";
				str+="<td>"+arr[i].read+"</td>";
				str+="<td>"+arr[i].sendEmail+"</td>";
				str+="<td>"+arr[i].title+"</td>";
				str+="<td>"+arr[i].content+"</td></tr>";
			}
			 $("#tbody").html(str);
		}
	});
}
</script>
<style>
.myButton {
	-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ffffff), color-stop(1, #f6f6f6));
	background:-moz-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
	background:-webkit-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
	background:-o-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
	background:-ms-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
	background:linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#f6f6f6',GradientType=0);
	background-color:#ffffff;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #dcdcdc;
	display:inline-block;
	cursor:pointer;
	color:#666666;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:6px 24px;
	text-decoration:none;
	text-shadow:0px 1px 0px #ffffff;
}
.myButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f6f6f6), color-stop(1, #ffffff));
	background:-moz-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
	background:-webkit-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
	background:-o-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
	background:-ms-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
	background:linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f6f6f6', endColorstr='#ffffff',GradientType=0);
	background-color:#f6f6f6;
}
.myButton:active {
	position:relative;
	top:1px;
}
</style>
</head>
<body>
 <input type="button" id="write" class="myButton" value="메일쓰기">
 <input type="button" id="delete" class="myButton" value="메일삭제">
 <table class="table table-hover">
 <thead>
 <tr>
 <th>-</th>
 <th>읽음</th>
 <th>보낸사람</th>
 <th>제목</th>
 <th>내용</th>
 </tr>
 </thead>
 <tbody id="tbody"></tbody>
 </table>
</body>
</html>