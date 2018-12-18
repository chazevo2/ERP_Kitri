<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
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


.myButton2 {
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
	padding:6px 13px;
	text-decoration:none;
	text-shadow:0px 1px 0px #ffffff;
}
.myButton2:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f6f6f6), color-stop(1, #ffffff));
	background:-moz-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
	background:-webkit-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
	background:-o-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
	background:-ms-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
	background:linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f6f6f6', endColorstr='#ffffff',GradientType=0);
	background-color:#f6f6f6;
}
.myButton2:active {
	position:relative;
	top:1px;
}
</style>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/community/getList",
		success:function(data){
			var arr = eval('('+data+')');
			var str="";
			if(arr == null) {
				str += "<tr><td colspan='5'>��ϵ� �Խñ��� �����ϴ�.</td></tr>";
				str += "<tr><td colspan=5 align=right><input type=button id=add value=���></td></tr>";
			}else{
				for(i=0;i<arr.length;i++){
					str+="<tr class='select'><td>"+arr[i].num+"</td>";
					str+="<td>"+arr[i].title+"</td>";
					str+="<td>"+arr[i].writer+"</td>";
					str+="<td>"+arr[i].nop+"</td>";
					str+="<td>"+arr[i].w_date+"</td>";
					str+="<td>"+arr[i].clickcnt+"</td></tr>";
				}
			}
			$("#listTable").append(str);
			
			$(".select").on("click", function() {
		        var num = $(this).find("td").eq(0).html();
		       	location.href = "${pageContext.request.contextPath }/community/editForm?num="+num;
		    });
		}
		
	});
	
	$('#add').click(function(){
		location.href='${pageContext.request.contextPath }/community/gotoaddForm';
	});
	
	$('#search').click(function(){
		var title = $('input[name=title]').val();
		location.href = "${pageContext.request.contextPath }/community/selectByTitle?title="+title;
		$('input[name=title]').val("");
	});
			

});
</script>
 <div class="m-grid__item m-grid__item--fluid m-wrapper">
					<div class="m-content">
						<div class="row">
							<div class="col-lg-12">
								<div class="m-portlet m-portlet--creative m-portlet--first m-portlet--bordered-semi">
									<div class="m-portlet__head">
										<div class="m-portlet__head-caption">
											<div class="m-portlet__head-title">
												<span class="m-portlet__head-icon m--hide">
													
												</span>
												
												<h2 class="m-portlet__head-label m-portlet__head-label--info">
													<span>
														�系 ����
													</span>
												</h2>
											</div>
										</div>
										
									</div>
									<div class="m-portlet__body">
										<div class="container">
	
	<table class="table table-hover">
	<thead>
	<tr>
		<th>�� ��ȣ</th><th>����</th><th>�ۼ���</th><th>���� �ο�</th><th>�ۼ� ��¥</th><th>��ȸ ��</th>
	</tr>
	</thead>
	<tbody id="listTable">
	</tbody>
	</table>
	<div align="right">
	<a href="#" class="myButton" id="add">���</a>
	</div>
	<br>
	<div align="center">
      	<input type="text" name="title" style="width:50%; height:30px; border-radius:5px;" placeholder="�˻��� ������ �Է��Ͻÿ�.">
      	&nbsp;&nbsp;&nbsp;
      	<input type="button" id="search" class="myButton2" value="�˻�" >
    </div>
</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div> 