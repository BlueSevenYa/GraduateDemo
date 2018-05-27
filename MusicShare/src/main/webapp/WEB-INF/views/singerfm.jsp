<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="My Play Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- bootstrap -->
<link href="http://localhost:8080/resources/css/bootstrap.min.css" rel='stylesheet' type='text/css' media="all" />
<!-- //bootstrap -->
<link href="http://localhost:8080/resources/css/dashboard.css" rel="stylesheet">
<!-- Custom Theme files -->
<link href="http://localhost:8080/resources/css/style.css" rel='stylesheet' type='text/css' media="all" />
<script src="http://localhost:8080/resources/js/jquery-1.11.1.min.js"></script>
<!--start-smoth-scrolling-->
<!-- fonts -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Poiret+One' rel='stylesheet' type='text/css'>
<!-- //fonts -->
<link rel="stylesheet" href="./dist/skPlayer.min.css">
</head>
  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="http://localhost:8080/index"><h1><img src="http://localhost:8080/resources/images/logo.png" alt="" /></h1></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
			<div class="top-search">
				<form class="navbar-form navbar-right" action="http://localhost:8080/search/music">
					<input type="text" class="form-control" placeholder="音乐搜索" name="keyword">
					<input type="submit" value=" ">
				</form>
			</div>
			<div class="header-top-right">	
				<div class="file">
					<a href="upload1.jsp">上 传</a>
				</div>
				<c:choose>
					<c:when test="${not empty sessionScope.get('user')}">
						<div class="myhome">
							<a href="http://localhost:8080/user/home?userid=${sessionScope.get('user').userid}">
								<img src="http://localhost:8080/musicplat/picture/headpic/${sessionScope.get('user').userpicurl}" />
							</a>
						</div>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
				<div class="clearfix"> </div>
			</div>
        </div>
		<div class="clearfix"> </div>
      </div>
    </nav>
	<div class="copyrights"><a href="http://www.cssmoban.com/" ></a></div>
        <div class="col-sm-3 col-md-2 sidebar">
			<div class="top-navigation">
				<div class="t-menu">MENU</div>
				<div class="t-img">
					<img src="http://localhost:8080/resources/images/lines.png" alt="" />
				</div>
				<div class="clearfix"> </div>
			</div>
				<div class="drop-navigation drop-navigation">
				  <ul class="nav nav-sidebar">
					<li class="active"><a href="http://localhost:8080/index" class="home-icon"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>首页</a></li>
					<li><a href="http://localhost:8080/my/music" class="mymusic-icon"><span class="glyphicon glyphicon-home glyphicon-blackboard" aria-hidden="true"></span>我的音乐</a></li>
					  <li><a href="#" class="ranking-icon menu2"><span class="glyphicon glyphicon-home glyphicon-hourglass" aria-hidden="true"></span>排行榜</a></li>
					  <ul class="cl-effect-22">
						  <li><a href="http://localhost:8080/music/ranking/click">点击排行榜</a></li>
						  <li><a href="http://localhost:8080/music/ranking/download">下载排行榜</a></li>
					  </ul>
					  <script>
                          $( "li a.menu2" ).click(function() {
                              $( "ul.cl-effect-22" ).slideToggle( 300, function() {
                                  // Animation complete.
                              });
                          });
					  </script>
					<li><a href="#" class="menu1"><span class="glyphicon glyphicon-film" aria-hidden="true"></span>歌手<span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span></a></li>
						<ul class="cl-effect-2">
							<li><a href="http://localhost:8080/singer/chinese/male?pageNum=1&pageSize=10">华语男歌手</a></li>
							<li><a href="http://localhost:8080/singer/chinese/female?pageNum=1&pageSize=10">华语女歌手</a></li>
							<li><a href="http://localhost:8080/singer/foreign/male?pageNum=1&pageSize=10">外语男歌手</a></li>
							<li><a href="http://localhost:8080/singer/foreign/female?pageNum=1&pageSize=10">外语女歌手</a></li>
						</ul>
						<!-- script-for-menu -->
						<script>
							$( "li a.menu1" ).click(function() {
							$( "ul.cl-effect-2" ).slideToggle( 300, function() {
							// Animation complete.
							});
							});
						</script>
					<li><a href="http://localhost:8080/songmenu/getallist?pageNum=1&pageSize=10" class="playlist-icon"><span class="glyphicon glyphicon-film glyphicon-king" aria-hidden="true"></span>歌单</a></li>
				</div>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<div class="main-grids">
				<div class="top-grids">
					<div class="recommended-info">
						<h3>
							<c:choose>
								<c:when test="${nationalitytag=='chinese'}">
									华语
								</c:when>
								<c:otherwise>
									外语
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${sextag=='男'}">
									男
								</c:when>
								<c:otherwise>
									女
								</c:otherwise>
							</c:choose>
							歌手</h3>
					</div>
					<c:forEach items="${pagehelper.list }" var="singer" varStatus="s">
						<c:choose>
						<c:when test="${s.index<10}">
							<div class="col-md-4 resent-grid recommended-grid slider-top-grids">
								<div class="resent-grid-img recommended-grid-img">
									<a href="http://localhost:8080/singer/show/${singer.singerid}"><img src="http://localhost:8080/musicplat/picture/song/singer/${singer.singerpicurl}" alt="" /></a>
								</div>
								<div class="resent-grid-info recommended-grid-info">
									<h3><a href="http://localhost:8080/singer/show/${singer.singerid}" class="title title-info">${singer.name}</a></h3>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="col-md-4 resent-grid recommended-grid slider-top-grids">

								<div class="resent-grid-info recommended-grid-info">
									<h3><a href="http://localhost:8080/singer/show/${singer.singerid}" class="title title-info">${singer.name}</a></h3>

								</div>
							</div>
						</c:otherwise>
						</c:choose>
						<c:if test="${s.index%5==4}">
							<div class="clearfix"></div>
						</c:if>
					</c:forEach>
					<%--<div class="col-md-4 resent-grid recommended-grid slider-top-grids">
						<div class="resent-grid-img recommended-grid-img">
							<a href="singerdata1.jsp"><img src="http://localhost:8080/resources/images/singer/19018252625793869.jpg" alt="" /></a>
						</div>
						<div class="resent-grid-info recommended-grid-info">
							<h3><a href="singerdata1.jsp" class="title title-info">周杰伦</a></h3>
						</div>
					</div>
					<div class="col-md-4 resent-grid recommended-grid slider-top-grids">
						<div class="resent-grid-img recommended-grid-img">
							<a href="single.html"><img src="http://localhost:8080/resources/images/singer/19165587183900212.jpg" alt="" /></a>
						</div>
						<div class="resent-grid-info recommended-grid-info">
							<h3><a href="single.html" class="title title-info">陈奕迅</a></h3>

						</div>
					</div>
					<div class="col-md-4 resent-grid recommended-grid slider-top-grids">
						<div class="resent-grid-img recommended-grid-img">
							<a href="single.html"><img src="http://localhost:8080/resources/images/singer/3250156379592966.jpg" alt="" /></a>
						</div>
						<div class="resent-grid-info recommended-grid-info">
							<h3><a href="single.html" class="title title-info">薛之谦</a></h3>

						</div>
					</div>
					<div class="col-md-4 resent-grid recommended-grid slider-top-grids">
						<div class="resent-grid-img recommended-grid-img">
							<a href="single.html"><img src="http://localhost:8080/resources/images/singer/3263350518850877.jpg" alt="" /></a>
						</div>
						<div class="resent-grid-info recommended-grid-info">
							<h3><a href="single.html" class="title title-info">林俊杰</a></h3>

						</div>
					</div>
					<div class="col-md-4 resent-grid recommended-grid slider-top-grids">
						<div class="resent-grid-img recommended-grid-img">
							<a href="single.html"><img src="http://localhost:8080/resources/images/singer/5828511138922177.jpg" alt="" /></a>
						</div>
						<div class="resent-grid-info recommended-grid-info">
							<h3><a href="single.html" class="title title-info">李荣浩</a></h3>

						</div>
					</div>
					<div class="clearfix"></div>
					<div class="col-md-4 resent-grid recommended-grid slider-top-grids">
						<div class="resent-grid-img recommended-grid-img">
							<a href="single.html"><img src="http://localhost:8080/resources/images/singer/3238061747024716.jpg" alt="" /></a>
						</div>
						<div class="resent-grid-info recommended-grid-info">
							<h3><a href="single.html" class="title title-info">张学友</a></h3>

						</div>
					</div>
					<div class="col-md-4 resent-grid recommended-grid slider-top-grids">
						<div class="resent-grid-img recommended-grid-img">
							<a href="single.html"><img src="http://localhost:8080/resources/images/singer/3261151495434543.jpg" alt="" /></a>
						</div>
						<div class="resent-grid-info recommended-grid-info">
							<h3><a href="single.html" class="title title-info">杨宗纬</a></h3>

						</div>
					</div>
					<div class="col-md-4 resent-grid recommended-grid slider-top-grids">
						<div class="resent-grid-img recommended-grid-img">
							<a href="single.html"><img src="http://localhost:8080/resources/images/singer/568447511584754.jpg" alt="" /></a>
						</div>
						<div class="resent-grid-info recommended-grid-info">
							<h3><a href="single.html" class="title title-info">许巍</a></h3>

						</div>
					</div>
					<div class="col-md-4 resent-grid recommended-grid slider-top-grids">
						<div class="resent-grid-img recommended-grid-img">
							<a href="single.html"><img src="http://localhost:8080/resources/images/singer/18806046882229308.jpg" alt="" /></a>
						</div>
						<div class="resent-grid-info recommended-grid-info">
							<h3><a href="single.html" class="title title-info">赵雷</a></h3>

						</div>
					</div>
					<div class="col-md-4 resent-grid recommended-grid slider-top-grids">
						<div class="resent-grid-img recommended-grid-img">
							<a href="single.html"><img src="http://localhost:8080/resources/images/singer/150633093021532.jpg" alt="" /></a>
						</div>
						<div class="resent-grid-info recommended-grid-info">
							<h3><a href="single.html" class="title title-info">李志</a></h3>

						</div>
					</div>

					<div class="clearfix"> </div>
					<div class="col-md-4 resent-grid recommended-grid slider-top-grids">
						<div class="resent-grid-info recommended-grid-info">
							<h3><a href="singerdata1.jsp" class="title title-info">王力宏</a></h3>
						</div>
					</div>
					<div class="col-md-4 resent-grid recommended-grid slider-top-grids">
						
						<div class="resent-grid-info recommended-grid-info">
							<h3><a href="single.html" class="title title-info">宋冬野</a></h3>
							
						</div>
					</div>
					<div class="col-md-4 resent-grid recommended-grid slider-top-grids">
						
						<div class="resent-grid-info recommended-grid-info">
							<h3><a href="single.html" class="title title-info">朴树</a></h3>
							
						</div>
					</div>
					<div class="col-md-4 resent-grid recommended-grid slider-top-grids">
						
						<div class="resent-grid-info recommended-grid-info">
							<h3><a href="single.html" class="title title-info">李健</a></h3>
							
						</div>
					</div>
					<div class="col-md-4 resent-grid recommended-grid slider-top-grids">
						
						<div class="resent-grid-info recommended-grid-info">
							<h3><a href="single.html" class="title title-info">陈小春</a></h3>
							
						</div>
					</div>
					<div class="clearfix"></div>
					<div class="col-md-4 resent-grid recommended-grid slider-top-grids">
						
						<div class="resent-grid-info recommended-grid-info">
							<h3><a href="single.html" class="title title-info">许嵩</a></h3>
							
						</div>
					</div>
					<div class="col-md-4 resent-grid recommended-grid slider-top-grids">
						
						<div class="resent-grid-info recommended-grid-info">
							<h3><a href="single.html" class="title title-info">张国荣</a></h3>
							
						</div>
					</div>
					<div class="col-md-4 resent-grid recommended-grid slider-top-grids">
						
						<div class="resent-grid-info recommended-grid-info">
							<h3><a href="single.html" class="title title-info">萧敬腾</a></h3>
							
						</div>
					</div>
					<div class="col-md-4 resent-grid recommended-grid slider-top-grids">
						
						<div class="resent-grid-info recommended-grid-info">
							<h3><a href="single.html" class="title title-info">张敬轩</a></h3>
							
						</div>
					</div>
					<div class="col-md-4 resent-grid recommended-grid slider-top-grids">
						
						<div class="resent-grid-info recommended-grid-info">
							<h3><a href="single.html" class="title title-info">古巨基</a></h3>
							
						</div>
					</div>--%>
				</div>

			</div>
		</div>
	</div>
	<div id="page_div" style="position:absolute;right:300px;bottom:-200px;">
		<div class="message">
			共<i class="blue">${pagehelper.total}</i>条记录，当前显示第&nbsp;<i
				class="blue">${pagehelper.pageNum}/${pagehelper.pages}</i>&nbsp;页
		</div>
		<ul class="pagination">
			<c:if test="${!pagehelper.isFirstPage}">
			<li><a href="http://localhost:8080/singer/foreign/male?pageNum=${pagehelper.firstPage}&pageSize=${pagehelper.pageSize}">&lt;&lt;</a></li>
			<li><a href="http://localhost:8080/singer/foreign/male?pageNum=${pagehelper.prePage}&pageSize=${pagehelper.pageSize}">&lt;</a></li>
			</c:if>
			<c:forEach items="${pagehelper.navigatepageNums}" var="navigatepageNum">

				<c:if test="${navigatepageNum==pagehelper.pageNum}">
					<li class="active"><a href="http://localhost:8080/singer/foreign/male?pageNum=${navigatepageNum}&pageSize=${pagehelper.pageSize}">${navigatepageNum}</a></li>
				</c:if>
				<c:if test="${navigatepageNum!=pagehelper.pageNum}">
					<li><a href="http://localhost:8080/singer/foreign/male?pageNum=${navigatepageNum}&pageSize=${pagehelper.pageSize}">${navigatepageNum}</a></li>
				</c:if>
			</c:forEach>
			<c:if test="${!pagehelper.isLastPage}">
				<li><a href="http://localhost:8080/singer/foreign/male?pageNum=${pagehelper.nextPage}&pageSize=${pagehelper.pageSize}">&gt;</a></li>
				<li><a href="http://localhost:8080/singer/foreign/male?pageNum=${pagehelper.lastPage}&pageSize=${pagehelper.pageSize}">&gt;&gt;</a></li>
			</c:if>
		</ul>




	</div>
				
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="http://localhost:8080/resources/js/bootstrap.min.js"></script>
    
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
  </body>
</html>