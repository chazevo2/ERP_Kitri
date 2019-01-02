<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
[
<c:forEach var="list" items="${list }" varStatus="status">
	<c:if test="${!status.first }">,</c:if>
{"num":"${list.num }", "name":"${list.name }"}
</c:forEach>
]
