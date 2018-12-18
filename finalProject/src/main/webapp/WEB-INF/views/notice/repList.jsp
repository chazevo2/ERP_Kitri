<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
[
<c:forEach var="nr" items="${list }" varStatus="status">
<c:if test="${!status.first }">,</c:if>
{"num":${nr.num }, "writer":"${nr.writer }", 
"n_num":${nr.n_num },"content":"${nr.content }"}
</c:forEach>
]