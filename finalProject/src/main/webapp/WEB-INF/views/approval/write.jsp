<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<style>
input[type=text] {
	width: 100%;
}

.ex {
	width: 100%;
}
</style>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.js"></script>
<script>
	var $$ = jQuery.noConflict();
</script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	var $ = jQuery.noConflict();
	$(document).ready(function() {
		$.note = function() {
			$$("#content").summernote({
				tabsize : 2,
				height : 500,
				width : '100%',
				minHeight : null,
				maxHeight : null,
				focus : true,
				disableResizeEditor : true
			});
		}
		$.note();
		
		var newWin;
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath }/approval/docsList",
			success : function(data) {
				var list = eval("(" + data + ")");
				var str = "<table style='width: 100%;'><caption><h4>문서 양식</h4></caption><tr>";
				str += "<td colspan='4' align='right'><a href='${pageContext.request.contextPath }/approval/addDocument'>문서 양식 추가</a></td></tr>";
				str += "<tr><td colspan='4'><br/></td></tr>";
				if (list.length < 1) {
					str += "<tr><td colspan='4'>빈 목록입니다.</td></tr><tr>";
				} else {
					for (i = 0; i < list.length; i++) {
						str += "<td style='width: 25%;'><input type='button' class='ex' value='" + list[i].title + "' path='" + list[i].path + "'></td>";
						if ((i != 0 && (i + 1) % 4 == 0) || i == list.length - 1) {
							if (i > 0) {
								str += "<td colspan=" + (4 - (i + 1) % 4) + "></td>";
							}
							str += "</tr>";
						}
					}
				}
				str += "<tr><td colspan='4'><br/></td></tr>";
				str += "</table>";
				$("#docsList").html(str);

				$(".ex").on("click", function() {
					file = $(this).attr("path");
					$.get(file, function(data) {
						$$('#content').summernote("code", data);
					});
				});
			}
		});

		$("#write").click(function() {
			if ($("input[name=mid_id]").val() == "" && $("input[name=fnl_id]").val() == "") {
				$("input[name=apv_set_num]").val(4);
			}
			$$("#content").summernote("destroy");
			if ($("input[name=title]").val() == "" || $("#content").val() == "") {
				alert("문서 제목과 내용을 입력바랍니다.");
				$.note();
				return;
			}
			var r = confirm("정말 작성하시겠습니까?");
			if (r == true) {
				$("#apv").submit();
			} else {
				$.note();
				return;
			}
		});

		$(".apv_id").click(function() {
			if ($(this).attr("name") == "fnl_id") {
				if ($("input[name=mid_id]").val() == "") {
					alert("1차 승인자 먼저 선택바랍니다.");
					return;
				}
			}
			newWin = window.open('${pageContext.request.contextPath }/approval/getApvId', '결재선 지정', 'location=no, directories=no, resizable=no, status=no, toolbar=no, menubar=no, width=440, height=270, scrollbars=no, top=300, left=300');
			$("#selectedId").val($(this).attr("name"));
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
														결재문서작성
													</span>
												</h2>
											</div>
										</div>
										
									</div>
									<div class="m-portlet__body">
									<form id="apv" action="${pageContext.request.contextPath }/approval/write.do" method="post" enctype="multipart/form-data" accept-charset="utf-8">
										<div class="container">
											<table class="table" style="max-width: 900px;">
												<tr><td colspan="4" id="docsList"></td></tr>
												<tr><th style="text-align: center; height: 30px">문서명 :</th>
													<td>
														<input type="text" name="title" placeholder=" 제목을 작성해주세요.">
													</td>
													<td colspan="2" align="right">
														<input type="hidden" name="id" value="${sessionScope.id }">
														<input type="hidden" name="apv_set_num" value="1">
														<input type="button" id="write" value="문서 작성">
													</td></tr>
												<tr><th style="text-align: center; height: 30px">1차승인 :</th>
													<td>
														<input type="text" class="apv_id" name="mid_id" readonly>
													</td>
													<th style="text-align: center; height: 30px">2차승인 :</th>
													<td>
														<input type="text" class="apv_id" name="fnl_id" readonly>
													</td></tr>
												<tr><td colspan="4">
														<textArea id="content" name="content"></textArea>
													</td></tr>
											</table>
										</div>
									</form>
									<input type="hidden" id="selectedId">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div> 