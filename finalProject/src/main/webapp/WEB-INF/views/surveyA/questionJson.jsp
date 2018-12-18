<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="q" items="${listQ }" varStatus="status">
<c:if test="${q.qnum_multiple == q.qnum} ">
{"mtext":"${q.mtext}"}
</c:if>
</c:forEach>
