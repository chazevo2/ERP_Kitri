<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
[
<c:forEach var="d" items="${list }" varStatus="status">
<c:if test="${!status.first }">,</c:if> 
{"num":${d.num }, "title":"${d.title }", "path":"${d.path }"}
</c:forEach>
]
