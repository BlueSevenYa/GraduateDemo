<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					<a href="http://localhost:8080/music/upload">上 传</a>
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
						<h3>歌单</h3>
					</div>
					<c:forEach items="${pagehelper.list}" var="songmenu" varStatus="sm">
						<div class="col-md-4 resent-grid recommended-grid slider-top-grids">
							<div class="resent-grid-img recommended-grid-img">
								<a href="http://localhost:8080/putong/songs/${songmenu.songmenuid}"><img src="http://localhost:8080/musicplat/picture/songmenu/${songmenu.smpicurl}" alt="" /></a>
							</div>
							<div class="resent-grid-info recommended-grid-info">
								<h3><a href="http://localhost:8080/putong/songs/${songmenu.songmenuid}" class="title title-info">${songmenu.name}</a></h3>
								<ul>
									<li><p class="author author-info"><a href="http://localhost:8080/user/home?userid=${songmenu.userid}" class="author">${songmenu.nickname}</a></p></li>
									<li class="right-list"><p class="views views-info">${songmenu.clicktime}人听过</p></li>
								</ul>
							</div>
						</div>
						<c:if test="${sm.index%5==4}">
							<div class="clearfix"></div>
						</c:if>
					</c:forEach>
					<%--<div class="col-md-4 resent-grid recommended-grid slider-top-grids">
						<div class="resent-grid-img recommended-grid-img">
							<a href="single.html"><img src="http://localhost:8080/resources/images/t1.jpg" alt="" /></a>
						</div>
						<div class="resent-grid-info recommended-grid-info">
							<h3><a href="single.html" class="title title-info">愿有人为你深夜温酒，清晨起身煮粥</a></h3>
							<ul>
								<li><p class="author author-info"><a href="#" class="author">user1</a></p></li>
								<li class="right-list"><p class="views views-info">155万人听过</p></li>
							</ul>
						</div>
					</div>
					<div class="col-md-4 resent-grid recommended-grid slider-top-grids">
						<div class="resent-grid-img recommended-grid-img">
							<a href="single.html"><img src="http://localhost:8080/resources/images/t2.jpg" alt="" /></a>
						</div>
						<div class="resent-grid-info recommended-grid-info">
							<h3><a href="single.html" class="title title-info">有些歌从听的那一刻丶就注定了永远</a></h3>
							<ul>
								<li><p class="author author-info"><a href="#" class="author">user2</a></p></li>
								<li class="right-list"><p class="views views-info">104万人听过</p></li>
							</ul>
						</div>
					</div>
					<div class="col-md-4 resent-grid recommended-grid slider-top-grids">
						<div class="resent-grid-img recommended-grid-img">
							<a href="single.html"><img src="http://localhost:8080/resources/images/t3.jpg" alt="" /></a>
						</div>
						<div class="resent-grid-info recommended-grid-info">
							<h3><a href="single.html" class="title title-info">【节奏控】清爽节奏，中毒的旋律循环不止</a></h3>
							<ul>
								<li><p class="author author-info"><a href="#" class="author">user3</a></p></li>
								<li class="right-list"><p class="views views-info">430万人听过</p></li>
							</ul>
						</div>
					</div>
					<div class="col-md-4 resent-grid recommended-grid slider-top-grids">
						<div class="resent-grid-img recommended-grid-img">
							<a href="single.html"><img src="http://localhost:8080/resources/images/t4.jpg" alt="" /></a>
						</div>
						<div class="resent-grid-info recommended-grid-info">
							<h3><a href="single.html" class="title title-info">面对告白第一反应是讨厌？</a></h3>
							<ul>
								<li><p class="author author-info"><a href="#" class="author">user4</a></p></li>
								<li class="right-list"><p class="views views-info">23191人听过</p></li>
							</ul>
						</div>
					</div>
					<div class="col-md-4 resent-grid recommended-grid slider-top-grids">
						<div class="resent-grid-img recommended-grid-img">
							<a href="single.html"><img src="http://localhost:8080/resources/images/t5.jpg" alt="" /></a>
						</div>
						<div class="resent-grid-info recommended-grid-info">
							<h3><a href="single.html" class="title title-info">【华语】婚礼暖场，循环幸福</a></h3>
							<ul>
								<li><p class="author author-info"><a href="#" class="author">user5</a></p></li>
								<li class="right-list"><p class="views views-info">361万人听过</p></li>
							</ul>
						</div>
					</div>
					<div class="clearfix"></div>
					<div class="col-md-4 resent-grid recommended-grid slider-top-grids">
						<div class="resent-grid-img recommended-grid-img">
							<a href="single.html"><img src="http://localhost:8080/resources/images/t6.jpg" alt="" /></a>
						</div>
						<div class="resent-grid-info recommended-grid-info">
							<h3><a href="single.html" class="title title-info">Rapper说情话|突然想闻一闻恋爱的酸臭味</a></h3>
							<ul>
								<li><p class="author author-info"><a href="#" class="author">user6</a></p></li>
								<li class="right-list"><p class="views views-info">425万人听过</p></li>
							</ul>
						</div>
					</div>
					<div class="col-md-4 resent-grid recommended-grid slider-top-grids">
						<div class="resent-grid-img recommended-grid-img">
							<a href="single.html"><img src="http://localhost:8080/resources/images/t7.jpg" alt="" /></a>
						</div>
						<div class="resent-grid-info recommended-grid-info">
							<h3><a href="single.html" class="title title-info">我在南方三十度，你在北方穿秋裤</a></h3>
							<ul>
								<li><p class="author author-info"><a href="#" class="author">user7</a></p></li>
								<li class="right-list"><p class="views views-info">277万人听过</p></li>
							</ul>
						</div>
					</div>
					<div class="col-md-4 resent-grid recommended-grid slider-top-grids">
						<div class="resent-grid-img recommended-grid-img">
							<a href="single.html"><img src="http://localhost:8080/resources/images/t8.jpg" alt="" /></a>
						</div>
						<div class="resent-grid-info recommended-grid-info">
							<h3><a href="single.html" class="title title-info">【史诗配乐】用钢琴奏响华丽的悲壮史诗</a></h3>
							<ul>
								<li><p class="author author-info"><a href="#" class="author">user8</a></p></li>
								<li class="right-list"><p class="views views-info">765万人听过</p></li>
							</ul>
						</div>
					</div>
					<div class="col-md-4 resent-grid recommended-grid slider-top-grids">
						<div class="resent-grid-img recommended-grid-img">
							<a href="single.html"><img src="http://localhost:8080/resources/images/t9.jpg" alt="" /></a>
						</div>
						<div class="resent-grid-info recommended-grid-info">
							<h3><a href="single.html" class="title title-info">有些歌不舍得删，有些人不舍得忘</a></h3>
							<ul>
								<li><p class="author author-info"><a href="#" class="author">user9</a></p></li>
								<li class="right-list"><p class="views views-info">62482人听过</p></li>
							</ul>
						</div>
					</div>
					<div class="col-md-4 resent-grid recommended-grid slider-top-grids">
						<div class="resent-grid-img recommended-grid-img">
							<a href="single.html"><img src="http://localhost:8080/resources/images/t10.jpg" alt="" /></a>
						</div>
						<div class="resent-grid-info recommended-grid-info">
							<h3><a href="single.html" class="title title-info">不插电|只需一架钢琴便能深情演绎</a></h3>
							<ul>
								<li><p class="author author-info"><a href="#" class="author">user10</a></p></li>
								<li class="right-list"><p class="views views-info">140万人听过</p></li>
							</ul>
						</div>
					</div>

					<div class="clearfix"> </div>--%>
				</div>
			</div>
		</div>
	<div id="page_div" style="position:absolute;right:300px;bottom:-100px;">
		<div class="message">
			共<i class="blue">${pagehelper.total}</i>条记录，当前显示第&nbsp;<i
				class="blue">${pagehelper.pageNum}/${pagehelper.pages}</i>&nbsp;页
		</div>
		<ul class="pagination">
			<c:if test="${!pagehelper.isFirstPage}">
				<li><a href="http://localhost:8080/songmenu/getallist?pageNum=${pagehelper.firstPage}&pageSize=${pagehelper.pageSize}">&lt;&lt;</a></li>
				<li><a href="http://localhost:8080/songmenu/getallist?pageNum=${pagehelper.prePage}&pageSize=${pagehelper.pageSize}">&lt;</a></li>
			</c:if>
			<c:forEach items="${pagehelper.navigatepageNums}" var="navigatepageNum">

				<c:if test="${navigatepageNum==pagehelper.pageNum}">
					<li class="active"><a href="http://localhost:8080/songmenu/getallist?pageNum=${navigatepageNum}&pageSize=${pagehelper.pageSize}">${navigatepageNum}</a></li>
				</c:if>
				<c:if test="${navigatepageNum!=pagehelper.pageNum}">
					<li><a href="http://localhost:8080/songmenu/getallist?pageNum=${navigatepageNum}&pageSize=${pagehelper.pageSize}">${navigatepageNum}</a></li>
				</c:if>
			</c:forEach>
			<c:if test="${!pagehelper.isLastPage}">
				<li><a href="http://localhost:8080/songmenu/getallist?pageNum=${pagehelper.nextPage}&pageSize=${pagehelper.pageSize}">&gt;</a></li>
				<li><a href="http://localhost:8080/songmenu/getallist?pageNum=${pagehelper.lastPage}&pageSize=${pagehelper.pageSize}">&gt;&gt;</a></li>
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