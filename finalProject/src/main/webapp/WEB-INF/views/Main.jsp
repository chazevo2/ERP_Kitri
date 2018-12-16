<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<%-- <link href="${pageContext.request.contextPath }/resources/css/sideMenu.css" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script type="text/javascript" src="//code.jquery.com/jquery-3.3.1.min.js"></script> --%>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
// 	$(document).ready(function() {
// 		/* $(".td2").mouseover(function(){
// 			$(this).attr("style","background-color:#d5d8df");
// 		});
// 		$(".td2").mouseout(function(){
// 			$(this).attr("style","background-color:#666");
// 		}); */

// 		$("#edit").click(function() {

// 		});

// 		$("#logout").click(function() {
// 			location.href = "${pageContext.request.contextPath }/member/logout";
// 		});
// 		$(".td2").click(function() {
// 			var value = $(this).attr("value");
// 			var html = "";
// 			switch (value) {
// 			case "1":
// 				location.href = "${pageContext.request.contextPath }/main?sub=/main1";
// 				break;
// 			case "2":
// 				location.href = "${pageContext.request.contextPath }/main?sub=/main2";
// 				break;
// 			case "3":
// 				location.href = "${pageContext.request.contextPath }/main?sub=/approval/write";
// 				break;
// 			case "4":
// 				location.href = "${pageContext.request.contextPath }/main?sub=/main4";
// 				break;
// 			case "5":
// 				location.href = "${pageContext.request.contextPath }/main?sub=/main5";
// 				break;
// 			case "6":
// 				location.href = "${pageContext.request.contextPath }/main?sub=/main6";
// 				break;
// 			case "7":
// 				location.href = "${pageContext.request.contextPath }/departmentCode/adminForm1";
// 				break;
// 			case "8":
// 				location.href = "${pageContext.request.contextPath }/main?sub=/main8";
// 				break;
// 			case "9":
// 				location.href = "${pageContext.request.contextPath }/main?sub=/main9";
// 				break;
// 			case "10":
// 				location.href = "${pageContext.request.contextPath }/departmentCode/adminForm1";
// 				break;
// 			}
// 		});
// 	});
</script>
<style>
/* .td2 {
	display: block;
	color: black;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	float: left;
}

.td2 :hover {
	background-color: #111;
} */
body, html {
	height: 100%;
}

/* remove outer padding */
.main .row {
	padding: 0px;
	margin: 0px;
}

/*Remove rounded coners*/
nav.sidebar.navbar {
	border-radius: 0px;
}

nav.sidebar, .main {
	-webkit-transition: margin 200ms ease-out;
	-moz-transition: margin 200ms ease-out;
	-o-transition: margin 200ms ease-out;
	transition: margin 200ms ease-out;
}

/* Add gap to nav and right windows.*/
.main {
	padding: 10px 10px 0 10px;
}

/* .....NavBar: Icon only with coloring/layout.....*/

/*small/medium side display*/
@media ( min-width : 768px) {
	/*Allow main to be next to Nav*/
	.main {
		position: absolute;
		width: calc(100% - 40px); /*keeps 100% minus nav size*/
		margin-left: 40px;
		float: right;
	}

	/*lets nav bar to be showed on mouseover*/
	nav.sidebar:hover+.main {
		margin-left: 200px;
	}

	/*Center Brand*/
	nav.sidebar.navbar.sidebar>.container .navbar-brand, .navbar>.container-fluid .navbar-brand {
		margin-left: 0px;
	}
	/*Center Brand*/
	nav.sidebar .navbar-brand, nav.sidebar .navbar-header {
		text-align: center;
		width: 100%;
		margin-left: 0px;
	}

	/*Center Icons*/
	nav.sidebar a {
		padding-right: 13px;
	}

	/*adds border top to first nav box */
	nav.sidebar .navbar-nav>li:first-child {
		border-top: 1px #e5e5e5 solid;
	}

	/*adds border to bottom nav boxes*/
	nav.sidebar .navbar-nav>li {
		border-bottom: 1px #e5e5e5 solid;
	}

	/* Colors/style dropdown box*/
	nav.sidebar .navbar-nav .open .dropdown-menu {
		position: static;
		float: none;
		width: auto;
		margin-top: 0;
		background-color: transparent;
		border: 0;
		-webkit-box-shadow: none;
		box-shadow: none;
	}

	/*allows nav box to use 100% width*/
	nav.sidebar .navbar-collapse, nav.sidebar .container-fluid {
		padding: 0 0px 0 0px;
	}

	/*colors dropdown box text */
	.navbar-inverse .navbar-nav .open .dropdown-menu>li>a {
		color: #777;
	}

	/*gives sidebar width/height*/
	nav.sidebar {
		width: 200px;
		height: 100%;
		margin-left: -160px;
		float: left;
		z-index: 8000;
		margin-bottom: 0px;
	}

	/*give sidebar 100% width;*/
	nav.sidebar li {
		width: 100%;
	}

	/* Move nav to full on mouse over*/
	nav.sidebar:hover {
		margin-left: 0px;
	}
	/*for hiden things when navbar hidden*/
	.forAnimate {
		opacity: 0;
	}
}
</style>
</head>
<body>
	<%-- <header>
		<table border="1">
			<tr>
				<td class=td2 style="" value="1">홈으로</td>
				<td class=td2 style="" value="2">전자우편</td>
				<td class=td2 style="" value="3">전자결재</td>
				<td class=td2 style="" value="4">일정관리</td>
				<td class=td2 style="" value="5">사내공지</td>
				<td class=td2 style="" value="6">사내모임</td>
				<td class=td2 style="" value="7">주소록</td>
				<td class=td2 style="" value="8">설문조사</td>
				<td class=td2 style="" value="9">자유게시판</td>
				<td class=td2 style="" value="10">관리자</td>
			</tr>
		</table>
	</header>
	<nav class="navbar navbar-default sidebar" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-sidebar-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
			</div>
			<div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="#">프로필<span style="font-size: 16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-home"></span>
							<div style="font-size: 13px;">
								<table>
									 <tr><td>${sessionScope.picture}</td>
									<tr><td rowspan="2">
											<img src="${sessionScope.picture}" style="width: 50px; height: 50px">
										</td>
										<td>사번:${sessionScope.id}</td></tr>
									<tr><td>이름:${sessionScope.name}</td></tr>
									<tr><td colspan="2">이메일:${sessionScope.email}</td></tr>
									<tr><td>
											<input type="button" id="edit" value="내정보수정">
										</td>
										<td>
											<input type="button" id="logout" value="로그아웃">
										</td></tr>
								</table>
							</div></a></li>
					<li><a href="${pageContext.request.contextPath }/home">Home<span style="font-size: 16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-th-list"></span></a></li>
					<li><a href="#">aaaa<span style="font-size: 16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-th-list"></span></a></li>
					<li><a href="#">Libros<span style="font-size: 16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-th-list"></span></a></li>
					<li><a href="#">Tags<span style="font-size: 16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-th-list"></span></a></li>
				</ul>
			</div>
		</div>
	</nav>
	<article>
		<c:if test="${sub==null && sub==''}">
			<jsp:include page="${request.contextPath }/home"></jsp:include>
		</c:if>
		<div style="position: relative; top: 100px; left: 100px">
			<c:if test="${sub!=null && sub!='' }">
				<jsp:include page="${request.contextPath }${sub }"></jsp:include>
			</c:if>
		</div>
	</article> --%>
	<nav class="navbar navbar-inverse sidebar" role="navigation">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-sidebar-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Brand</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="${pageContext.request.contextPath }/main?sub=/approval/write">Home<span style="font-size: 16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-home"></span></a></li>
					<li><a href="#">Profile<span style="font-size: 16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></a></li>
					<li><a href="#">Messages<span style="font-size: 16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-envelope"></span></a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Settings <span class="caret"></span><span style="font-size: 16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-cog"></span></a>
						<ul class="dropdown-menu forAnimate" role="menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li class="divider"></li>
							<li><a href="#">Separated link</a></li>
							<li class="divider"></li>
							<li><a href="#">One more separated link</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="main">
		<c:if test="${sub==null && sub==''}">
			<jsp:include page="${request.contextPath }/home"></jsp:include>
		</c:if>
		<c:if test="${sub!=null && sub!='' }">
			<jsp:include page="${request.contextPath }${sub }"></jsp:include>
		</c:if>
	</div>
</body>
</html>