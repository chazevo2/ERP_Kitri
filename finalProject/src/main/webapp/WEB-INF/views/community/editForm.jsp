<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.js"></script>
<script>
	var $$ = jQuery.noConflict();
</script>
<script type="text/javascript">
	var $ = jQuery.noConflict();
	$(document).ready(function() {
		$.note = function() {
			$$("#summernote").summernote({
				tabsize : 2,
				height : 400,
				width : '100%',
				minHeight : null,
				maxHeight : null,
				focus : true,
				disableResizeEditor : true
			});
		}
		$.note();
		var people = $("#preAttandant").val();
		var peoples = people.split("/");
		var me = $("#newAttandant").val();
		var writer = $('#hiddenWriter').val();
		if (me != writer) {
			$$('#summernote').summernote('disable');
		}
		for (i = 0; i < peoples.length - 1; i++) {
			if (peoples[i] == me) {
				$("#editNOP").hide();
				$("#editNOP2").show();
			}
		}

		var contentStr = $('textarea[name="content"]').val();

		var convertedStr = contentStr.replace(/_$ta/g, "\r\n");

		$('textarea[name="content"]').val(convertedStr);

		var comm_num = $('#add').attr("num");
		var com_num = $('#editNOP').attr('num');
		var param = "com_num=" + com_num;
		var id = $('#writer').val();

		$('#back').click(function() {
			history.go(-1);
		});

		$('#del').click(function() {
			location.href = '${pageContext.request.contextPath}/community/delete?num=' + $('#num1').val();
		});
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/community_article/getlist",
			data : param,
			success : function(data) {
				var arr = eval('(' + data + ')');
				var str = "";
				if (arr == null) {
					str += "_$ta_$tag_________등록된 댓글이 없습니다._$tag_$tag";
				} else {
					str += "<table style='width:100%;' class=table table-hover>";
					for (i = 0; i < arr.length; i++) {
						if (id == arr[i].writer) {
							str += "_$ta<td style='width:15%;'>" + arr[i].writer + "_$tag_$ta" + arr[i].content;
							str += "_$tag____________________________________________________________$tag";
							str += "_$ta_$tag________________________________________________________________________________$tag_$tag";
						} else {
							str += "_$ta<td style='width:15%;'>" + arr[i].writer + "_$tag_$ta" + arr[i].content + "_$tag_$ta_$tag_$tag";
						}

					}
					str += "_$tag___";
				}
				$("#repDiv").html(str);

				$.del(comm_num, id);
			}

		});

		$('#add').click(function() {
			var comm_num = $(this).attr("num");
			var writer = $('#writer').val();
			var content = $('#content').val();
			param = "comm_num=" + comm_num + "&writer=" + writer + "&content=" + content;
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/community_article/add",
				data : param,
				success : function(data) {
					var arr = eval('(' + data + ')');
					var str = "";
					str += "<table style='width:100%;' class=table table-hover>";
					for (i = 0; i < arr.length; i++) {
						if (id == arr[i].writer) {
							str += "_$ta<td style='width:15%;'>" + arr[i].writer + "_$tag_$ta" + arr[i].content;
							str += "_$tag____________________________________________________________$tag"
							str += "_$ta_$tag________________________________________________________________________________$tag_$tag";
						} else {
							str += "_$ta<td style='width:15%;'>" + arr[i].writer + "_$tag_$ta" + arr[i].content + "_$tag_$ta_$tag_$tag";
						}
					}
					str += "_$tag___";
					$('#repDiv').html(str);

					$.del(comm_num, id);
				}
			});
			$('#content').val("");
		});

		$('#editNOP').click(function() {
			var num = $(this).attr('num');
			var preattandant = $('#preAttandant').val();
			var newattandant = $('#newAttandant').val();
			var param = "num=" + num;
			var nop = $('#nop').val();
			var maxnop = $('#maxnop').val();
			if (nop >= maxnop) {
				alert('정원 초과입니다.');
				return;
			} else {
				$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/community/editNOP",
					data : param,
					success : function(data) {
						var c = eval('(' + data + ')');
						$('#nop').val(c.nop);
						var attandant = "";
						if (preattandant == "") {
							attandant = newattandant + "/";
						} else {
							attandant = preattandant + newattandant + "/";
						}
						var param2 = "num=" + num + "&attandant=" + attandant;
						$.ajax({
							type : "POST",
							url : "${pageContext.request.contextPath}/community/addAttandant",
							data : param2,
							success : function(data) {
								alert('참가가 완료되었습니다.');
							}
						});
					}
				});

				$('#editNOP').hide();
				$('#editNOP2').show();

			}
		});

		$('#editNOP2').click(function() {
			var num = $(this).attr('num');
			var param = "num=" + num;
			var nop = $('#nop').val();
			var maxnop = $('#maxnop').val();
			var preattandant = $('#preAttandant').val().split("/");
			var newattandant = $('#newAttandant').val();
			var attandantlist = "";
			for (i = 0; i < preattandant.length - 1; i++) {
				if (preattandant[i] != newattandant) {
					attandantlist += preattandant[i] + "/";
				}
			}
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/community/editNOP2",
				data : param,
				success : function(data) {
					var c = eval('(' + data + ')');
					$('#nop').val(c.nop);
					$.ajax({
						type : "POST",
						url : "${pageContext.request.contextPath}/community/addAttandant",
						data : "num=" + num + "&attandant=" + attandantlist,
						success : function(data) {
							alert('참가 취소가 완료되었습니다.');
						}
					});
				}
			});
			$('#editNOP').show();
			$('#editNOP2').hide();

		});

		$.del = function(comm_num, id) {
			$('.delRep').on("click", function() {
				param = "num=" + $(this).attr("num") + "&comm_num=" + comm_num;
				$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/community_article/delete",
					data : param,
					success : function(data) {
						var arr = eval('(' + data + ')');
						var str = "";
						str += "<table style='width:100%;' class=table table-hover>";
						for (i = 0; i < arr.length; i++) {
							if (id == arr[i].writer) {
								str += "_$ta<td style='width:15%;'>" + arr[i].writer + "_$tag_$ta" + arr[i].content;
								str += "_$tag_____________________________________________________________$tag"
								str += "_$ta_$tag________________________________________________________________________________$tag_$tag";
							} else {
								str += "_$ta<td style='width:15%;'>" + arr[i].writer + "_$tag_$ta" + arr[i].content + "_$tag_$ta_$tag_$tag";
							}
						}
						str += "_$tag___";
						$('#repDiv').html(str);

						$.del(comm_num, id);
					}
				});
			});
		}

		$.replaceAll = function(contentStr, searchStr, replaceStr) {
			return contentStr.split(searchStr).join(replaceStr);
		}
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
								<span class="m-portlet__head-icon m--hide"> </span>
								<h2 class="m-portlet__head-label m-portlet__head-label--info">
									<span> 사내 모임 </span>
								</h2>
							</div>
						</div>
					</div>
					<div class="m-portlet__body">
						<form action="${pageContext.request.contextPath}/community/edit" method="post" accept-charset="UTF-8">
							<input type="hidden" id="num1" value="${c.num }">
							<div class="container">
								<h2></h2>
								<table id="listTable" class="table table-hover" style="max-width: 1000px;">
									<tr>
										<th style="text-align: center;">글 번호</th>
										<td style="text-align: center;">${c.num }<input type="hidden" name="num" value="${c.num }">
										</td>
										<th style="text-align: center;">제목</th>
										<td style="text-align: center;">
											<c:choose>
												<c:when test="${sessionScope.id eq c.writer}">
													<input type="text" name="title" value="${c.title }" style="width: 50%; border-radius: 3px; text-align: center;">
												</c:when>
												<c:otherwise>
													<input type="text" name="title" value="${c.title }" style="width: 50%; border-radius: 3px; text-align: center;" readonly>
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
									<tr>
										<th style="text-align: center;">작성자</th>
										<td style="text-align: center;">${c.writer }
											<input type="hidden" id="hiddenWriter" value="${c.writer }">
										</td>
										<th style="text-align: center;">작성날짜</th>
										<td style="text-align: center;">${c.w_date }</td>
									</tr>
									<tr>
										<th style="text-align: center; height: 70%;">내용</th>
										<td colspan="3">
											<textarea name="content" id="summernote">${c.content }</textarea>
										</td>
									</tr>
									<tr>
										<th style="text-align: center;">참가 인원</th>
										<td colspan="3">
											<input type="text" id="nop" value="${c.nop }" readonly style="text-align: right; border: none;">
											/
											<input type="text" id="maxnop" value="${c.maxnop }" readonly style="text-align: left; border: none;">
											<input type="button" class="btn btn-secondary" id="editNOP" value="참가" num="${c.num }">
											<input type="button" class="btn btn-secondary" id="editNOP2" value="참가 취소" num="${c.num }" style="display: none">
											<input type="hidden" id="preAttandant" value="${c.attandant }">
											<input type="hidden" id="newAttandant" value="${sessionScope.id }">
										</td>
									</tr>
									<tr>
										<th style="text-align: center; height: 10%;">댓글</th>
										<td colspan="3" style="text-align: center;">
											<div>
												<input type="text" id="content" placeholder=" 댓글을 작성해주세요." style="border-radius: 3px; width: 80%; height: 49px;">
												&nbsp;
												<input type="hidden" id="writer" value="${sessionScope.id }">
												<input type="button" class="btn btn-secondary" id="add" value="작성" num="${c.num }">
											</div>
										</td>
									</tr>
									<tr>
										<th style="text-align: center;">댓글 목록</th>
										<td colspan="3">
											<div id="repDiv" style="text-align: center;"></div>
										</td>
									</tr>
									<tr>
										<c:choose>
											<c:when test="${sessionScope.id eq c.writer}">
												<td colspan="5" style="text-align: right;">
													<input type="button" class="btn btn-secondary" id="back" value="뒤로">
													<input type="submit" class="btn btn-secondary" value="수정">
													<input type="button" class="btn btn-secondary" id="del" value="삭제">
												</td>
											</c:when>
											<c:otherwise>
												<td colspan="5" style="text-align: right;">
													<input type="button" class="btn btn-secondary" id="back" value="뒤로">
												</td>
											</c:otherwise>
										</c:choose>
									</tr>
								</table>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
