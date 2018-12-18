<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
   function add_div(id, field) {
      var div = document.createElement('div');
      div.innerHTML = document.getElementById(id).innerHTML;
      document.getElementById(field).appendChild(div);
   }
   
   function remove1(obj) {
      $(obj.parentNode.parentNode).remove();
      //document.getElementById('field').removeChild(obj.parentNode.parentNode); // obj.parentNode 를 이용하여 삭제
   }
   
   function remove2(obj) {
      alert(obj.parentNode.parentNode.parentNode);
      $(obj.parentNode.parentNode.parentNode).remove();
      //document.getElementById('field').removeChild(obj.parentNode.parentNode); // obj.parentNode 를 이용하여 삭제
   }
   
   $(document).ready(function() {
      $("#back").click(function() {
         var result = confirm("등록을 취소하고 목록으로 돌아갑니다.");
         if (result) {
            history.go(-1);
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
														      설문조사 등록
													</span>
												</h2>
											</div>
										</div>
										
									</div>
									<div class="m-portlet__body">
										  <div class="container">
      <form action="${pageContext.request.contextPath }/surveyQ/add" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
         <div id="splus">
            <div class="form-group">
               <label class="control-label col-sm-2" for="title">주제:</label>
               <div class="col-sm-10">
                  <input type="text" class="form-control" id="title" name="title">
               </div>
            </div>
            <div class="form-group">
               <label class="control-label col-sm-2" for="period">조사기간:</label>
               <div class="col-sm-5">
                  시작일:
                  <input type="date" class="form-control" id="startdate" name="startdate">
                  종료일:
                  <input type="date" class="form-control" id="enddate" name="enddate">
               </div>
            </div>
         </div>
         <div>
            <div class="col-sm-12">&nbsp;</div>
            <div class="col-sm-12">&nbsp;</div>
            <div class="col-sm-12">&nbsp;</div>
         </div>
         <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
               <button type="button" onclick="add_div('qplus', 'field')" class="btn btn-primary btn-block">질의 추가</button>
            </div>
         </div>
         <div id="qplus">
            <div class="form-group">
               <label class="control-label col-sm-2" for="question">질의내용:</label>
               <div class="col-sm-10">
                  <input type="text" class="form-control" id="question" name="question">
               </div>
            </div>
            <div class="form-group">
               <label class="control-label col-sm-2" for="atype">응답유형:</label>
               <div class="col-sm-10">
                  <select class="form-control" id="atype" name="atype">
                     <option id="selectbox">셀렉트박스(단일응답)</option>
                     <option id="checkbox">체크박스(복수응답)</option>
                     <option id="shorttext">단답형</option>
                     <option id="longtext">장문형</option>
                  </select>
               </div>
            </div>
            <!-- c:if atype == selectbox || checkbox 이면,-->
            <div id="oplus">
               <div class="form-group">
                  <label class="control-label col-sm-2" for="mtext">&nbsp;&nbsp;&nbsp;&nbsp;선택답안 입력</label>
                  <div class="col-sm-8">
                     <input type="text" class="form-control" id="mtext" name="mtext">
                  </div>
                  <div class="col-sm-2">
                     <button type="button" id="mtext" name="mtext" onclick="add_div('oplus', 'field-child')" class="btn btn-primary">+</button>
                     <button type="button" onclick="remove1(this)" class="btn btn-primary">-</button>
                  </div>
               </div>
            </div>
            <div id="field-child"></div>
            <div class="form-group">
               <label class="control-label col-sm-2" for="file">파일첨부:</label>
               <div class="col-sm-10">
                  <input type="file" class="form-control" id="file" name="file">
               </div>
            </div>
            <div class="form-group">
               <div class="col-sm-offset-2 col-sm-10">
                  <button type="button" id="delQ" onclick="remove2(this)" class="btn btn-secondary btn-block">질의 삭제</button>
               </div>
            </div>
         </div>
         <div>
            <div class="col-sm-12">&nbsp;</div>
            <div class="col-sm-12">&nbsp;</div>
            <div class="col-sm-12">&nbsp;</div>
         </div>
         <div id="field"></div>
         <div>
            <div class="col-sm-12">&nbsp;</div>
            <div class="col-sm-12">&nbsp;</div>
            <div class="col-sm-12">&nbsp;</div>
         </div>
         <div class="form-group">
            <div class="col-sm-offset-5 col-sm-7">
               <button type="submit" class="btn btn-primary" id="add" name="add">설문등록</button>
               <button type="reset" class="btn btn-secondary" id="back" name="back">등록취소</button>
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
