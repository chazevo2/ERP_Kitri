<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
table {
	width: 100%;
}

th {
	width: 10%;
}

td {
	width: 90%;
}
</style>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.js"></script>
<script>
	var $$ = jQuery.noConflict();
</script>
<script type="text/javascript">
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

		$('#back').click(function() {
			history.go(-1);
			/* location.href="${pageContext.request.contextPath }/notice/list1"; */

		});
		$('.del').click(function() {
			var num = $(this).attr("num");
			location.href = "${pageContext.request.contextPath }/notice/del?num=" + num;
		});
		$('.rep_n').click(function() {
			/* location.href="${pageContext.request.contextPath }/notice_rep/del?num="+rnum+"&bNum="+${n.num }; */
			var rnum = $(this).attr("rnum");
			var param = "rnum=" + rnum;

			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath }/notice_rep/del",
				data : param,
				success : function() {
				}
			});
			location.href = "${pageContext.request.contextPath }/notice/detail?num=" + $
			{
				n.num
			}
			;
		});
	});

	$(document).ready(function() {
		$.note();
		$.each($('#div'), function() {
			var n_num = $(this).attr("id").split('_')[1];
			alert(n_num);
			var param = "n_num=" + n_num;
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath }/notice_rep/list",
				data : param,
				success : function(data) {
					var arr = eval('(' + data + ')');
					var str = "";
					var notice_rep;
					for (i = 0; i < arr.length; i++) {
						notice_rep = arr[i];
						str += "<table class='table table-hover' style='width:100%'>";
						str += "<tr>";
						str += "<input type='hidden' class='r_writer' value='${nr.writer }'/>";
						str += "<td style='width:15%'>" + notice_rep.writer + "</td>";
						str += "<td style='width:80%'>" + notice_rep.content + "</td>";
						str += "<td style='width:5%'><input type='button' class='rep_n btn btn-secondary' rnum='${nr.num }' value='x'></td>"
						str += "</tr></table>";
					}
					$('#r_' + notice_rep.n_num).html(str);
				}
			});
		});
	});
	$(document).ready(function() {
		$.note();
		$('.rep').click(function() {
			var n_num = $(this).attr("num");
			var writer = $('#writer_' + n_num).val();

			var sid = $('.sid').val();

			var content = $('#content_' + n_num).val();
			var r_writer = $('.r_writer').val();

			var param = "n_num=" + n_num;

			if (content == '' || content == null) {
				alert("내용 작성후 눌러주세요");
				return;
			}
			param += "&writer=" + writer;
			param += "&content=" + content;
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath }/notice_rep/add",
				data : param,
				success : function(data) {
					var arr = eval('(' + data + ')');
					var str = "<table class='table table-hover' style='width:100%'>";
					var notice_rep;
					for (i = 0; i < arr.length; i++) {
						notice_rep = arr[i];
						str += "<tr>";
						str += "<td style='width:15%'>" + notice_rep.writer + "</td>";
						str += "<td style='width:80%'>" + notice_rep.content + "</td>";
						if (notice_rep.writer == sid) {
							str += "<td style='width:5%'><input type='button' class='rep_n btn btn-secondary' rnum='${nr.num }' value='x'></td>";
						} else {
							str += "<td></td>";
						}
						str += "</tr>";
					}
					str += "</table>";
					$('#r_' + notice_rep.n_num).html(str);

					$('#content_' + n_num).val('');
					$('.rep_n').click(function() {
						/* location.href="${pageContext.request.contextPath }/notice_rep/del?num="+rnum+"&bNum="+${n.num }; */
						var rnum = $(this).attr("rnum");
						var param = "rnum=" + rnum;

						$.ajax({
							type : "POST",
							url : "${pageContext.request.contextPath }/notice_rep/del",
							data : param,
							success : function() {
							}
						});
						location.href = "${pageContext.request.contextPath }/notice/detail1?num=" + '${n.num}';
					});
				}
			});
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
								<span class="m-portlet__head-icon m--hide"> </span>
								<h2 class="m-portlet__head-label m-portlet__head-label--info">
									<span> ${n.writer }님의 공지 사항 입니다. </span>
								</h2>
							</div>
						</div>
					</div>
					<div class="m-portlet__body">
						<input type="hidden" class="sid" value="${sessionScope.id }" />
						<div class="container">
							<form action="${pageContext.request.contextPath }/notice/edit" method="post" accept-charset="utf-8">
								<table class="table table-hover" style='width: 100%'>
									<tr>
										<th>작성일</th>
										<td>
											<input type="hidden" name="num" value="${n.num }">
											<input type="text" name="w_date" value="${n.w_date }" style='width: 100%' readonly>
										</td>
									</tr>
									<tr><th>작성자</th>
										<td>
											<input type="text" name="writer" value="${n.writer }" style='width: 100%' readonly>
										</td></tr>
									<c:choose>
										<c:when test="${sessionScope.id eq n.writer }">
											<tr><th>공지명</th>
												<td>
													<input type="text" name="title" value="${n.title }" style='width: 100%'>
												</td></tr>
											<tr><th>공지내용</th>
												<td>
													<textarea style="resize: none" name="content" id="summernote">${n.content }</textarea>
												</td></tr>
										</c:when>
										<c:otherwise>
											<tr><th>공지명</th>
												<td>
													<input type="text" name="title" value="${n.title }" style='width: 100%' readonly>
												</td></tr>
											<tr><th>공지내용</th>
												<td>
													<textarea style="resize: none" name="content" id="summernote" readonly>${n.content }</textarea>
												</td></tr>
										</c:otherwise>
									</c:choose>
									<tr>
										<th>댓글작성</th>
										<td>
											<input type="hidden" id="writer_${n.num }" value="${sessionScope.id}" readonly>
											<input type="text" id="content_${n.num }" style="border-radius: 3px; width: 80%; height: 49px;" placeholder=" 댓글을 작성해주세요.">
											&nbsp;
											<input type="button" class="rep btn btn-secondary" num="${n.num }" value="작성">
										</td>
									</tr>
									<tr>
										<th>댓글목록</th>
										<td colspan="1" id="r_${n.num }">
											<c:set var="count" value="0" />
											<table class="table table-hover" style='width: 100%'>
												<c:forEach var="nr" items="${listR }" varStatus="status">
													<c:if var="co" test="${n.num==nr.n_num }">
														<tr>
															<td style='width: 15%'>
																<input type="hidden" class="r_writer" value="${nr.writer }">${nr.writer }</td>
															<td style='width: 80%'>${nr.content }</td>
															<c:if test="${nr.writer eq sessionScope.id}">
																<td style='width: 5%'>
																	<input type="button" class="rep_n btn btn-secondary" rnum="${nr.num }" value="삭제">
																</td>
															</c:if>
														</tr>
														<c:set var="count" value="${count + 1 }" />
													</c:if>
												</c:forEach>
												<c:if test="${count == 0 }">
													<tr><td>작성된 댓글이 없습니다</td></tr>
												</c:if>
											</table>
										</td>
									</tr>
									<tr>
										<th></th>
										<td align="right">
											<input type="button" id="back" class="btn btn-secondary" value="뒤로">
											<c:if test="${n.writer==sessionScope.id}">
												<input type="submit" class="edit btn btn-secondary" num="${n.num }" value="수정">
												<input type="button" class="del btn btn-secondary" num="${n.num }" value="삭제">
											</c:if>
										</td>
									</tr>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>