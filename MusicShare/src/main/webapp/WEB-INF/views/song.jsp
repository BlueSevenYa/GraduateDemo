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
<title>${song.name}</title>
	<%--<base href="<%=basePath%>resources/">--%>
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
<style type="text/css">
	.audio{width: 118px;height: 90px;position: absolute;left: 0;top: 0;}
	div#lyric-content{
		width:300px;
		height:400px;
		overflow: scroll;
	}
</style>
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
	<div class="copyrights"> <a href="http://www.cssmoban.com/" ></a></div>
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
				<div class="g-bd">
					<div class="g-wrap6">
						<div class="m-lycifo"">
							<div class="f-cb">
								<div class="cvrwrap f-cb f-pr">
									<div class="u-cover u-cover-6 f-fl">
										<a href="javascript:playPause();"><img src="http://localhost:8080/musicplat/picture/song/${song.songpicurl}" id="musico_btn"/></a>
										<audio id="musico" controls="controls">
											<source src="http://localhost:8080/musicplat/song/${song.mp3url}" type="audio/mp3"></source>
										</audio>
									</div>
									<span class="msk f-alpha"></span>
								</div>
								<div class="cnt">
									<div class="tit">
										<em class="f-ff2">${song.name}</em>
									</div>
									<p class="des s-fc4">
										歌手：
										<span title="${singer.name}">
											<a class="s-fc7" href="singerdata1.jsp">${singer.name}</a>
										</span>
									</p>
									<div id="lyric-content" class="bd bd-open f-brk f-ib",copy-form>
										${song.lyric}
									</div>
								</div>
							</div>
						</div>
						<div class="n-cmt" id="comment-box">
							<div class="comments">
								<div class="u-title u-title-1">
									<h3>
										<span class="f-ff2">评论</span>
									</h3>
								</div>
								<div class="m-cmmt">
									<div class="iptarea">

										<c:choose>
											<c:when test="${not empty sessionScope.get('user')}">
												<div class="head">
													<a href="http://localhost:8080/user/home?userid=${sessionScope.get('user').userid}">
														<img src="http://localhost:8080/musicplat/picture/headpic/${sessionScope.get('user').userpicurl}" />
													</a>
												</div>
											</c:when>
											<c:otherwise>
												<div class="head">
													<a href="http://localhost:8080/index">
														<img src="http://localhost:8080/resources/images/head1.jpg" />
													</a>
												</div>
											</c:otherwise>
										</c:choose>
										<div class="j-flag">
											<div class="m-cmmtipt f-cb f-pr">
												<div class="u-txtwrap holder-parent f-pr" style="display: block;">
													<textarea class="u-txt area j-flag" placeholder="评论" id="comment"></textarea>
												</div>
												<div class="btns f-cb f-pr">
													<a class="btn u-btn u-btn-1 j-flag" onclick="publishcomment()" songid="${song.songid}" id="publishcomment">评论</a>
													<span class="zs s-fc4 j-flag">140</span>
												</div>
												<script>
													function publishcomment() {
														console.log($("#publishcomment").attr("songid"));
														console.log($("#comment").val());
                                                        var params ={"songid":$("#publishcomment").attr("songid"),
                                                            "content":$("#comment").val()};
                                                        $.ajax({
                                                            type: 'post',
                                                            url: '<%=path%>/song/addsongcomment',

                                                            dataType:"json",
                                                            data: params,
                                                            success: function (data) {
                                                                if(data.successCode==1){
                                                                    console.log("成功");
                                                                    $("#comment").val('');
                                                                    $("#commentlist").prepend('<div class="itm"> <div class="head"></div> <div class="cntwrap">' +
                                                                        '<div class><div class="cnt f-brk"><a href="http://localhost:8080/user/home?' +
                                                                        'userid='+data.songcommentvo.userid+'" class="s-fc7">'+data.songcommentvo.nickname+'</a>:'+data.songcommentvo.comment+' </div>' +
                                                                        ' </div> <div class="rp"> <div class="time s-fc4">'+data.songcommentvo.public_date+'</div> </div> </div> </div>');

                                                                }

                                                            }
                                                        });
                                                    }
												</script>
											</div>
										</div>
									</div>
									<div class="cmmts j-flag">
										<h3 class="u-hd4">精彩评论</h3>
										<div id="commentlist">
										<c:choose>
											<c:when test="${not empty songCommentVos}">
												<c:forEach items="${songCommentVos}" var="songcomment">
												<div class="itm">
													<div class="head">

													</div>
													<div class="cntwrap">
														<div class>
															<div class="cnt f-brk">
																<a href="http://localhost:8080/user/home?userid=${songcomment.userid}" class="s-fc7">${songcomment.nickname}</a>
																:${songcomment.comment}
															</div>
														</div>
														<div class="rp">
															<div class="time s-fc4"><fmt:formatDate value="${songcomment.comment_date}" pattern="yyyy年MM月dd日"/></div>
														</div>
													</div>
												</div>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<div class="itm">
													<div class="head">

													</div>
													<div class="cntwrap">
														<div>暂时没有精彩评论</div>
													</div>
												</div>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					
				</div>		
			</div>
				
				
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="http://localhost:8080/resources/js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
  </body>
  
</html>
<script type="text/javascript">
  	function playPause() { 
    var music = document.getElementById('musico'); 
    var music_btn = document.getElementById('musico_btn'); 
    if (music.paused){ 
        music.play(); 
    } 
    else{ 
        music.pause(); 
    } 
} 
  </script>