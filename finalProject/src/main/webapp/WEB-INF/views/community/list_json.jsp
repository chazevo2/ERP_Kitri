<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
[
<c:forEach var="c" items="${list }" varStatus="status">
<c:if test="${!status.first }">,</c:if>
{"num":"${c.num }", "title":"${c.title }", "content":"${c.content }", "writer":"${c.writer }","location":"${c.location }","w_date":"${c.w_date }", "nop":${c.nop }, "maxnop":${c.maxnop }, "clickcnt":${c.clickcnt }}
</c:forEach>
]