<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<base href="<%=basePath%>resources/">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<title>${songmenu.name}</title>
	<link rel="stylesheet" href="css/music.css">
</head>
<body class="blueHour">

<div class="container">
	<div class="music-list">
		<div class="title">${songmenu.name}</div>
		<div class="list">
			<ul id="songlist">
				<c:forEach items="${songs}" var="song">
				<li class="songlist">${song.name}</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<audio id="audio">
		<c:forEach items="${songs}" var="song">
		<source title="${song.name}" data-img="http://localhost:8080/musicplat/picture/song/${song.songpicurl}" src="http://localhost:8080/musicplat/song/${song.mp3url}">
		</c:forEach>
	</audio>
	<div class="music">
		<div class="header">
			<h1> <small>十七音乐播放器</small></h1>
		</div>
		<div class="fengmian">
			<img src="img/music.png" id="music-img" alt="">
		</div>
		<div id="title">
			欢迎来到音乐世界！
		</div>
		<div class="jindu">
				<span id="music-bar">
					<span id="load-bar"></span>
					<span id="played-bar"></span>
				</span>
			<span id="voice-bar">
					<span id="voiced-bar"></span>
				</span>
			<div id="time">
				<span id="current-time">0:00</span>
				<span id="total-time"></span>
			</div>
		</div>
		<div class="controls">
			<a id="xunhuan" href="javascript:;">循环</a>
			<a id="prev" href="javascript:;"><</a>
			<a id="play" href="javascript:;">播放</a>
			<a id="next" href="javascript:;">></a>
			<a id="jingyin" href="javascript:;">静音</a>
		</div>
	</div>
</div>

<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/music.js"></script>
<!-- 	<script type="text/javascript">
	/*$("li").onclick=function(){
		alert(this.innerHTML);
	}*/
	$(document).ready(function(){
$('li').click(function() {
   alert($(this).text());

  });
});
</script> -->
<script>
    // 回调函数将返回的内容添加到结果区（需要在页面加载完后加载上，为后面执行回调）
    function jsonpcallback (rs) {
        var resultHtml = '歌曲：<strong>' + rs.result.songs[0].name + '</strong>' +
            '歌手：<strong>' + rs.result.songs[0].artists[0].name + '</strong>' +
            '<a href="javascript:;" id="to-play">立即播放</a>';
        result.innerHTML = resultHtml;
        result.setAttribute('data-audio', rs.result.songs[0].audio);
        result.setAttribute('data-img', rs.result.songs[0].album.picUrl);
        result.setAttribute('data-music', rs.result.songs[0].name);
        result.setAttribute('data-singer', rs.result.songs[0].artists[0].name);
        result.style.opacity = '1';

    };
</script>
</body>
</html>