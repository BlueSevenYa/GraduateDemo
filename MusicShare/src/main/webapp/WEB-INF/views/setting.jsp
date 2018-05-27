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
<title>个人设置</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="My Play Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- bootstrap -->
<link href="http://localhost:8080/resources/css/bootstrap.min.css" rel='stylesheet' type='text/css' media="all" />
<!-- //bootstrap -->
<link href="http://localhost:8080/resources/css/dashboard.css" rel="stylesheet">
    <link href="http://localhost:8080/resources/css/calendar-blue.css" rel="stylesheet">

<!-- Custom Theme files -->
<link href="http://localhost:8080/resources/css/style.css" rel='stylesheet' type='text/css' media="all" />
<script src="http://localhost:8080/resources/js/jquery-1.11.1.min.js"></script>
    <script src="http://localhost:8080/resources/js/calendar.js"></script>
<!--start-smoth-scrolling-->
<!-- fonts -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Poiret+One' rel='stylesheet' type='text/css'>
<!-- //fonts -->
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
	        <div class="top-grids">
	            <div class="recommended-info">
							<h3>个人设置</h3>
							</div>
	        </div>
					<form  id="update_form" action="http://localhost:8080/user/update" method="post">
						<div class="n-base f-cb">
							<div class="frm m-frm">
							
                  <div class="itm f-cb" style="z-index: 10;">
											<label class="lab">昵称：
												<input type="text" class="u-text txt" maxlength="10" name="nickname" value="${userupdate.nickname}"/>
											</label>
										</div>
									
									<div class="itm f-cb">
										<label class="label-name">性别:</label>
										<div class="f-cb">
											<label class="check">
								 				<input name="sex" type="radio" class="u-rdi" <c:if test="${userupdate.sex== '男'}">checked="checked"</c:if> value="男" />男
											</label>
											<label class="check">
												<input name="sex" type="radio" class="u-rdi" <c:if test="${userupdate.sex== '女'}">checked="checked"</c:if> value="女" />女
											</label>
											<label class="check">
												<input name="sex" type="radio" class="u-rdi" <c:if test="${userupdate.sex== '保密'}">checked="checked"</c:if> value="保密" />保密
											</label>
									  </div>
									</div>
                  <div class="itm f-cb" style="z-index: 11;">
                                <label class="label-name" >生日：</label><br/>
                                <input name="birthday" type="text" id="control_date" size="12" class="date" maxlength="10" value="<fmt:formatDate value="${userupdate.birthday }" pattern="yyyy-MM-dd"/>"/>
                      <script>
                          Calendar.setup({
                              inputField : "control_date",
                               ifFormat : "%Y-%m-%d",
                               showsTime : false,
                               timeFormat : "24"
                           });

                           $('.J_preview').preview(); //查看大图
                           $('.J_cate_select').cate_select({top_option:lang.all}); //分类联动
                           $('.J_tooltip[title]').tooltip({offset:[10, 2], effect:'slide'}).dynamic({bottom:{direction:'down', bounce:true}});
                           </script>
                                <%--<%
                                    String date=new SimpleDateFormat("yyyy-MM-dd").format(${userupdate.birthday});
                                %>--%>
                                <%--<div class="rlf-group profile-birthday">
                                    <select id="year-select" class='moco-form-control' hidefocus="true">
                                        <option value="0"><fmt:formatDate value="${userupdate.birthday }" pattern="yyyy"/>年</option>
                                        <option value="1">2017</option>
                                        <option value="2">2016</option>
                                        <option value="3">2015</option>
                                        <option value="4">2014</option>
                                        <option value="5">2013</option>
                                        <option value="6">2012</option>
                                        <option value="7">2011</option>
                                        <option value="8">2010</option>
                                        <option value="9">2009</option>
                                        <option value="10">2008</option>
                                        <option value="11">2007</option>
                                        <option value="12">2006</option>
                                        <option value="13">2005</option>
                                        <option value="14">2006</option>
                                        <option value="15">2005</option>
                                        <option value="16">2004</option>
                                        <option value="17">2003</option>
                                        <option value="18">2002</option>
                                        <option value="19">2001</option>
                                        <option value="20">2000</option>
                                        <option value="21">1999</option>
                                        <option value="22">1998</option>
                                        <option value="23">1997</option>
                                        <option value="24">1996</option>
                                        <option value="25">1995</option>
                                        <option value="26">1994</option>
                                        <option value="27">1993</option>
                                        <option value="28">1992</option>
                                        <option value="29">1991</option>
                                        <option value="30">1990</option>
                                        <option value="31">1989</option>
                                        <option value="32">1988</option>
                                        <option value="33">1987</option>
                                        <option value="34">1988</option>
                                        <option value="35">1986</option>
                                        <option value="36">1985</option>
                                        <option value="37">1984</option>
                                        <option value="38">1983</option>
                                        <option value="39">1982</option>
                                        <option value="40">1981</option>
                                        <option value="41">1980</option>
                                        <option value="42">1979</option>
                                        <option value="43">1978</option>
                                        <option value="44">1977</option>
                                        <option value="45">1976</option>
                                        <option value="46">1975</option>
                                        <option value="47">1974</option>
                                        <option value="48">1973</option>
                                        <option value="49">1972</option>
                                        <option value="50">1971</option>
                                        <option value="51">1970</option>
                                        <option value="52">1969</option>
                                        <option value="53">1968</option>
                                        <option value="54">1967</option>
                                        <option value="55">1966</option>
                                        <option value="56">1965</option>
                                        <option value="57">1964</option>
                                        <option value="58">1963</option>
                                        <option value="59">1962</option>
                                        <option value="60">1961</option>
                                        <option value="61">1960</option>
                                        <option value="62">1959</option>
                                        <option value="63">1958</option>
                                        <option value="64">1957</option>
                                        <option value="65">1956</option>
                                        <option value="66">1955</option>
                                        <option value="67">1954</option>
                                        <option value="68">1953</option>
                                        <option value="69">1952</option>
                                        <option value="70">1951</option>
                                        
                                    </select>
                                    <select class='moco-form-control' id="month-select" hidefocus="true">
                                        <option value="0"><fmt:formatDate value="${userupdate.birthday }" pattern="MM"/>月</option>
                                        <option value="1">01</option>
                                        <option value="2">02</option>
                                        <option value="3">03</option>
                                        <option value="4">04</option>
                                        <option value="5">05</option>
                                        <option value="6">06</option>
                                        <option value="7">07</option>
                                        <option value="8">08</option>
                                        <option value="9">09</option>
                                        <option value="10">10</option>
                                        <option value="11">11</option>
                                        <option value="12">12</option>
                                        
                                    </select>
                                    <select class='moco-form-control mr0' id="day-select" hidefocus="true">
                                        <option value="0"><fmt:formatDate value="${userupdate.birthday }" pattern="dd"/>日</option>
                                        <option value="1">01</option>
                                        <option value="2">02</option>
                                        <option value="3">03</option>
                                        <option value="4">04</option>
                                        <option value="5">05</option>
                                        <option value="6">06</option>
                                        <option value="7">07</option>
                                        <option value="8">08</option>
                                        <option value="9">09</option>
                                        <option value="10">10</option>
                                        <option value="11">11</option>
                                        <option value="12">12</option>
                                        <option value="13">13</option>
                                        <option value="14">14</option>
                                        <option value="15">15</option>
                                        <option value="16">16</option>
                                        <option value="17">17</option>
                                        <option value="18">18</option>
                                        <option value="19">19</option>
                                        <option value="20">20</option>
                                        <option value="21">21</option>
                                        <option value="22">22</option>
                                        <option value="23">23</option>
                                        <option value="24">24</option>
                                        <option value="25">25</option>
                                        <option value="26">26</option>
                                        <option value="27">27</option>
                                        <option value="28">28</option>
                                        <option value="29">29</option>
                                        <option value="30">30</option>
                                        <option value="31">31</option>
                                    </select>
                                    &lt;%&ndash;<input type="date" value="<fmt:formatDate value="${userupdate.birthday }" pattern="yyyy/MM/dd"/>" />&ndash;%&gt;
                                    <div class="cb"></div>
                                    <p class="rlf-tip-wrap errorHint color-red"></p>
                                </div>--%>
                            </div>
										<div class="itm f-cb" style="z-index: 10;">
											<label class="lab">地区：
												<input type="text" id="place" class="u-text txt" name="place" maxlength="10" value="${userupdate.place}"/>
											</label>
										</div>
                    <div class="itm itm-1 f-cb">
										<label class="label-name">介绍:</label>
										<div class="u-txtwrap f-pr">
											<textarea class="u-txt area" id="signature" name="describle">${userupdate.describle}</textarea>
											<span class="zs s-fc2" id="remain">140</span>
										</div>
									</div>       

                    <div class="itm ft-cb">
                        <input type="submit"  value="提价修改" onclick="userupdate()"/>
                    </div>
							</div>
						</div>
					</form>
                    <script>
                        function userupdate() {
                            /*
                            * 暂时这里不考虑用ajax
                            * */
                        }
                    </script>
	    	</div>

	</div>




			</div>
	<div style="display: none">
	    <script type="text/javascript">
	        var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
	        document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Ff0cfcccd7b1393990c78efdeebff3968' type='text/javascript'%3E%3C/script%3E"));
	        (function (d) {
	            window.bd_cpro_rtid="rHT4P1c";
	            var s = d.createElement("script");s.type = "text/javascript";s.async = true;s.src = location.protocol + "//cpro.baidu.com/cpro/ui/rt.js";
	            var s0 = d.getElementsByTagName("script")[0];s0.parentNode.insertBefore(s, s0);
	        })(document);
	    </script>
	    <script>
	        (function(){
	            var bp = document.createElement('script');
	            bp.src = '//push.zhanzhang.baidu.com/push.js';
	            var s = document.getElementsByTagName("script")[0];
	            s.parentNode.insertBefore(bp, s);
	        })();
	    </script>
	</div>			
				
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="http://localhost:8080/resources/js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
  </body>
</html>