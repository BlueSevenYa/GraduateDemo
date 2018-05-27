<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
<title>Upload</title>
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
<script src="http://localhost:8080/resources/js/dropzone.js"></script>
<link rel="stylesheet" href="http://localhost:8080/resources/css/dropzone.css" />
<!--start-smoth-scrolling-->


</head>
  <body background="http://localhost:8080/resources/images/share.jpg">
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <a class="navbar-brand" href="http://localhost:8080/index"><h1><img src="http://localhost:8080/resources/images/logo.png" alt="" /></h1></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
			<div class="top-search">
				<form class="navbar-form navbar-right">
					<input type="text" class="form-control" placeholder="音乐搜索">
					<input type="submit" value=" ">
				</form>
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
			</div>  
		
		<div class="clearfix"> </div>
      </div>
    </nav>
		<!-- upload -->
		<div class="upload">
			<div class="share-img">
				<p style="text-align: center;"><img src="http://localhost:8080/resources/images/share.jpg" /></p>
			</div>
			<div class="dropz">
			<form  class="dropzone needsclick dz-clickable" method="post" enctype="multipart/form-data">
				<div class="dz-message needsclick">
					点击上传音频和图片文件
				</div>
			</form>
		</div>
		<div class="information">
			<ul class="create_album_list clearfix">
						<li>
							<label>歌名：</label>
							<input type="text" max="50" id="txt_title" name="txt_title" placeholder class="album_inpt" value="" />
							<em></em>
						</li>
						<li>
							<label>歌手：</label>
							<input type="text" max="50" id="txt_title" name="txt_title" placeholder class="album_inpt" value="" />
							<em></em>
						</li>
						<li>
							<label>积分：</label>
							<input type="text" max="50" id="txt_title" name="txt_title" placeholder class="album_inpt" value="" />
							<em></em>
						</li>
					</ul>
					<div class="create_album_b">
						<input id="btn_submit" type="button" value="提交" class="album_submit submit-btn" />
					</div>
		</div>
					
		</div>
		
	
		<div class="clearfix"> </div>
	
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="http://localhost:8080/resources/js/bootstrap.min.js"></script>
    <script>
	    $(".dropz").dropzone({
	        url: "http://localhost:8080/deal/music/upload",
	        addRemoveLinks: true,
	        dictRemoveLinks: "x",
	        dictCancelUpload: "x",
	        maxFiles: 10,
	        maxFilesize: 50,
            uploadMultiple:true,
	        /*acceptedFiles: ".js",*/
	        init: function() {
	            this.on("success", function(file) {
	                console.log("File " + file.name + "uploaded");
	            });
	            this.on("removedfile", function(file) {
	                console.log("File " + file.name + "removed");
	            });
	        }
	    });
		</script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
  </body>
</html>