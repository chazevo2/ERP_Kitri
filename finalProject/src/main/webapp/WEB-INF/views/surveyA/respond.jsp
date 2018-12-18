<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){	
	$("#back").click(function(){
		 var result = confirm("등록을 취소하고 목록으로 돌아갑니다.");
		if(result){history.go(-1);
		}else{
	}
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
														설문조사 응답
													</span>
												</h2>
											</div>
										</div>
										
									</div>
									<div class="m-portlet__body">
										<div class="container">
									<form action="${pageContext.request.contextPath }/surveyA/add" method="post" accept-charset="UTF-8">
									<c:forEach var="a" items="${list }" varStatus="status">
									<table class="table table-hover">
									<c:if test="${status.first}">
									<thead><tr><th>설문 주제: ${a.title }</th></tr></thead>
									</c:if>
									<tbody>
									<tr>
									<td>질문</td>
									<td>질문보기</td>
									</tr>
									<tr>
									<td>${a.question }</td>
									<td>${a.mtext }</td>
									</tr>
									</tbody>
									</table>
									</c:forEach>
									<div class="form-group">       
									<div class="col-sm-offset-5 col-sm-7">
									<button type="submit" class="btn btn-primary" id="answer" name="answer">제출</button>
									<button type="button" class="btn btn-secondary" id="back" name="back" onclick="back">취소</button>
									</div>
									</div>
									</form>
									</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div> 
