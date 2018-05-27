<%--
  Created by IntelliJ IDEA.
  User: 蓝十七
  Date: 2017.4.23
  Time: 13:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML>

<html>
<head>
    <base href="<%=basePath%>">
    <title>测试mybatis</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>
<body>
<c:choose>
    <c:when test="${not empty sessionScope.get('username')}">
        <li>
                ${sessionScope.get('username')}
        </li>
        <li><a href="./order_findByUid.action?page=1">我的订单</a>|
        </li>
    </c:when>
    <c:otherwise>
        <li><a href="./user_LoginPage">会员登录</a>|</li>
        <li><a href="./user_RegistPage">会员注册</a>|</li>
    </c:otherwise>

</c:choose>
</body>
</html>
