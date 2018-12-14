<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
[
<c:forEach var="a" items="${list }" varStatus="status">
<c:if test="${!status.first }">,</c:if> 
{"num":${a.num }, "id":"${a.id }", "mid_id":"${a.mid_id }", "fnl_id":"${a.fnl_id }", "apv_set_num":"${a.apv_set_num }", "title":"${a.title }", "apv_date":"${a.apv_date }", "path":"${a.path }", "rejection":"${a.rejection }", "log":"${a.log }"}
</c:forEach>
]
