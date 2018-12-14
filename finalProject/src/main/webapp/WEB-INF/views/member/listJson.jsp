<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
[
<c:forEach var="list" items="${list }" varStatus="status">
	<c:if test="${!status.first }">,</c:if>
{"id":"${list.id }", "pwd":"${list.pwd }", "name":"${list.name }", "hp":"${list.hp }", "email":"${list.email }", "address":"${list.address }", "picture":"${list.picture }", "departmentCode":${list.departmentCode }, "gradeCode":"${list.gradeCode }", "hiredate":"${list.hiredate }", "firedate":"${list.firedate }", "confirm":"${list.confirm }"}
</c:forEach>
]
