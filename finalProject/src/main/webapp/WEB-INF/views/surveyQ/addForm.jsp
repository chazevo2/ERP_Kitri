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
      //document.getElementById('field').removeChild(obj.parentNode.parentNode); // obj.parentNode �� �̿��Ͽ� ����
   }
   
   function remove2(obj) {
      alert(obj.parentNode.parentNode.parentNode);
      $(obj.parentNode.parentNode.parentNode).remove();
      //document.getElementById('field').removeChild(obj.parentNode.parentNode); // obj.parentNode �� �̿��Ͽ� ����
   }
   
   $(document).ready(function() {
      $("#back").click(function() {
         var result = confirm("����� ����ϰ� ������� ���ư��ϴ�.");
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
														      �������� ���
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
               <label class="control-label col-sm-2" for="title">����:</label>
               <div class="col-sm-10">
                  <input type="text" class="form-control" id="title" name="title">
               </div>
            </div>
            <div class="form-group">
               <label class="control-label col-sm-2" for="period">����Ⱓ:</label>
               <div class="col-sm-5">
                  ������:
                  <input type="date" class="form-control" id="startdate" name="startdate">
                  ������:
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
               <button type="button" onclick="add_div('qplus', 'field')" class="btn btn-primary btn-block">���� �߰�</button>
            </div>
         </div>
         <div id="qplus">
            <div class="form-group">
               <label class="control-label col-sm-2" for="question">���ǳ���:</label>
               <div class="col-sm-10">
                  <input type="text" class="form-control" id="question" name="question">
               </div>
            </div>
            <div class="form-group">
               <label class="control-label col-sm-2" for="atype">��������:</label>
               <div class="col-sm-10">
                  <select class="form-control" id="atype" name="atype">
                     <option id="selectbox">����Ʈ�ڽ�(��������)</option>
                     <option id="checkbox">üũ�ڽ�(��������)</option>
                     <option id="shorttext">�ܴ���</option>
                     <option id="longtext">�幮��</option>
                  </select>
               </div>
            </div>
            <!-- c:if atype == selectbox || checkbox �̸�,-->
            <div id="oplus">
               <div class="form-group">
                  <label class="control-label col-sm-2" for="mtext">&nbsp;&nbsp;&nbsp;&nbsp;���ô�� �Է�</label>
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
               <label class="control-label col-sm-2" for="file">����÷��:</label>
               <div class="col-sm-10">
                  <input type="file" class="form-control" id="file" name="file">
               </div>
            </div>
            <div class="form-group">
               <div class="col-sm-offset-2 col-sm-10">
                  <button type="button" id="delQ" onclick="remove2(this)" class="btn btn-secondary btn-block">���� ����</button>
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
               <button type="submit" class="btn btn-primary" id="add" name="add">�������</button>
               <button type="reset" class="btn btn-secondary" id="back" name="back">������</button>
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
