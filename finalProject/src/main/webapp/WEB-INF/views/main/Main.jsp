<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<style>
#div_1, #div_2, #div_3, #div_4 {
	height: 400px;
	max-height: 400px;
	overflow: auto;
}

#div1 table, #div2 table, #div3 table, #div4 table {
	
}
</style>
<script type="text/javascript">
	ws.onmessage = function(event) {
		var email = event.data;
		var email1 = '${sessionScope.email}';
		if (email == email1) {
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/mail/listJson",
				success : function(data) {
					var arr = eval("(" + data + ")");
					var str = "";
					for (var i = 0; i < arr.length; i++) {
						str += "<tr><td>" + arr[i].read + "</td>";
						str += "<td>" + arr[i].sendEmail + "</td>";
						str += "<td>" + arr[i].title + "</td>";
						str += "<td>" + arr[i].content + "</td></tr>";
					}
					$("#table1").html(str);
				}
			});
		}
	};
	$(document).ready(function() {
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/mail/listJson",
			success : function(data) {
				var arr = eval("(" + data + ")");
				var str = "";
				for (var i = 0; i < arr.length; i++) {
					str += "<tr><td>" + arr[i].read + "</td>";
					str += "<td>" + arr[i].sendEmail + "</td>";
					str += "<td>" + arr[i].title + "</td>";
					str += "<td>" + arr[i].content + "</td></tr>";
				}
				$("#table1").html(str);
			}
		});

		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/approval/apvList",
			success : function(data) {
				var arr = eval("(" + data + ")");
				var str = "";
				for (var i = 0; i < arr.length; i++) {
					str += "<tr><td>" + arr[i].title + "</td>";
					str += "<td>" + arr[i].id + "</td>";
					str += "<td>" + arr[i].apv_date + "</td></tr>";
				}
				$("#table2").html(str);
			}
		});

		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/notice/list1",
			success : function(data) {
				var arr = eval('(' + data + ')');
				var str = "";
				if (arr == null) {
					str += "<tr><td colspan='5'>등록된 게시글이 없습니다.</td></tr>";
					str += "<tr><td colspan=5 align=right><input type=button id=add value=등록></td></tr>";
				} else {
					for (i = 0; i < arr.length; i++) {
						str += "<tr class='select'><td>" + arr[i].num + "</td>";
						str += "<td>" + arr[i].title + "</td>";
						str += "<td>" + arr[i].writer + "</td>";
						str += "<td>" + arr[i].w_date + "</td>";
					}
				}
				$("#table3").html(str);
			}
		});

		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/community/getList",
			success : function(data) {
				var arr = eval('(' + data + ')');
				var str = "";
				if (arr == null) {
					str += "<tr><td colspan='5'>등록된 게시글이 없습니다.</td></tr>";
					str += "<tr><td colspan=5 align=right><input type=button id=add value=등록></td></tr>";
				} else {
					for (i = 0; i < arr.length; i++) {
						str += "<tr class='select'><td>" + arr[i].num + "</td>";
						str += "<td>" + arr[i].title + "</td>";
						str += "<td>" + arr[i].writer + "</td>";
						str += "<td>" + arr[i].nop + "</td>";
						str += "<td>" + arr[i].w_date + "</td>";
						str += "<td>" + arr[i].clickcnt + "</td></tr>";
					}
				}
				$("#table4").html(str);
			}
		});
		$("#div1").click(function() {
			location.href = "${pageContext.request.contextPath }/mailList/list";
		});
		$("#div2").click(function() {
			location.href = "${pageContext.request.contextPath }/approval/approve";
		});
		$("#div3").click(function() {
			location.href = "${pageContext.request.contextPath }/notice/list";
		});
		$("#div4").click(function() {
			location.href = "${pageContext.request.contextPath }/community/list";
		});
	});
</script>
<div class="m-content">
	<div class="row">
		<div class="col-xl-6">
			<!--begin::Portlet-->
			<div class="m-portlet m-portlet--creative m-portlet--first m-portlet--bordered-semi" id="div1">
				<div class="m-portlet__head">
					<div class="m-portlet__head-caption">
						<div class="m-portlet__head-title">
							<span class="m-portlet__head-icon m--hide"> <i class="flaticon-statistics"></i>
							</span>
							<h2 class="m-portlet__head-label m-portlet__head-label--danger">
								<span> 쪽지함 </span>
							</h2>
						</div>
					</div>
				</div>
				<div class="m-portlet__body" id="div_1">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>읽음</th>
								<th>보낸사람</th>
								<th>제목</th>
								<th>내용</th>
							</tr>
						</thead>
						<tbody id="table1">
						</tbody>
					</table>
				</div>
			</div>
			<!--end::Portlet-->
			<!--begin::Portlet-->
			<!--end::Portlet-->
			<!--begin::Portlet-->
			<div class="m-portlet m-portlet--creative m-portlet--bordered-semi" id="div2">
				<div class="m-portlet__head">
					<div class="m-portlet__head-caption">
						<div class="m-portlet__head-title">
							<span class="m-portlet__head-icon"> </span>
							<h2 class="m-portlet__head-label m-portlet__head-label--accent">
								<span> 결재문서함 </span>
							</h2>
						</div>
					</div>
					<div class="m-portlet__head-tools">
						<ul class="m-portlet__nav">
							<li class="m-portlet__nav-item"><a href="" class="m-portlet__nav-link m-portlet__nav-link--icon"> </a></li>
						</ul>
					</div>
				</div>
				<div class="m-portlet__body" id="div_2">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>제목</th>
								<th>기안자</th>
								<th>기안일</th>
							</tr>
						</thead>
						<tbody id="table2">
						</tbody>
					</table>
				</div>
			</div>
			<!--end::Portlet-->
		</div>
		<div class="col-xl-6">
			<!--begin::Portlet-->
			<div class="m-portlet m-portlet--creative m-portlet--first m-portlet--bordered-semi" id="div3">
				<div class="m-portlet__head">
					<div class="m-portlet__head-caption">
						<div class="m-portlet__head-title">
							<span class="m-portlet__head-icon m--hide"> <i class="flaticon-statistics"></i>
							</span>
							<h2 class="m-portlet__head-label m-portlet__head-label--info">
								<span> 사내공지 </span>
							</h2>
						</div>
					</div>
				</div>
				<div class="m-portlet__body" id="div_3">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>글 번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody id="table3">
						</tbody>
					</table>
				</div>
			</div>
			<!--end::Portlet-->
			<!--begin::Portlet-->
			<div class="m-portlet m-portlet--creative m-portlet--bordered-semi" id="div4">
				<div class="m-portlet__head">
					<div class="m-portlet__head-caption">
						<div class="m-portlet__head-title">
							<span class="m-portlet__head-icon"> </span>
							<h2 class="m-portlet__head-label m-portlet__head-label--success">
								<span> 사내모임 </span>
							</h2>
						</div>
					</div>
					<div class="m-portlet__head-tools">
						<ul class="m-portlet__nav">
							<li class="m-portlet__nav-item"><a href="" class="m-portlet__nav-link m-portlet__nav-link--icon"> </a></li>
						</ul>
					</div>
				</div>
				<div class="m-portlet__body" id="div_4">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>글 번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>참가 인원</th>
								<th>작성일</th>
								<th>조회 수</th>
							</tr>
						</thead>
						<tbody id="table4">
						</tbody>
					</table>
				</div>
			</div>
			<!--end::Portlet-->
		</div>
	</div>
</div>