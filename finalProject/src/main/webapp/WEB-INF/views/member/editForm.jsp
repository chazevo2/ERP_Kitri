<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link href="${pageContext.request.contextPath }/resources/css/login.css" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<meta charset="EUC-KR">
<title>ȸ������</title>
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#back").click(function(){
		history.go(-1);
	});
	
	$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/gradeCode/list",
			success:function(data){
				var arr = eval('('+data+')');
				var str="";	
				str+="<select name=gradeCode style=width:250px;height:25px>";
				str+="<option value=0 >����</option>";
				for(i=0;i<arr.length;i++){
					str+="<option value="+arr[i].num+">"+arr[i].name+"</option>";
				}
				str+="</select>";
				$("#select2").html(str);
			}
	});
	
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/departmentCode/list",
		success:function(data){
			var arr = eval('('+data+')');
			var str="";
			str+="<select name=departmentCode style=width:250px;height:25px>";
			str+="<option value=0>�μ�</option>";
			for(i=0;i<arr.length;i++){
				str+="<option value="+arr[i].num+">"+arr[i].name+"</option>";
			}
			str+="</select>";
			$("#select1").html(str);
		}
});
});
</script>
</head>
<body>
  <div class="container">
        <div class="card card-container">
            <p id="profile-name" class="profile-name-card"></p>
            <form action="${pageContext.request.contextPath}/member/join" method="post">
                <span id="reauth-email" class="reauth-email"></span>
       		 	<div style="text-align:center;font-size:40px">ȸ������</div>
                <input type="password" name="pwd" class="form-control" placeholder="��й�ȣ">
                <input type="text" name="name" class="form-control" placeholder="�̸�">
                <input type="text" name="hp" class="form-control" placeholder="��ȭ��ȣ">
                <input type="email" name="email" class="form-control" placeholder="�����ּ�">
                <input type="text" name="address" class="form-control" placeholder="�ּ�">
                <input type="text" name="picture" class="form-control" placeholder="�����ʻ���">
                <div id="select1" class="form-control"></div>
                <div class="form-control" id="select2"></div>
                <input class="btn btn-lg btn-primary btn-block btn-signin" type="submit" id="submit">
                <input class="btn btn-lg btn-primary btn-block btn-signin" type="button" id="back" value="�ڷΰ���">
            </form>
         </div>
    </div>
<!-- enctype= multipart/form-data -->

</body>
</html>