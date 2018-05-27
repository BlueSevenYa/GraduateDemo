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
<title>${singer.name}</title>
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
<style>
html{font-family:sans-serif;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%}body{margin:0}article,aside,details,figcaption,figure,footer,header,hgroup,main,nav,section,summary{display:block}audio,canvas,progress,video{display:inline-block;vertical-align:baseline}audio:not([controls]){display:none;height:0}[hidden],template{display:none}a{background:transparent}a:active,a:hover{outline:0}abbr[title]{border-bottom:1px dotted}b,strong{font-weight:bold}dfn{font-style:italic}h1{font-size:2em;margin:0.67em 0}mark{background:#ff0;color:#000}small{font-size:80%}sub,sup{font-size:75%;line-height:0;position:relative;vertical-align:baseline}sup{top:-0.5em}sub{bottom:-0.25em}img{border:0}svg:not(:root){overflow:hidden}figure{margin:1em 40px}hr{-moz-box-sizing:content-box;box-sizing:content-box;height:0}pre{overflow:auto}code,kbd,pre,samp{font-family:monospace, monospace;font-size:1em}button,input,optgroup,select,textarea{color:inherit;font:inherit;margin:0}button{overflow:visible}button,select{text-transform:none}button,html input[type="button"],input[type="reset"],input[type="submit"]{-webkit-appearance:button;cursor:pointer}button[disabled],html input[disabled]{cursor:default}button::-moz-focus-inner,input::-moz-focus-inner{border:0;padding:0}input{line-height:normal}input[type="checkbox"],input[type="radio"]{-moz-box-sizing:border-box;box-sizing:border-box;padding:0}input[type="number"]::-webkit-inner-spin-button,input[type="number"]::-webkit-outer-spin-button{height:auto}input[type="search"]{-webkit-appearance:textfield;-moz-box-sizing:content-box;box-sizing:content-box}input[type="search"]::-webkit-search-cancel-button,input[type="search"]::-webkit-search-decoration{-webkit-appearance:none}fieldset{border:1px solid #c0c0c0;margin:0 2px;padding:0.35em 0.625em 0.75em}legend{border:0;padding:0}textarea{overflow:auto}optgroup{font-weight:bold}table{border-collapse:collapse;border-spacing:0}td,th{padding:0}

</style>
<style>
@import url(http://fonts.googleapis.com/css?family=Open+Sans:400,700);

body {
  background: #FCFCFC;
  font-family: "Open Sans", "Arial";
}
main {
  background: #FFF;
  width: 1000px;
  margin: 50px auto;
  padding: 30px 40px 80px;
  box-shadow: 0 3px 5px rgba(0,0,0,0.2);
}
p {
  font-size: 13px;
}
input, section {
  clear: both;
  padding-top: 10px;
  display: none;
}
label {
  font-weight: bold;
  font-size: 14px;
  display: block;
  float: left;
  padding: 10px 60px;
  border-top: 2px solid transparent;
  border-right: 1px solid transparent;
  border-left: 1px solid transparent;
  border-bottom: 1px solid #DDD;
}
label:hover {
  cursor: pointer;
  text-decoration: underline;
}
#tab1:checked ~ #content1, #tab2:checked ~ #content2, #tab3:checked ~ #content3, #tab4:checked ~ #content4 {
  display: block;
}
input:checked + label {
  border-top-color: #FFB03D;
  border-right-color: #DDD;
  border-left-color: #DDD;
  border-bottom-color: transparent;
  text-decoration: none;
}
</style>

    <script src="http://localhost:8080/resources/js/prefixfree.min.js"></script>

    <script src="http://localhost:8080/resources/js/modernizr.js"></script>
<!-- //fonts -->
</head>
  <body>
<div style="text-align:center;clear:both">
<script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
<script src="/follow.js" type="text/javascript"></script>
</div>
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
				<form class="navbar-form navbar-right">
					<input type="text" class="form-control" placeholder="音乐搜索">
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
				<div class="top-grids">
	         <div class="recommended-info">
						<h3>歌手介绍</h3>
					 </div>
	      </div>
	      <div class="g-bd4 f-cb">
	      	<div class="g-mn4">
	      		<div class="g-mn4c">
	      			<div class="g-wrap6">
	      				<div class="n-artist f-cb">
	      					<div class="btm">
								<h2 id="artist-name" class="sname f-thide sname-max" title="${singer.name}">${singer.name}</h2>
	      						<%--<h3 id="artist-alias" class="salias f-thide" title="周杰伦 - Jay Chou">Jay Chou</h3>--%>
	      					</div>
	      					<img src="http://localhost:8080/musicplat/picture/song/singer/${singer.singerpicurl}">
	      					<div class="mask f-alpha"></div>
	      				</div>
	      				<main>
  <!-- <h2>CSS Tabs</h2> -->
  <input id="tab1" type="radio" name="tabs" checked>
  <label for="tab1">热门17单曲</label>
  <input id="tab2" type="radio" name="tabs">
  <label for="tab2">歌手介绍</label>
  <input id="tab3" type="radio" name="tabs">
  <label for="tab3">粉丝留言墙</label>
  
  <section id="content1">
    <div class="fst">
	      					
	      				</div>
								<div id="artist-top17" class="n-top17">
									<div class="m-info">
										<div id="content-operation" class="btns f-cb">
											<a data-res-action="play" href="http://localhost:8080/singer/playsong/${singer.singerid}" class="u-btn2 u-btn2-2 u-btni-addply f-f1" hidefocus="true" title="播放">
												<i>
													<em class="ply">播放</em>
												</i>
											</a>
										</div>
									</div>
									<div class="clearfix"></div>
									
									<div class="f-cb">
										<div id="song-list-pre-cache">
											<div>
												<div class="j-flag1">
													<table class="m-table m-table-1 m-table-4">
														<tbody>
														<c:forEach items="${songs}" var="song" varStatus="s">
															<tr id="list-top17" class="even">
																<td class="w1">
																	<div class="hd">
																		<span class="ply ply-z-slt">&nbsp;</span>
																		<span class="num">${s.index+1}</span>
																	</div>
																</td>
																<td class>
																	<div class="f-cb">
																		<div class="tt">
																			<div class="ttc">
																				<span class="txt">
																					<a href="http://localhost:8080/song/listen?songid=${song.songid}" songid="${song.songid}" class="songclick">
																						<b title="${song.name}">
																							${song.name}
																						</b>
																					</a>
																				</span>
																			</div>
																		</div>
																	</div>
																	<!--<div class="download-icon">
																		<a href="/song/周杰伦 - 告白气球.mp3" download="download-music">
																			<img border="0" src="icon/Navigation-Down.png" alt="music">
																		</a>
																	</div>-->
																</td>
															</tr>
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
															<%--<tr id="list-top17" class="even">
																<td class="w1">
																	<div class="hd">
																		<span class="ply ply-z-slt">&nbsp;</span>
																		<span class="num">1</span>
																	</div>
																</td>
																<td class>
																	<div class="f-cb">
																		<div class="tt">
																			<div class="ttc">
																				<span class="txt">
																					<a href="song.html">
																						<b title="告白气球">
																							告白气球
																						</b>
																					</a>
																				</span>
																			</div>
																		</div>
																	</div>
																	<!--<div class="download-icon">
																		<a href="/song/周杰伦 - 告白气球.mp3" download="download-music">
																			<img border="0" src="icon/Navigation-Down.png" alt="music">
																		</a>
																	</div>-->
																</td>
															</tr>--%>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
								</div>	 
  </section>
  <section id="content2">
    <p>${singer.describle}</p>
  </section>
  <section id="content3">
    <!-- <h3>Heading Text</h3>
    <p>Fusce pulvinar porttitor dui, eget ultrices nulla tincidunt vel. Suspendisse faucibus lacinia tellus, et viverra ligula. Suspendisse eget ipsum auctor, congue metus vel, dictum erat. Aenean tristique euismod molestie. Nulla rutrum accumsan nisl, ac semper sapien tincidunt et. Praesent tortor risus, commodo et sagittis nec, aliquam quis augue. Aenean non elit elementum, tempor metus at, aliquam felis.</p> -->
    <div class="m-cmmt">
									<div class="iptarea">
										
										<div class="j-flag">
											<div class="m-cmmtipt f-cb f-pr">
												<div class="u-txtwrap holder-parent f-pr" style="display: block;">
													<textarea class="u-txt area j-flag" placeholder="发布留言" id="comment"></textarea>
												</div>
												<div class="btns f-cb f-pr">
													<a class="btn u-btn u-btn-1 j-flag" onclick="publishcomment()" singerid="${singer.singerid}" id="publishcomment">留言</a>
													<span class="zs s-fc4 j-flag">140</span>
												</div>
												<script>
                                                    function publishcomment() {
                                                        console.log($("#publishcomment").attr("singerid"));
                                                        console.log($("#comment").val());
                                                        var params ={"singerid":$("#publishcomment").attr("singerid"),
                                                            "content":$("#comment").val()};
                                                        $.ajax({
                                                            type: 'post',
                                                            url: '<%=path%>/fans/addfans',

                                                            dataType:"json",
                                                            data: params,
                                                            success: function (data) {
                                                                if(data.successCode==1){
                                                                    console.log("成功");
                                                                    $("#comment").val('');
                                                                    $("#commentlist").prepend('<div class="itm"> <div class="head"></div> <div class="cntwrap">' +
                                                                        '<div class><div class="cnt f-brk"><a href="http://localhost:8080/user/home?' +
                                                                        'userid='+data.fansvo.userid+'" class="s-fc7">'+data.fansvo.nickname+'</a>:'+data.fansvo.content+' </div>' +
                                                                        ' </div> <div class="rp"> <div class="time s-fc4"></div> </div> </div> </div>');

                                                                }

                                                            }
                                                        });
                                                    }
												</script>
											</div>
										</div>
									</div>
									<div class="cmmts j-flag">
										<h3 class="u-hd4">有趣留言</h3>
										<div id="commentlist">
											<c:choose>
												<c:when test="${not empty fansvos}">
													<c:forEach items="${fansvos}" var="fans">
														<div class="itm">
															<div class="head">

															</div>
															<div class="cntwrap">
																<div class>
																	<div class="cnt f-brk">
																		<a href="http://localhost:8080/user/home?userid=${fans.userid}" class="s-fc7">${fans.nickname}</a>
																		:${fans.content}
																	</div>
																</div>
																<div class="rp">

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
															<div>留言墙一片空白，期待互动</div>
														</div>
													</div>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>
  </section>
  
</main>
	      				     			
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
    <script src='http://localhost:8080/resources/js/jquery.js'></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
  </body>
</html>