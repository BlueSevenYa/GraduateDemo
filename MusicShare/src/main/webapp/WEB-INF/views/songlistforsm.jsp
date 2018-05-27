<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="u-title u-title-1 f-cb" style="padding-top: 0;" id="Header">
	        							<h3>${songmenuname}</h3>
	        							<div class="clearfix"></div>
	        							<div id="s-record" class="s-record">
	        								<div class="j-flag">
	        									<ul>
													<c:choose>
													<c:when test="${not empty songs}">
													<c:forEach items="${songs}" var="song" varStatus="s">
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
															<li>
																<div class="hd">
																	<span class="num"></span>
																</div>
																<div class="song">
																	<div class="tt">
																		<div class="ttc">
	        														<span class="txt">

	        																<b>该歌单暂无相关歌曲</b>

	        															<span class="ar s-fc8">
	        																<em>-</em>
	        																<span title="}">
	        																	<a class="artist" href="" hidefocus="true"></a>
	        																</span>
	        																<span class="s-time"></span>
	        															</span>

	        														</span>
																		</div>
																	</div>
																	<span class="s-time"></span>
																</div>

															</li>
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
                                                                var params ={"songid":val};
                                                                $.ajax({
                                                                    type: 'post',
                                                                    url: 'http://localhost:8080/song/judgescore',

                                                                    dataType:"json",
                                                                    data: params,
                                                                    success: function (data) {
                                                                        if(data.successCode==1){
                                                                            $("a.judgescore").attr("href","http://localhost:8080/song/download/"+data.songid);
                                                                        }
                                                                        if(data.successCode==0){
                                                                            alert("积分不够，暂不能下载");
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