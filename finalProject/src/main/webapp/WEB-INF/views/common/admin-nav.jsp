<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<meta charset="utf-8" />
<div id="m_aside_left" class="m-grid__item	m-aside-left  m-aside-left--skin-dark ">
					<!-- BEGIN: Aside Menu -->
	<div id="m_ver_menu" class="m-aside-menu  m-aside-menu--skin-dark m-aside-menu--submenu-skin-dark " data-menu-vertical="true" data-menu-scrollable="false" data-menu-dropdown-timeout="500">
						<ul class="m-menu__nav  m-menu__nav--dropdown-submenu-arrow ">
							<li class="m-menu__item  m-menu__item--active" aria-haspopup="true">
								<a href="" class="m-menu__link ">
									<i class="m-menu__link-icon flaticon-grid-menu"></i>
									<span class="m-menu__link-title">
										<span class="m-menu__link-wrap">
											<span class="m-menu__link-text">
												홈으로
											</span>
										</span>
									</span>
								</a>
							</li>
							<li class="m-menu__item  m-menu__item--active" aria-haspopup="true">
								<a href="${pageContext.request.contextPath }/mailList/list" class="m-menu__link ">
									<i class="m-menu__link-icon flaticon-chat-1"></i>
									<span class="m-menu__link-title">
										<span class="m-menu__link-wrap">
											<span class="m-menu__link-text">
												쪽지함
											</span>
											<span class="m-menu__link-badge">
												<span class="m-badge m-badge--danger">
													<카운트>
												</span>
											</span>
										</span>
									</span>
								</a>
							</li>
							<li class="m-menu__item  m-menu__item--active" aria-haspopup="true" data-menu-submenu-toggle="hover">
								<a href="${pageContext.request.contextPath }/approval/write" class="m-menu__link m-menu__toggle">
									<i class="m-menu__link-icon flaticon-grid-menu"></i>
									<span class="m-menu__link-title">
										<span class="m-menu__link-wrap">
											<span class="m-menu__link-text">
												전자결재
											</span>
										</span>
									</span>
									<i class="m-menu__ver-arrow la la-angle-right"></i>
								</a>
								<div class="m-menu__submenu" style="display: none;">
									<span class="m-menu__arrow"></span>
									<ul class="m-menu__subnav">
										<li class="m-menu__item  m-menu__item--active" aria-haspopup="true">
											<a href="${pageContext.request.contextPath }/approval/approve" class="m-menu__link ">
												<i class="m-menu__link-bullet m-menu__link-bullet--dot">
													<span></span>
												</i>
												<span class="m-menu__link-text">
													결재문서함
												</span>
											</a>
										</li>
										<li class="m-menu__item " aria-haspopup="true">
											<a href="${pageContext.request.contextPath }/approval/write" class="m-menu__link ">
												<i class="m-menu__link-bullet m-menu__link-bullet--dot">
													<span></span>
												</i>
												<span class="m-menu__link-text">
													결재문서작성
												</span>
											</a>
										</li>
										<li class="m-menu__item " aria-haspopup="true">
											<a href="${pageContext.request.contextPath }/approval/docsManage" class="m-menu__link ">
												<i class="m-menu__link-bullet m-menu__link-bullet--dot">
													<span></span>
												</i>
												<span class="m-menu__link-text">
													문서양식관리
												</span>
											</a>
										</li>
									</ul>
								</div>
							</li>
								<li class="m-menu__item  m-menu__item--active" aria-haspopup="true">
								<a href="${pageContext.request.contextPath }/notice/list" class="m-menu__link ">
									<i class="m-menu__link-icon flaticon-notes"></i>
									<span class="m-menu__link-title">
										<span class="m-menu__link-wrap">
											<span class="m-menu__link-text">
												사내공지
											</span>
										</span>
									</span>
								</a>
							</li>
								<li class="m-menu__item  m-menu__item--active" aria-haspopup="true">
								<a href="${pageContext.request.contextPath }/community/list" class="m-menu__link ">
									<i class="m-menu__link-icon flaticon-interface-1"></i>
									<span class="m-menu__link-title">
										<span class="m-menu__link-wrap">
											<span class="m-menu__link-text">
												사내모임
											</span>
										</span>
									</span>
								</a>
							</li>
								<li class="m-menu__item  m-menu__item--active" aria-haspopup="true">
								<a href="#" class="m-menu__link ">
									<i class="m-menu__link-icon flaticon-users"></i>
									<span class="m-menu__link-title">
										<span class="m-menu__link-wrap">
											<span class="m-menu__link-text">
												연락처
											</span>
										</span>
									</span>
								</a>
							</li>
								<li class="m-menu__item  m-menu__item--active" aria-haspopup="true">
								<a href="${pageContext.request.contextPath }/surveyQ/list" class="m-menu__link ">
									<i class="m-menu__link-icon flaticon-search-1"></i>
									<span class="m-menu__link-title">
										<span class="m-menu__link-wrap">
											<span class="m-menu__link-text">
												설문조사
											</span>
										</span>
									</span>
								</a>
							</li>
								<li class="m-menu__item  m-menu__item--active" aria-haspopup="true">
								<a href="${pageContext.request.contextPath }/departmentCode/adminForm" class="m-menu__link ">
									<i class="m-menu__link-icon flaticon-cogwheel-2"></i>
									<span class="m-menu__link-title">
										<span class="m-menu__link-wrap">
											<span class="m-menu__link-text">
												관리자
											</span>
										</span>
									</span>
								</a>
							</li>
						</ul>
					</div>
					<!-- END: Aside Menu -->
				</div>