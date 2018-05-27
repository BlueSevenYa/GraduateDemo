<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
 String path = request.getContextPath();
 String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html ng-app="webPhotos">
<head lang="zh-CN">
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
 <title>更换歌单封面</title>
 <style>
  div{text-align:center;border:1px solid #ddd;}
  button,div{margin:10px auto}
  button{border:0;width:200px;height:30px;line-height:30px;font-size:1pc;color:#333;background-color:#0ff;cursor:pointer;border-radius:5px}
  button:hover{background-color:#db7093}
  #preview,.show-img{width:200px;height:200px;}
  #preview img,.show-img img{width:100%;height:100%;}
  .file{position:relative;display:block;width:200px;height:30px;line-height:30px;background:#9acd32;border-radius:5px;margin:10px auto;overflow:hidden;color:#1e88c7;text-decoration:none;text-indent:0}
  .file input{position:absolute;font-size:75pt;right:0;top:0;opacity:0}
  .file:hover{background:#aadffd;border-color:#78c3f3;color:#004974;text-decoration:none}
 </style>
</head>
<body>
<div ng-controller="photos">
<%-- <a href="javascript:;" class="file">
  <span>选择文件</span>
  <input type="file" onchange="preview(this)" />
 </a>
 <button class="save" ng-click="save()">保存</button>--%>
 <form action="http://localhost:8080/my/songmenupic/update/deal?songmenuid=${songmenuid}" method="post" enctype="multipart/form-data" accept-charset="utf-8">
  <a href="javascript:;" class="file">
   <span>选择文件</span>
   <input type="file" onchange="preview(this)" name="file"/>
  </a>
  <!-- <button class="save" ng-click="save()">保存</button> -->
  <input type="submit" value="上传">
 </form>
 <h2>歌单封面预览</h2>
 <div id="preview"></div>
 <!--<h2>上传成功后展示头像</h2>
 <div class="show-img">
  <img ng-src={{imgSrc}} alt=""/>
 </div>-->
</div>
<script type="text/javascript" src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://apps.bdimg.com/libs/angular.js/1.4.6/angular.min.js"></script>
<script>
 function preview(file) {//预览图片得到图片base64
  var prevDiv = document.getElementById('preview');
  if (file.files && file.files[0]) {
   var reader = new FileReader();
   reader.onload = function(evt){
    prevDiv.innerHTML = '<img src="' + evt.target.result + '" />';
   }
   reader.readAsDataURL(file.files[0]);
  } else {
   prevDiv.innerHTML = '<div class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';
  }
 }
 //以上代码最好写在service或factory里
 angular.module('webPhotos',['ng'])
   .controller('photos',function($scope,$http){
    var binaryblob = function (s, type) {//blob对象
     var byteString = atob(s);
     var array = [];
     for (var i = 0; i < byteString.length; i++) {
      array.push(byteString.charCodeAt(i));
     }
     return new Blob([new Int8Array(array)], {type: type});
    };
    var binaryPictureBlob = function (dataUrl, filterHead) {//上传base64去头
     var s = filterHead ? dataUrl.replace(/^data:image\/(png|jpeg|pjpeg|bmp|gif|x-png);base64,/, "") : dataUrl;
     return binaryblob(s, "image/jpeg");
    };
 
    $scope.save=function(){//保存
     var pic=binaryPictureBlob($('#preview img').attr('src'),true);//调用该方法得到上传数据
     $http({//接口参数
      url:'',
      method:'',
      headers:{},
      data:{}
     }).success(function(data){//此时上传到本地服务器成功，实际上只是上传了与此图片有关的标记，图片信息还未上传
      $http({
       method:'PUT',
       url:data.UrlForPut,//上传到本地服务器已经生成地址，但要上传到阿里云后地址才生效有上传的图像显示
       headers: {
        'Content-Type':' ',//避免阿里云上传时报错或者根据阿里云要求上传header
       },
       data:pic//图像base64字符串去头等处理后的图片信息
      }).success(function(data2){//将图像信息从服务器上传到阿里云
       $scope.imgSrc=data.Url;//将服务器的数据的url赋值图片链接
      }).error(function(err2,header2,config2,status2){//处理响应失败
       console.log(err2,header2,config2,status2);
      });
     }).error(function(err1,header1,config1,status1){//处理响应失败
      console.log(err1,header1,config1,status1);
     })
    }
   })
</script>
</body>
</html>