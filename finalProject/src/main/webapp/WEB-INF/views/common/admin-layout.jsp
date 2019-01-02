<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<tiles:insertAttribute name="head" />
</head>
<body class="m-page--fluid m--skin- m-content--skin-light2 m-header--fixed m-header--fixed-mobile m-aside-left--enabled m-aside-left--skin-dark m-aside-left--offcanvas m-footer--push m-aside--offcanvas-default">
	<div class="m-grid m-grid--hor m-grid--root m-page">
		<tiles:insertAttribute name="header" />
		<div class="m-grid__item m-grid__item--fluid m-grid m-grid--ver-desktop m-grid--desktop m-body">
			<button class="m-aside-left-close  m-aside-left-close--skin-dark " id="m_aside_left_close_btn">
				<i class="la la-close"></i>
			</button>
			<tiles:insertAttribute name="nav" />
			<tiles:insertAttribute name="content" />
		</div>
	</div>
	<!-- begin::Quick Nav -->
	<!--begin::Base Scripts -->
	<script src="${pageContext.request.contextPath}/assets/vendors/base/vendors.bundle.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/assets/demo/default/base/scripts.bundle.js" type="text/javascript"></script>
	<!--end::Base Scripts -->
	<!--begin::Page Vendors -->
	<script src="${pageContext.request.contextPath}/assets/vendors/custom/fullcalendar/fullcalendar.bundle.js" type="text/javascript"></script>
	<!--end::Page Vendors -->
	<!--begin::Page Snippets -->
	<script src="${pageContext.request.contextPath}/assets/app/js/dashboard.js" type="text/javascript"></script>
	<!--end::Page Snippets -->
</body>
</html>