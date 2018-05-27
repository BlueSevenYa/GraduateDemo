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
<title>个人中心</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="My Play Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- bootstrap -->
<link href="http://localhost:8080/resources/css/bootstrap.min.css" rel='stylesheet' type='text/css' media="all" />
<!-- //bootstrap -->
	<link href="http://localhost:8080/resources/css/sweetalert2.min.css" rel="stylesheet">
	<script src="http://localhost:8080/resources/js/sweetalert2.min.js"></script>
<link href="http://localhost:8080/resources/css/dashboard.css" rel="stylesheet">
<!-- Custom Theme files -->
<link href="http://localhost:8080/resources/css/style.css" rel='stylesheet' type='text/css' media="all" />
<%--<script src="http://localhost:8080/resources/js/jquery-1.11.1.min.js"></script>--%>
<script>
$(document).ready(function(){
  
    $("#dealsongmenu1").hide();
 
});
</script>
<script>
/*$(document).ready(function(){
  
    $("#dealsongmenu").hide();
 
});*/

		$(function() {
		/*
		 * 查询所有人
		 */
		$(".bianji").click(function() {
			//alert("sss");
			$("#dealsongmenu").html("数据正在玩命加载中......");
			$("#dealsongmenu").load("bianjigedan.html");
		});
		$(".showlistsong").click(function() {
			//alert("sss");
			$("#dealsongmenu").html("数据正在玩命加载中......");
			$("#dealsongmenu").load("songlistforsm.html");
		});
	});
		function queryAllPerson(pageNum, pageSize){
		$("#edit_area_div").html("数据正在玩命加载中......");
		$("#edit_area_div").load("person/query.action?pageNum="+pageNum+"&pageSize="+pageSize);
	}
</script>
<style type="text/css">
	.sognmenudel{
		font-size: 15px;
	}
</style>
<script>  
        function msgbox(n){
            document.getElementById('inputbox').style.display=n?'block':'none';     /* 点击按钮打开/关闭 对话框 */
        }
     </script>
<style>
.box{
    width:50%; margin-top:10%; margin:auto; padding:28px;
    height:180px; border:1px #111 solid;
    display:none;            /* 默认对话框隐藏 */
}
.box.show{display:block;} 
.box .x{ font-size:18px; text-align:right; display:block;}
.box input{width:80%; font-size:18px; margin-top:18px;}
</style>
<!--start-smoth-scrolling-->
<!-- fonts -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Poiret+One' rel='stylesheet' type='text/css'>
<!-- //fonts -->
	<%--弹窗相关--%>
	<%--<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">--%>
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style>

		ul.listmenu li {

			list-style-type:none;
			margin-bottom:10px;
			padding: 6px 0 6px 35px;
			border-top: 1px solid #e0e0e0;

		}
		li a{
			text-decoration:none;
		}
		li:hover{
			text-decoration:none;
			background-color: #E6E6E6;
		}
		.picleft {
			display: inline;
			/* float: left; */
			margin-left: -50px;
			overflow: hidden;
			/* width: 40px; */
		}
		li div{
			display: inline;
		}
		.wordright{
			height: 50px;
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
					<a href="upload.html">上 传</a>
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
					<div class="g-wrap p-prf">
						<dl class="m-proifo f-cb" id="head-box">

						<div id="dealsongmenu1">
							
							</div>

						</dl>
					</div>
					<div class="cimg"></div>
					
					
	        <div id="dealsongmenu">
	        <div class="u-title u-title-1 f-cb" style="padding-top: 0;" id="Header">
	        							<h3>音乐搜索结果</h3>
	        							<div class="clearfix"></div>
	        							<div id="s-record" class="s-record">
	        								<div class="j-flag">
	        									<ul>
													<c:choose>
													<c:when test="${not empty songlist}">
													<c:forEach items="${songlist}" var="song" varStatus="s">
	        										<li>
	        											<div class="hd">
	        												<span class="num">${s.index+1}.</span>
	        											</div>
	        											<div class="song">
	        												<div class="tt">
	        													<div class="ttc">
	        														<span class="txt">
	        															<a href="http://localhost:8080/song/listen?songid=${song.songid}">
	        																<b title="${song.songname}">${song.songname}</b>
	        															</a>
	        															<span class="ar s-fc8">
	        																<em>-</em>
	        																<span title="${song.singername}">
	        																	<a class="artist" href="http://localhost:8080/singer/show/${song.singerid}" hidefocus="true">${song.singername}</a>
	        																</span>	
	        																<span class="s-time">2017.10.30</span>
	        															</span>
	        															
	        														</span>
	        													</div>
	        												</div>
	        													<span class="s-time"></span>
	        											</div>
														<span>
												<a href="http://localhost:8080/song/listen?songid=${song.songid}"><img src="http://localhost:8080/resources/icon/play-button.png" /></a>
												<a href="javascript:void(0)" class="judgescore" songid="${song.songid}"><img src="http://localhost:8080/resources/icon/download.png" /></a>
															<a href="javascript:void(0)" title="收藏" class="shoucang" data-toggle="modal" data-target="#myModal" songid="${song.songid}"><img src="http://localhost:8080/resources/icon/box.png" /></a>
												<%--http://localhost:8080/song/download/${song.songid}--%>
											</span>

	        										</li>
													</c:forEach>
													</c:when>
														<c:otherwise>
															<li>该关键字没能检索出相关歌曲</li>
														</c:otherwise>
													</c:choose>
													<script>
                                                        $(function () {
                                                            $("a.shoucang").click(function () {
                                                                //alert("收藏");
                                                                var songid=$(this).attr("songid");
                                                                console.log(songid);
                                                                $("#myModal").attr("data-res-id",songid);
                                                                console.log($("#myModal").attr("data-res-id"));
                                                            })

                                                        })
													</script>
													<script>
                                                        $(function () {
                                                            $("a.judgescore").click(function () {
                                                                var val=$(this).attr("songid");
                                                                //alert(val);
                                                                console.log(val);
                                                                var thisid=$(this);
                                                                var params ={"songid":val};
                                                                $.ajax({
                                                                    type: 'post',
                                                                    url: '<%=path%>/song/judgescore',

                                                                    dataType:"json",
                                                                    data: params,
                                                                    success: function (data) {
                                                                        if(data.successCode==1){
                                                                            $(thisid).attr("href","http://localhost:8080/song/download/"+data.songid);
                                                                        }
                                                                        if(data.successCode==0){
                                                                            //alert("积分不够，暂不能下载");
																			swal("积分不够，暂不能下载");
                                                                        }
                                                                    }
                                                                });
                                                            })

                                                        })
													</script>
	        									</ul>
	        								</div>
	        							</div>
	        </div>
	        
	        </div>

				</div>		
			</div>
			<!-- 模态框（Modal） -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" data-res-id="" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
								&times;
							</button>
							<h4 class="modal-title" id="myModalLabel">
								添加到歌单
							</h4>
						</div>
						<div class="modal-body">
							<ul class="listmenu">
								<li data-dismiss="modal" data-id="${likesongmenushow.songmenuid}">

									<!-- <div class="media"> -->
									<div class="media-left">
										<a href="javascript:void(0)">
											<img src="http://localhost:8080/resources/images/like.jpg" class="media-object" height="50px" width="50px" />
										</a>
									</div>
									<div class="media-body">
										<h4 class="media-heading">${likesongmenushow.songmenuname}</h4>
										${likesongmenushow.songmenuofsongs}首
									</div>

								</li>
								<c:forEach items="${songmenushow}" var="songmenushow">
									<li data-dismiss="modal" data-id="${songmenushow.songmenuid}">

										<!-- <div class="media"> -->
										<div class="media-left">
											<a href="javascript:void(0)">
												<img src="http://localhost:8080/musicplat/picture/songmenu/${songmenushow.songmenupic}" class="media-object" height="50px" width="50px" />
											</a>
										</div>
										<div class="media-body">
											<h4 class="media-heading">${songmenushow.songmenuname}</h4>
												${songmenushow.songmenuofsongs}首
										</div>

									</li>
								</c:forEach>
								<%--<li data-dismiss="modal" data-id="3">

                                    <!-- <div class="media"> -->
                                    <div class="media-left">
                                        <a href="javascript:void(0)">
                                            <img src="http://localhost:8080/resources/images/3.jpg" class="media-object" height="50px" width="50px" />
                                        </a>
                                    </div>
                                    <div class="media-body">
                                        <h4 class="media-heading">歌单2</h4>
                                        5首
                                    </div>

                                </li>--%>
								<script>
                                    $(function () {
                                        $("li[data-dismiss='modal']").click(function () {
                                            var songmenuid=$(this).attr("data-id");
                                            var songid=$("#myModal").attr("data-res-id");
                                            console.log(songmenuid+"="+songid);
                                            var params ={"songid":songid,"songmenuid":songmenuid};
                                            $.ajax({
                                                type: 'post',
                                                url: '<%=path%>/songmenu/addmusictosongmenu',

                                                dataType:"json",
                                                data: params,
                                                success: function (data) {
                                                    if(data.successCode==1){
                                                        alert("添加成功");
                                                    }
                                                    if(data.successCode==0){
                                                        alert("歌曲已存在")
                                                    }
                                                }
                                            });
                                        })

                                    })
								</script>
							</ul>
						</div>

					</div><!-- /.modal-content -->
				</div><!-- /.modal -->
			</div>
				
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
<%--    <script src="http://localhost:8080/resources/js/bootstrap.min.js"></script>--%>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
  </body>
</html>