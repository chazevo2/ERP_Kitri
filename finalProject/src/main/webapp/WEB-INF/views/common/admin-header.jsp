<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath }/member/profile",
			success : function(data) {
				var m = eval("(" + data + ")");
				$("#img1").attr("src", m.picture);
				$("#img2").attr("src", m.picture);
				$("#email1").html("메일:  " + m.email);
			}
		});

		$("#edit").click(function() {
			win = window.open("${pageContext.request.contextPath }/member/editForm", "details", "width=500,height=700, top=200, left=500");
		});
	});
</script>
<header class="m-grid__item    m-header " data-minimize-offset="200" data-minimize-mobile-offset="200">
	<div class="m-container m-container--fluid m-container--full-height">
		<div class="m-stack m-stack--ver m-stack--desktop">
			<!-- BEGIN: Brand -->
			<div class="m-stack__item m-brand  m-brand--skin-dark ">
				<div class="m-stack m-stack--ver m-stack--general">
					<div class="m-stack__item m-stack__item--middle m-brand__logo">
						<a href="${pageContext.request.contextPath}/member/home" class="m-brand__logo-wrapper"> <img alt="" src="${pageContext.request.contextPath}/resources/logo.png">
						</a>
					</div>
					<div class="m-stack__item m-stack__item--middle m-brand__tools">
						<!-- BEGIN: Left Aside Minimize Toggle -->
						<a href="javascript:;" id="m_aside_left_minimize_toggle" class="m-brand__icon m-brand__toggler m-brand__toggler--left m--visible-desktop-inline-block 
					 "> <span></span>
						</a>
						<!-- END -->
						<!-- BEGIN: Responsive Aside Left Menu Toggler -->
						<a href="javascript:;" id="m_aside_left_offcanvas_toggle" class="m-brand__icon m-brand__toggler m-brand__toggler--left m--visible-tablet-and-mobile-inline-block"> <span></span>
						</a>
						<!-- END -->
						<!-- BEGIN: Responsive Header Menu Toggler -->
						<a id="m_aside_header_menu_mobile_toggle" href="javascript:;" class="m-brand__icon m-brand__toggler m--visible-tablet-and-mobile-inline-block"> <span></span>
						</a>
						<!-- END -->
						<!-- BEGIN: Topbar Toggler -->
						<a id="m_aside_header_topbar_mobile_toggle" href="javascript:;" class="m-brand__icon m--visible-tablet-and-mobile-inline-block"> <i class="flaticon-more"></i>
						</a>
						<!-- BEGIN: Topbar Toggler -->
					</div>
				</div>
			</div>
			<!-- END: Brand -->
			<div class="m-stack__item m-stack__item--fluid m-header-head" id="m_header_nav">
				<!-- BEGIN: Horizontal Menu -->
				<button class="m-aside-header-menu-mobile-close  m-aside-header-menu-mobile-close--skin-dark " id="m_aside_header_menu_mobile_close_btn">
					<i class="la la-close"></i>
				</button>
				<div id="m_header_menu" class="m-header-menu m-aside-header-menu-mobile m-aside-header-menu-mobile--offcanvas  m-header-menu--skin-light m-header-menu--submenu-skin-light m-aside-header-menu-mobile--skin-dark m-aside-header-menu-mobile--submenu-skin-dark ">
					<ul class="m-menu__nav  m-menu__nav--submenu-arrow ">
					</ul>
				</div>
				<!-- END: Horizontal Menu -->
				<!-- BEGIN: Topbar -->
				<div id="m_header_topbar" class="m-topbar  m-stack m-stack--ver m-stack--general">
					<div class="m-stack__item m-topbar__nav-wrapper">
						<ul class="m-topbar__nav m-nav m-nav--inline">
							<li class="m-nav__item m-topbar__user-profile m-topbar__user-profile--img  m-dropdown m-dropdown--medium m-dropdown--arrow m-dropdown--header-bg-fill m-dropdown--align-right m-dropdown--mobile-full-width m-dropdown--skin-light" data-dropdown-toggle="click"><a href="#" class="m-nav__link m-dropdown__toggle"> <span class="m-topbar__userpic"> <img id="img1" src="" class="m--img-rounded m--marginless m--img-centered" alt="" />
								</span> <span class="m-topbar__username m--hide"> Nick </span>
							</a>
								<div class="m-dropdown__wrapper">
									<span class="m-dropdown__arrow m-dropdown__arrow--right m-dropdown__arrow--adjust"></span>
									<div class="m-dropdown__inner">
										<!-- <div class="m-dropdown__header m--align-center" style="background: url(assets/app/media/img/misc/user_profile_bg.jpg); background-size: cover;"> -->
										<div class="m-dropdown__header m--align-center" style="background-size: cover;">
											<div class="m-card-user m-card-user--skin-dark">
												<div class="m-card-user__pic">
													<img id="img2" src="" class="m--img-rounded m--marginless" alt="" />
												</div>
												<div class="m-card-user__details">
													<span class="m-card-user__name m--font-weight-500"> ${sessionScope.name} </span> <a href="" class="m-card-user__email m--font-weight-300 m-link"> ${sessionScope.id} </a>
												</div>
											</div>
										</div>
										<div class="m-dropdown__body">
											<div class="m-dropdown__content">
												<ul class="m-nav m-nav--skin-light">
													<li class="m-nav__section m--hide"><span class="m-nav__section-text"> Section </span></li>
													<li class="m-nav__item"><a href="" class="m-nav__link"> <i class="m-nav__link-icon flaticon-share"></i> <span class="m-nav__link-title"> <span class="m-nav__link-wrap"> <span class="m-nav__link-text" id=email1> </span>
															</span>
														</span>
													</a></li>
													<li class="m-nav__separator m-nav__separator--fit"></li>
													<li class="m-nav__separator m-nav__separator--fit"></li>
													<li class="m-nav__item"><input type="button" id="edit" value="내정보수정" class="btn m-btn--pill    btn-secondary m-btn m-btn--custom m-btn--label-brand m-btn--bolder"> <a href="${pageContext.request.contextPath }/member/logout" class="btn m-btn--pill    btn-secondary m-btn m-btn--custom m-btn--label-brand m-btn--bolder"> Logout </a></li>
												</ul>
											</div>
										</div>
									</div>
								</div></li>
							<li id="m_quick_sidebar_toggle" class="m-nav__item"><a href="${pageContext.request.contextPath }/member/home" class="m-nav__link m-dropdown__toggle"> <span class="m-nav__link-icon"> <i class="flaticon-grid-menu"></i>
								</span>
							</a></li>
						</ul>
					</div>
				</div>
				<!-- END: Topbar -->
			</div>
		</div>
	</div>
</header>
