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
    <link href="http://localhost:8080/resources/css/sweetalert2.min.css" rel="stylesheet">
    <script src="http://localhost:8080/resources/js/sweetalert2.min.js"></script>
<link href="http://localhost:8080/resources/css/style.css" rel='stylesheet' type='text/css' media="all" />
<script src="http://localhost:8080/resources/js/jquery-1.11.1.min.js"></script>
<%--<script src="http://localhost:8080/resources/js/dropzone.js"></script>
<link rel="stylesheet" href="http://localhost:8080/resources/css/dropzone.css" />--%>
	<link href="http://localhost:8080/resources/Dropzone/css/basic.css" rel="stylesheet" />
	<link href="http://localhost:8080/resources/Dropzone/css/dropzone.css" rel="stylesheet" />
	<script src="http://localhost:8080/resources/Dropzone/dropzone.min.js"></script>
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
				<form class="navbar-form navbar-right" action="http://localhost:8080/search/music">
					<input type="text" class="form-control" placeholder="音乐搜索" name="keyword">
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
	<div style="align-content: center">
	<form action="http://localhost:8080/deal/music/upload" method="post" enctype="multipart/form-data"
		  class="dropzone" id="dropzoneForm">
		<!-- <input type="file" name="file" />
		<input type="submit" value="Submit" />
		 -->
	</form>
	</div>
	<div>
		<!--上传按钮，提供多张图片一次性上传的功能disabled="disabled"-->
		<!-- <button type="submit" id="submit-all" >上传</button> -->
	</div>
	<%--<form>
		待处理歌曲名称：<input type="text" id="songname"/><br/>
		待处理图片名称：<input type="text" id="picname"/>
	</form>--%>
		<div class="information">
			<ul class="create_album_list clearfix">
						<li>
							<label>歌&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</label>
							<input type="text" max="50" id="songname" name="txt_title" placeholder class="album_inpt" value="" />
							<em></em>
						</li>
						<li>
							<label>歌&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;手：</label>
							<input type="text" max="50" id="singername" name="txt_title" placeholder class="album_inpt" value="" />
							<em></em>
						</li>
				<li>
					<label>歌&nbsp;&nbsp;&nbsp;手&nbsp;&nbsp;&nbsp;性&nbsp;&nbsp;&nbsp;别：</label>
					<input type="text" max="50" id="sex" name="txt_title" placeholder="格式：男or女" class="album_inpt" value="" />
					<em></em>
				</li>
				<li>
					<label>是&nbsp;&nbsp;&nbsp;否&nbsp;&nbsp;&nbsp;原&nbsp;&nbsp;&nbsp;创：</label>
					<input type="text" max="50" id="isyuanchuang" name="txt_title" placeholder="格式：是or否" class="album_inpt" value="" />
					<em></em>
				</li>
						<li>
							<label>积&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;分：</label>
							<input type="text" max="50" id="score" name="txt_title" placeholder class="album_inpt" value="" />
							<em></em>
						</li>
				<li>
					<label>待处理歌曲名称：</label>
					<input type="text" max="50" id="songnameurl" name="txt_title" placeholder class="album_inpt" value="" />
					<em></em>
				</li>
				<li>
					<label>待处理图片名称：</label>
					<input type="text" max="50" id="picname" name="txt_title" placeholder class="album_inpt" value="" />
					<em></em>
				</li>
					</ul>
					<div class="create_album_b">
						<input id="btn_submit" type="button" value="提交" class="album_submit submit-btn" />
					</div>
		</div>
	<script>
        $(function () {
            $("#btn_submit").click(function () {
                //alert("ssss");
                var songname = $("#songname").val();
                var singername = $("#singername").val();
                var sex = $("#sex").val();
                var isyuanchuang = $("#isyuanchuang").val();
                var score = $("#score").val();
                var songnameurl = $("#songnameurl").val();
                var picname = $("#picname").val();
                //alert(val);
                console.log(songname + "=" + singername + "=" + sex + "=" + isyuanchuang + "=" + score + "=" + songnameurl + "=" + picname);
                var params ={
                    "songname":songname,
                    "singername":singername,
                    "sex":sex,
                    "isyuanchuang":isyuanchuang,
                    "score":score,
                    "songnameurl":songnameurl,
                    "picname":picname,
                };
                $.ajax({
                    type: 'post',
                    url: '<%=path%>/deal/music/save',

                    dataType:"json",
                    data: params,
                    success:function (data) {
                        if(data.success==='success'){
                            swal("分享成功");
                        }
                    }

                });

            })
        })
	</script>
					
		</div>
		
	
		<div class="clearfix"> </div>
	
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="http://localhost:8080/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript">
        Dropzone.options.dropzoneForm = {
			/* url:"http://localhost:8080/uploadModule/upload",
			 uploadMultiple:true,
			 autoProcessQueue: false, */

            init : function() {
                //var submitButton = document.querySelector("#submit-all");
                //myDropzone = this; // closure

                //为上传按钮添加点击事件
				/* submitButton.addEventListener("click", function () {
				 //手动上传所有图片
				 myDropzone.processQueue();
				 }); */

                this.on("complete", function(data) {
                    var res = eval('(' + data.xhr.responseText + ')');
					/* var songname="";
					 var songname=songname+res.ori_name;
					 document.getElementById("songname").value=songname; */
                    var name=res.name;
                    console.log(name);
                    if(name.lastIndexOf('.jpg')>0){
                        document.getElementById("picname").value="";
                        document.getElementById("picname").value=name;
                    }
                    if(name.lastIndexOf('.mp3')>0){
                        document.getElementById("songnameurl").value="";
                        document.getElementById("songnameurl").value=name;
                    }
                    //alert(" success : "+ res.success +"\n" + " msg : "+ res.msg +"\n" + " path : "+ res.path +"\n" + " md5_name : "+ res.md5_name+"\n" + " ori_name : "+ res.ori_name+"\n" + " url : "+ res.url);
                });
            }
        };
	</script>
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