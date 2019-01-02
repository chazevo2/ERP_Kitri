<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
[
<c:forEach var="ca" items="${list }" varStatus="status">
	<c:if test="${!status.first }">,</c:if>
{"num":${ca.num }, "writer":"${ca.writer }", "content":"${ca.content }", "w_date":"${ca.w_date }"}
</c:forEach>
]
