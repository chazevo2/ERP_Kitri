<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
#file {
	display: none;
}

input[type=text] {
	width: 100%;
}
</style>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.js"></script>
<script>
	var $$ = jQuery.noConflict();
</script>
<script>
	$(document).ready(function() {
		$.note = function() {
			$$("#content").summernote({
				tabsize : 2,
				height : 700,
				width : '100%',
				minHeight : null,
				maxHeight : null,
				focus : true
			});
		}
		$.note();

		$("#upload").click(function() {
			$("#file").click();
		});

		$("input[type=file]").change(function(evt) {
			var startByte = evt.target.getAttribute('data-startbyte');
			var endByte = evt.target.getAttribute('data-endbyte');
			readBlob(startByte, endByte);
		});

		$("#save").click(function() {
			$$("#content").summernote("destroy");
			if ($("input[name=title]").val() == "" || $("#content").val() == "") {
				alert("문서 제목과 내용을 입력바랍니다.");
				$.note();
				return;
			}
			var r = confirm("정말 저장하시겠습니까?");
			if (r == true) {
				$("#doc").submit();
			} else {
				$.note();
				return;
			}	
		});
	});

	function readBlob(opt_startByte, opt_stopByte) {
		var files = document.getElementById('file').files;
		if (files.length <= 0) {
			return;
		}
		var file = files[0];
		var start = parseInt(opt_startByte) || 0;
		var stop = parseInt(opt_stopByte) || file.size - 1;

		var reader = new FileReader();

		reader.onloadend = function(evt) {
			if (evt.target.readyState == FileReader.DONE) { // DONE == 2
				$$("#content").summernote("code", evt.target.result);
			}
		};

		var blob = file.slice(start, stop + 1);
		reader.readAsText(blob, "utf-8");
	}
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
														문서양식작성
													</span>
												</h2>
											</div>
										</div>
										
									</div>
									<div class="m-portlet__body">
										<form id="doc" action="${pageContext.request.contextPath }/approval/saveDocument" method="post" enctype="multipart/form-data" accept-charset="utf-8">
											<div class="container">
												<table class="table table-hover" style="max-width: 900px;">
													<tr><th style="text-align: center; height: 30px">파일명</th>
														<td>
															<input type="text" name="title">
														</td>
														<td>
															<input type="button" id="save" value="문서양식 저장">
														</td>
														<td align="right">
															<input type="file" id="file" accept="text/html" />
															<input type="button" id="upload" value="내 컴퓨터 파일 추가">
														</td></tr>
													<tr><th>문서내용</th>
														<td colspan="3">
															<textArea id="content" name="content"></textArea>
														</td></tr>
												</table>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div> 