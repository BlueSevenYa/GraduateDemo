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

	<script>

        function dealRepeat() {
            $.ajax({
                type : "post",
                dataType : 'json',
                url : "<%=path%>/user/validaterepeat",
                data : "username="+$("#userregisterusername").val(),
                success : function (data) {
                    if(data.successCode==1){
                        $("#validateusername").text("该用户名你可以使用");
                    }else{
                        $("#validateusername").text("请试试其他用户名");

                    }

                }
            });
        }
        function userregister() {
            var username=$("#userregisterusername").val();
            var password=$("#userregisterpassword").val();
            console.log(username+"=========="+password);
            var params ={"username":username,
                "password":password};
            $.ajax({
                type: 'post',
                url: '<%=path%>/user/register',

                dataType:"json",
                data: params,
                success: function (data) {
                    if(data.successCode==1){
                        var text='<div class="myhome"> '+'<a href="http://localhost:8080/user/home?userid='+data.userid+'">'+'<img src="http://localhost:8080/musicplat/picture/headpic/'+data.userpicurl+'"/></a></div>';
                        $("#small-dialog").empty();
                        $("#small-dialog").append(data.content);
                        $("div").remove(".signin");
                        $("#uploadfile").after(text);
                    }
                    if(data.successCode==0){
                        $("#resultforreg").text("注册失败");
					}
                }
            });
        }
        function userlogin() {
            /*
            * 2017.11.20近乎完美解决异步登录问题，但是最好但登录之后能够将原来的弹窗替换成一个登录成功的提示
            * */
            var username=$("#username").val();
            var password=$("#password").val();
            console.log(username+"=="+password);
            var params ={"username":$("#username").val(),
                "password":$("#password").val()};
            $.ajax({
                type: 'post',
                url: '<%=path%>/user/login',

                dataType:"json",
                data: params,
                success: function (data) {
                    console.log(data.successCode);
                    console.log(data.userpicurl);
                    console.log(data.userid);
                    if(data.successCode==1){
                        var text='<div class="myhome"> '+'<a href="http://localhost:8080/user/home?userid='+data.userid+'">'+'<img src="http://localhost:8080/musicplat/picture/headpic/'+data.userpicurl+'"/></a></div>';
                        $("#small-dialog").empty();
                        $("#small-dialog").append(data.content);
                        $("div").remove(".signin");
						$("#uploadfile").after(text);
                    }else{
                        alert("登录失败，请检查后再输入");

                    }
                }
            });
        }
	</script>

	<style type="text/css">

		div.file1
		{

			display:none;
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
				<div class="file" id="uploadfile">
					<a href="http://localhost:8080/music/upload">上 传</a>
				</div>

				<script type="text/javascript">
                    $(function () {
                        $(".myhome").mouseover(function(){
                            $(".file1").slideDown("slow");
							//alert("mouseover");
                        });

                    });
				</script>
				<c:choose>
					<c:when test="${not empty sessionScope.get('user')}">

						<div class="myhome">
							<a href="http://localhost:8080/user/home?userid=${sessionScope.get('user').userid}">
								<img src="http://localhost:8080/musicplat/picture/headpic/${sessionScope.get('user').userpicurl}" />
							</a>
						</div>
						<div class="file1" id="uploadfile1">
							<a href="http://localhost:8080/user/signout">退 出</a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="signin">
							<a href="#small-dialog2" class="play-icon popup-with-zoom-anim">注 册</a>
							<!-- pop-up-box -->
							<script type="text/javascript" src="http://localhost:8080/resources/js/modernizr.custom.min.js"></script>
							<link href="http://localhost:8080/resources/css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
							<script src="http://localhost:8080/resources/js/jquery.magnific-popup.js" type="text/javascript"></script>
							<!--//pop-up-box -->
							<div id="small-dialog2" class="mfp-hide">
								<h3>创建账号</h3>
								<div class="social-sits">
									<!--<div class="button-bottom">
                                        <p>已有账号？<a href="#small-dialog" class="play-icon popup-with-zoom-anim">登录</a></p>
                                    </div>-->
								</div>
								<div class="signup">
										<p style="color: red;font-size: 20px" id="resultforreg"></p>
										<input type="text" id="userregisterusername" class="email" placeholder="设置昵称 字母开头 只包含数字、下划线 且不少于5位" required="required" pattern="([A-Za-z][A-Za-z0-9_]{4,16})?" title="请输入有效的昵称" onblur="dealRepeat()"/>
										<span id="validateusername"></span>
										<input type="password" id="userregisterpassword" placeholder="设置密码 不少于6位" required="required" pattern=".{6,}" title="请输入有效的密码" autocomplete="off" />
										<br />
										<input type="submit" value="注 册" onclick="userregister()"/>


									<div class="button-bottom">
										<a href="#small-dialog" class="hvr-shutter-out-horizontal play-icon popup-with-zoom-anim">已有账号？登录</a>
									</div>
								</div>
								<div class="clearfix"> </div>
							</div>
							<div id="small-dialog3" class="mfp-hide">
								<h3>注册成功</h3>
								<div class="social-sits">
									<!--<div class="button-bottom">
                                        <p>已有账号？ <a href="#small-dialog" class="play-icon popup-with-zoom-anim">登 录</a></p>
                                    </div>-->
								</div>
								<div class="signup">
									<form>
										<input type="text" class="email" placeholder="昵称" required="required" pattern="([A-Za-z][A-Za-z0-9_]{4,16})?" title="请输入正确的昵称"/>
										<input type="password" placeholder="登录密码" required="required" pattern=".{6,}" title="请输入正确的密码" autocomplete="off" />
										<br />
										<input type="submit"  value="登 录"/>
									</form>

								</div>
								<div class="clearfix"> </div>
							</div>
							<div id="small-dialog7" class="mfp-hide">
								<h3>创建账号</h3>
								<div class="button-bottom">
									<p>已有账号？<a href="#small-dialog" class="play-icon popup-with-zoom-anim">登 录</a></p>
								</div>

								<div class="signup">
									<form action="upload.html">
										<input type="text" class="email" placeholder="昵称" required="required" pattern="([A-Za-z][A-Za-z0-9_]{4,16})?" title="请输入正确的昵称"/>
										<input type="password" placeholder="登录密码" required="required" pattern=".{6,}" title="请输入正确的密码" autocomplete="off" />
										<input type="submit"  value="登 录"/>
									</form>
								</div>

								<div class="clearfix"> </div>
							</div>
							<script>
                                $(document).ready(function() {
                                    $('.popup-with-zoom-anim').magnificPopup({
                                        type: 'inline',
                                        fixedContentPos: false,
                                        fixedBgPos: true,
                                        overflowY: 'auto',
                                        closeBtnInside: true,
                                        preloader: false,
                                        midClick: true,
                                        removalDelay: 300,
                                        mainClass: 'my-mfp-zoom-in'
                                    });

                                });
							</script>

						</div>
						<div class="signin">
							<a href="#small-dialog" class="play-icon popup-with-zoom-anim">登 录</a>
							<div id="small-dialog" class="mfp-hide">
								<h3>&nbsp;登 录</h3>
									<%--
                                    <h3>&nbsp;欢迎回来admin</h3>
                                    <img src="images/1.jpg" width="200px" hight="200px">--%>
								<div class="social-sits">
									<!--<div class="button-bottom">
                                        <p>新建账号？ <a href="#small-dialog2" class="play-icon popup-with-zoom-anim">注册</a></p>
                                    </div>-->
								</div>
								<div class="signup">

									<input type="text" class="email" id="username" name="username" placeholder="昵称" required="required" pattern="([A-Za-z][A-Za-z0-9_]{4,16})?" title="请输入正确的昵称"/>
									<input type="password" id="password" name="password" placeholder="登录密码" required="required" pattern=".{6,}" title="请输入正确的密码" autocomplete="off" />
									<br />
									<input type="submit"  value="登 录" onclick="userlogin()"/>

									<div class="button-bottom">
										<a href="#small-dialog2" class="hvr-shutter-out-horizontal play-icon popup-with-zoom-anim">注册账号</a>
									</div>
									<!--<div class="forgot">
                                        <a href="#">忘记密码？</a>
                                    </div>-->
								</div>
								<div class="clearfix"> </div>
							</div>
						</div>
					</c:otherwise>

				</c:choose>


				<div class="clearfix"> </div>
			</div>
        </div>
		<div class="clearfix"> </div>
      </div>
    </nav>
	<div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >企业网站模板</a></div>
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
					<%--<li><a href="http://localhost:8080/music/ranking" class="ranking-icon"><span class="glyphicon glyphicon-home glyphicon-hourglass" aria-hidden="true"></span>排行榜</a></li>--%>
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
					</ul>
					<!-- script-for-menu -->
						<script>
							$( ".top-navigation" ).click(function() {
							$( ".drop-navigation" ).slideToggle( 300, function() {
							// Animation complete.
							});
							});
						</script>

				</div>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<div class="main-grids">
				<div class="top-grids">
					<div class="recommended-info">
						<h3>热门推荐</h3>
					</div>
					<c:forEach items="${indexSongMenuVos}" var="songmenu" varStatus="sm">
						<div class="col-md-4 resent-grid recommended-grid slider-top-grids">
							<div class="resent-grid-img recommended-grid-img">
								<a href="http://localhost:8080/putong/songs/${songmenu.songmenuid}"><img src="http://localhost:8080/musicplat/picture/songmenu/${songmenu.smpicurl}" alt="" height="116px" /></a>
							</div>
							<div class="resent-grid-info recommended-grid-info">
								<h3><a href="http://localhost:8080/putong/songs/${songmenu.songmenuid}" class="title title-info">${songmenu.name}</a></h3>
								<ul>
									<li><p class="author author-info"><a href="http://localhost:8080/user/home?userid=${songmenu.userid}" class="author">${songmenu.nickname}</a></p></li>
									<li class="right-list"><p class="views views-info">${songmenu.clicktime}人听过</p></li>
								</ul>
							</div>
						</div>
						<c:if test="${sm.index==4}">
							<div class="clearfix"></div>
						</c:if>
					</c:forEach>
					<%--<div class="col-md-4 resent-grid recommended-grid slider-top-grids">
                        <div class="resent-grid-img recommended-grid-img">
                            <a href="single.html"><img src="images/t2.jpg" alt="" /></a>
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
                            <a href="single.html"><img src="images/t3.jpg" alt="" /></a>
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
                            <a href="single.html"><img src="images/t4.jpg" alt="" /></a>
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
                            <a href="single.html"><img src="images/t5.jpg" alt="" /></a>
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
                            <a href="single.html"><img src="images/t6.jpg" alt="" /></a>
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
                            <a href="single.html"><img src="images/t7.jpg" alt="" /></a>
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
                            <a href="single.html"><img src="images/t8.jpg" alt="" /></a>
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
                            <a href="single.html"><img src="images/t9.jpg" alt="" /></a>
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
                            <a href="single.html"><img src="images/t10.jpg" alt="" /></a>
                        </div>
                        <div class="resent-grid-info recommended-grid-info">
                            <h3><a href="single.html" class="title title-info">不插电|只需一架钢琴便能深情演绎</a></h3>
                            <ul>
                                <li><p class="author author-info"><a href="#" class="author">user10</a></p></li>
                                <li class="right-list"><p class="views views-info">140万人听过</p></li>
                            </ul>
                        </div>
                    </div>--%>
					<div class="clearfix"> </div>
				</div>
				<div class="recommended">
					<div class="recommended-grids">
						<div class="recommended-info">
							<h3>新碟上架</h3>
						</div>
						<script src="<%=basePath%>resources/js/responsiveslides.min.js"></script>
						<script>
                            // You can also use "$(window).load(function() {"
                            $(function () {
                                // Slideshow 4
                                $("#slider3").responsiveSlides({
                                    auto: true,
                                    pager: false,
                                    nav: true,
                                    speed: 500,
                                    namespace: "callbacks",
                                    before: function () {
                                        $('.events').append("<li>before event fired.</li>");
                                    },
                                    after: function () {
                                        $('.events').append("<li>after event fired.</li>");
                                    }
                                });

                            });
						</script>
						<div  id="top" class="callbacks_container">
							<ul class="rslides" id="slider3">
								<c:forEach items="indexSongVos" var="song" varStatus="s">
									<li>
										<div class="animated-grids">

											<div class="col-md-3 resent-grid recommended-grid slider-first">
												<div class="resent-grid-img recommended-grid-img">
													<a href="http://localhost:8080/song/listen?songid=${indexSongVos[s.index].songid}" songid="${indexSongVos[s.index].songid}" class="songclick"><img src="http://localhost:8080/musicplat/picture/song/${indexSongVos[s.index].songpicurl}" alt="" width="262px"/></a>

												</div>
												<div class="resent-grid-info recommended-grid-info">
													<h5><a href="http://localhost:8080/song/listen?songid=${indexSongVos[s.index].songid}" class="title">${indexSongVos[s.index].name}</a></h5>
													<div class="slid-bottom-grids">
														<div class="slid-bottom-grid">
															<p class="author author-info"><a href="http://localhost:8080/singer/show/${indexSongVos[s.index].singerid}" class="author">${indexSongVos[s.index].singername}</a></p>
														</div>
														<div class="clearfix"> </div>
													</div>
												</div>
											</div>

											<div class="col-md-3 resent-grid recommended-grid slider-first">
												<div class="resent-grid-img recommended-grid-img">
													<a href="http://localhost:8080/song/listen?songid=${indexSongVos[s.index+1].songid}" songid="${indexSongVos[s.index+1].songid}" class="songclick"><img src="http://localhost:8080/musicplat/picture/song/${indexSongVos[s.index+1].songpicurl}" alt="" height="262px"/></a>

												</div>
												<div class="resent-grid-info recommended-grid-info">
													<h5><a href="http://localhost:8080/song/listen?songid=${indexSongVos[s.index+1].songid}" class="title">${indexSongVos[s.index+1].name}</a></h5>
													<div class="slid-bottom-grids">
														<div class="slid-bottom-grid">
															<p class="author author-info"><a href="http://localhost:8080/singer/show/${indexSongVos[s.index+1].singerid}" class="author">${indexSongVos[s.index+1].singername}</a></p>
														</div>
														<div class="clearfix"> </div>
													</div>
												</div>
											</div>
											<div class="col-md-3 resent-grid recommended-grid slider-first">
												<div class="resent-grid-img recommended-grid-img">
													<a href="http://localhost:8080/song/listen?songid=${indexSongVos[s.index+2].songid}" songid="${indexSongVos[s.index+2].songid}" class="songclick"><img src="http://localhost:8080/musicplat/picture/song/${indexSongVos[s.index+2].songpicurl}" alt="" height="262px"/></a>

												</div>
												<div class="resent-grid-info recommended-grid-info">
													<h5><a href="http://localhost:8080/song/listen?songid=${indexSongVos[s.index+2].songid}" class="title">${indexSongVos[s.index+2].name}</a></h5>
													<div class="slid-bottom-grids">
														<div class="slid-bottom-grid">
															<p class="author author-info"><a href="http://localhost:8080/singer/show/${indexSongVos[s.index+2].singerid}" class="author">${indexSongVos[s.index+2].singername}</a></p>
														</div>
														<div class="clearfix"> </div>
													</div>
												</div>
											</div>
											<div class="col-md-3 resent-grid recommended-grid slider-first">
												<div class="resent-grid-img recommended-grid-img">
													<a href="http://localhost:8080/song/listen?songid=${indexSongVos[s.index+3].songid}" songid="${indexSongVos[s.index+3].songid}" class="songclick"><img src="http://localhost:8080/musicplat/picture/song/${indexSongVos[s.index+3].songpicurl}" alt="" height="262px"/></a>

												</div>
												<div class="resent-grid-info recommended-grid-info">
													<h5><a href="http://localhost:8080/song/listen?songid=${indexSongVos[s.index+3].songid}" class="title">${indexSongVos[s.index+3].name}</a></h5>
													<div class="slid-bottom-grids">
														<div class="slid-bottom-grid">
															<p class="author author-info"><a href="http://localhost:8080/singer/show/${indexSongVos[s.index+3].singerid}" class="author">${indexSongVos[s.index+3].singername}</a></p>
														</div>
														<div class="clearfix"> </div>
													</div>
												</div>
											</div>
											<div class="clearfix"> </div>
										</div>
									</li>
									<li>
										<div class="animated-grids">

											<div class="col-md-3 resent-grid recommended-grid slider-first">
												<div class="resent-grid-img recommended-grid-img">
													<a href="http://localhost:8080/song/listen?songid=${indexSongVos[s.index+4].songid}" songid="${indexSongVos[s.index+4].songid}" class="songclick"><img src="http://localhost:8080/musicplat/picture/song/${indexSongVos[s.index+4].songpicurl}" alt="" height="262px"/></a>

												</div>
												<div class="resent-grid-info recommended-grid-info">
													<h5><a href="http://localhost:8080/song/listen?songid=${indexSongVos[s.index+4].songid}" class="title">${indexSongVos[s.index+4].name}</a></h5>
													<div class="slid-bottom-grids">
														<div class="slid-bottom-grid">
															<p class="author author-info"><a href="http://localhost:8080/singer/show/${indexSongVos[s.index+4].singerid}" class="author">${indexSongVos[s.index+4].singername}</a></p>
														</div>
														<div class="clearfix"> </div>
													</div>
												</div>
											</div>

											<div class="col-md-3 resent-grid recommended-grid slider-first">
												<div class="resent-grid-img recommended-grid-img">
													<a href="http://localhost:8080/song/listen?songid=${indexSongVos[s.index+5].songid}" songid="${indexSongVos[s.index+5].songid}" class="songclick"><img src="http://localhost:8080/musicplat/picture/song/${indexSongVos[s.index+5].songpicurl}" alt="" height="262px"/></a>

												</div>
												<div class="resent-grid-info recommended-grid-info">
													<h5><a href="http://localhost:8080/song/listen?songid=${indexSongVos[s.index+5].songid}" class="title">${indexSongVos[s.index+5].name}</a></h5>
													<div class="slid-bottom-grids">
														<div class="slid-bottom-grid">
															<p class="author author-info"><a href="http://localhost:8080/singer/show/${indexSongVos[s.index+5].singerid}" class="author">${indexSongVos[s.index+5].singername}</a></p>
														</div>
														<div class="clearfix"> </div>
													</div>
												</div>
											</div>
											<div class="col-md-3 resent-grid recommended-grid slider-first">
												<div class="resent-grid-img recommended-grid-img">
													<a href="http://localhost:8080/song/listen?songid=${indexSongVos[s.index+6].songid}" songid="${indexSongVos[s.index+6].songid}" class="songclick"><img src="http://localhost:8080/musicplat/picture/song/${indexSongVos[s.index+6].songpicurl}" alt="" height="262px"/></a>

												</div>
												<div class="resent-grid-info recommended-grid-info">
													<h5><a href="http://localhost:8080/song/listen?songid=${indexSongVos[s.index+6].songid}" class="title">${indexSongVos[s.index+6].name}</a></h5>
													<div class="slid-bottom-grids">
														<div class="slid-bottom-grid">
															<p class="author author-info"><a href="http://localhost:8080/singer/show/${indexSongVos[s.index+6].singerid}" class="author">${indexSongVos[s.index+6].singername}</a></p>
														</div>
														<div class="clearfix"> </div>
													</div>
												</div>
											</div>
											<div class="col-md-3 resent-grid recommended-grid slider-first">
												<div class="resent-grid-img recommended-grid-img">
													<a href="http://localhost:8080/song/listen?songid=${indexSongVos[s.index+7].songid}" songid="${indexSongVos[s.index+7].songid}" class="songclick"><img src="http://localhost:8080/musicplat/picture/song/${indexSongVos[s.index+7].songpicurl}" alt="" height="262px"/></a>

												</div>
												<div class="resent-grid-info recommended-grid-info">
													<h5><a href="http://localhost:8080/song/listen?songid=${indexSongVos[s.index+7].songid}" class="title">${indexSongVos[s.index+7].name}</a></h5>
													<div class="slid-bottom-grids">
														<div class="slid-bottom-grid">
															<p class="author author-info"><a href="http://localhost:8080/singer/show/${indexSongVos[s.index+7].singerid}" class="author">${indexSongVos[s.index+7].singername}</a></p>
														</div>
														<div class="clearfix"> </div>
													</div>
												</div>
											</div>
											<div class="clearfix"> </div>
										</div>
									</li>
								</c:forEach>
								<script>
                                    $(function () {
                                        $("a.songclick").click(function () {
                                            var val=$(this).attr("songid");
                                            //alert(val);
                                            console.log(val);
                                            var params ={"songid":val};
                                            $.ajax({
                                                type: 'post',
                                                url: '<%=path%>/song/addclicktime',

                                                dataType:"json",
                                                data: params,
                                            });
                                        })

                                    })
								</script>
								<%--<li>
                                    <div class="animated-grids">
                                        <div class="col-md-3 resent-grid recommended-grid slider-first">
                                            <div class="resent-grid-img recommended-grid-img">
                                                <a href="single.html"><img src="images/c1.jpg" alt="" /></a>
                                            </div>
                                            <div class="resent-grid-info recommended-grid-info">
                                                <h5><a href="single.html" class="title">偶像</a></h5>
                                                <div class="slid-bottom-grids">
                                                    <div class="slid-bottom-grid">
                                                        <p class="author author-info"><a href="#" class="author">金玟岐</a></p>
                                                    </div>
                                                    <div class="clearfix"> </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3 resent-grid recommended-grid slider-first">
                                            <div class="resent-grid-img recommended-grid-img">
                                                <a href="single.html"><img src="images/c2.jpg" alt="" /></a>
                                            </div>
                                            <div class="resent-grid-info recommended-grid-info">
                                                <h5><a href="single.html" class="title">仍是少年</a></h5>
                                                <div class="slid-bottom-grids">
                                                    <div class="slid-bottom-grid">
                                                        <p class="author author-info"><a href="#" class="author">西瓜JUN</a></p>
                                                    </div>
                                                    <div class="clearfix"> </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3 resent-grid recommended-grid slider-first">
                                            <div class="resent-grid-img recommended-grid-img">
                                                <a href="single.html"><img src="images/c3.jpg" alt="" /></a>
                                            </div>
                                            <div class="resent-grid-info recommended-grid-info">
                                                <h5><a href="single.html" class="title">那年花开月正圆</a></h5>
                                                <div class="slid-bottom-grids">
                                                    <div class="slid-bottom-grid">
                                                        <p class="author author-info"><a href="#" class="author">群星</a></p>
                                                    </div>
                                                    <div class="clearfix"> </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3 resent-grid recommended-grid slider-first">
                                            <div class="resent-grid-img recommended-grid-img">
                                                <a href="single.html"><img src="images/c.jpg" alt="" /></a>
                                            </div>
                                            <div class="resent-grid-info recommended-grid-info">
                                                <h5><a href="single.html" class="title">How Long</a></h5>
                                                <div class="slid-bottom-grids">
                                                    <div class="slid-bottom-grid">
                                                        <p class="author author-info"><a href="#" class="author">Charlie Puth</a></p>
                                                    </div>
                                                    <div class="clearfix"> </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"> </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="animated-grids">
                                        <div class="col-md-3 resent-grid recommended-grid slider-first">
                                            <div class="resent-grid-img recommended-grid-img">
                                                <a href="single.html"><img src="images/c2.jpg" alt="" /></a>
                                            </div>
                                            <div class="resent-grid-info recommended-grid-info">
                                                <h5><a href="single.html" class="title">仍是少年</a></h5>
                                                <div class="slid-bottom-grids">
                                                    <div class="slid-bottom-grid">
                                                        <p class="author author-info"><a href="#" class="author">西瓜JUN</a></p>
                                                    </div>
                                                    <div class="clearfix"> </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3 resent-grid recommended-grid slider-first">
                                            <div class="resent-grid-img recommended-grid-img">
                                                <a href="single.html"><img src="images/c3.jpg" alt="" /></a>
                                                <div class="clck small-clck">
                                                    <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                                                </div>
                                            </div>
                                            <div class="resent-grid-info recommended-grid-info">
                                                <h5><a href="single.html" class="title">那年花开月正圆</a></h5>
                                                <div class="slid-bottom-grids">
                                                    <div class="slid-bottom-grid">
                                                        <p class="author author-info"><a href="#" class="author">群星</a></p>
                                                    </div>
                                                    <div class="clearfix"> </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3 resent-grid recommended-grid slider-first">
                                            <div class="resent-grid-img recommended-grid-img">
                                                <a href="single.html"><img src="images/c.jpg" alt="" /></a>
                                                <div class="clck small-clck">
                                                    <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                                                </div>
                                            </div>
                                            <div class="resent-grid-info recommended-grid-info">
                                                <h5><a href="single.html" class="title">How Long</a></h5>
                                                <div class="slid-bottom-grids">
                                                    <div class="slid-bottom-grid">
                                                        <p class="author author-info"><a href="#" class="author">Charlie Puth</a></p>
                                                    </div>
                                                    <div class="clearfix"> </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3 resent-grid recommended-grid slider-first">
                                            <div class="resent-grid-img recommended-grid-img">
                                                <a href="single.html"><img src="images/c3.jpg" alt="" /></a>
                                                <div class="clck small-clck">
                                                    <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                                                </div>
                                            </div>
                                            <div class="resent-grid-info recommended-grid-info">
                                                <h5><a href="single.html" class="title">那年花开月正圆</a></h5>
                                                <div class="slid-bottom-grids">
                                                    <div class="slid-bottom-grid">
                                                        <p class="author author-info"><a href="#" class="author">群星</a></p>
                                                    </div>
                                                    <div class="clearfix"> </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"> </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="animated-grids">
                                        <div class="col-md-3 resent-grid recommended-grid slider-first">
                                            <div class="resent-grid-img recommended-grid-img">
                                                <a href="single.html"><img src="images/c3.jpg" alt="" /></a>
                                                <div class="clck small-clck">
                                                    <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                                                </div>
                                            </div>
                                            <div class="resent-grid-info recommended-grid-info">
                                                <h5><a href="single.html" class="title">那年花开月正圆</a></h5>
                                                <div class="slid-bottom-grids">
                                                    <div class="slid-bottom-grid">
                                                        <p class="author author-info"><a href="#" class="author">群星</a></p>
                                                    </div>
                                                    <div class="clearfix"> </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3 resent-grid recommended-grid slider-first">
                                            <div class="resent-grid-img recommended-grid-img">
                                                <a href="single.html"><img src="images/c.jpg" alt="" /></a>
                                                <div class="clck small-clck">
                                                    <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                                                </div>
                                            </div>
                                            <div class="resent-grid-info recommended-grid-info">
                                                <h5><a href="single.html" class="title">How Long</a></h5>
                                                <div class="slid-bottom-grids">
                                                    <div class="slid-bottom-grid">
                                                        <p class="author author-info"><a href="#" class="author">Charlie Puth</a></p>
                                                    </div>
                                                    <div class="clearfix"> </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3 resent-grid recommended-grid slider-first">
                                            <div class="resent-grid-img recommended-grid-img">
                                                <a href="single.html"><img src="images/c1.jpg" alt="" /></a>
                                            </div>
                                            <div class="resent-grid-info recommended-grid-info">
                                                <h5><a href="single.html" class="title">偶像</a></h5>
                                                <div class="slid-bottom-grids">
                                                    <div class="slid-bottom-grid">
                                                        <p class="author author-info"><a href="#" class="author">金玟岐</a></p>
                                                    </div>
                                                    <div class="clearfix"> </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3 resent-grid recommended-grid slider-first">
                                            <div class="resent-grid-img recommended-grid-img">
                                                <a href="single.html"><img src="images/c2.jpg" alt="" /></a>
                                            </div>
                                            <div class="resent-grid-info recommended-grid-info">
                                                <h5><a href="single.html" class="title">仍是少年</a></h5>
                                                <div class="slid-bottom-grids">
                                                    <div class="slid-bottom-grid">
                                                        <p class="author author-info"><a href="#" class="author">西瓜JUN</a></p>
                                                    </div>
                                                    <div class="clearfix"> </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"> </div>
                                    </div>
                                </li>--%>
							</ul>
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