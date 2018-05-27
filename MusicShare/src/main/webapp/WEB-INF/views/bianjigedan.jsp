<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	/*$(document).ready(function(){

	 $("#dealsongmenu").hide();

	 });*/

    $(function() {

        $("#savegedan").click(function() {
            //alert("sss");
			console.log($("#songmenuname").val());
			var songmenuname=$("#songmenuname").val();
			var songmenudesc=$("#songmenudesc").val();
			var songmenuid=$("#songmenuname").attr("songmenuid");
            var params ={"songmenuname":songmenuname,"songmenudesc":songmenudesc,"songmenuid":songmenuid};
            $.ajax({
                type: 'post',
                url: 'http://localhost:8080/my/songmenu/update',

                dataType:"json",
                data: params,
                success: function (data) {
                    //window.location.href="http://localhost:8080/my/music";
					console.log("成功");
                    location.reload();
                }
            });
        });
    });

</script>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<div class="main-grids">
				<div class="g-bd">
					<div class="g-wrap p-prf">
						<dl class="m-proifo f-cb" id="head-box">

						
							<dt class="f-pr" id="ava">
								<img src="http://localhost:8080/musicplat/picture/songmenu/${songmenu.smpicurl}" />
								<div class="btm">
									<a href="http://localhost:8080/my/songmenupic/update/${songmenu.songmenuid}" class="change">更换封面</a>
								</div>
							</dt>
							<dd>
								<div class="name f-cb">
									<div class="f-cb">
										
										<h2 id="j-name-wrap" class="wrap f-fl f-cb">
											<span class="tit f-ff2 s-fc0 f-thide">&nbsp;</span>
										</h2>
									</div>	
								</div>
								<div class="inf s-fc3">
									<span>歌单名：</span><input type="text" value="${songmenu.name}"id="songmenuname" songmenuid="${songmenu.songmenuid}"/>
								</div>
								<div class="inf s-fc3">
									<span>&nbsp;</span>
								</div>
								<div class="inf s-fc3">
									
								</div>
								<div class="inf s-fc3">
									<span>介绍：</span><textarea name="" id="songmenudesc">${songmenu.describle}</textarea>
								</div>
								<div class="inf s-fc3">
									<span>&nbsp;</span>
								</div>
								<div class="inf s-fc3">
									<span id="savegedan"><input type="button"  value="保存"/></span>
								</div>
							</dd>
							

						</dl>
					</div>
					
					
					
	        </div>
	        
				</div>		
			</div>