<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
									<span> 설문조사 </span>
								</h2>
							</div>
						</div>
					</div>
					<div class="m-portlet__body">
						<div class="container">
							<form action="${pageContext.request.contextPath }/surveyQ/list" method="post" accept-charset="UTF-8">
								<a href="${pageContext.request.contextPath }/surveyQ/addForm" class="btn btn-secondary">설문 등록</a>
								<table class="table table-hover">
									<thead>
										<tr>
											<th>번호</th>
											<th>주제</th>
											<th>진행현황</th>
											<th>조사기간</th>
									</thead>
									<tbody>
										<c:forEach var="q" items="${list }">
											<tr>
												<td>${q.snum }</td>
												<td>
													<a href="${pageContext.request.contextPath }/surveyA/respond?parent=${q.snum}">${q.title}</a>
												</td>
												<td>${a.progress }</td>
												<td>${q.startdate }~ ${q.enddate }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
