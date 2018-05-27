<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
    <title>Home</title>
    <base href="<%=basePath%>resources/">
    <meta http-equiv="Refresh" content="0; URL=<%=path%>/index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

</head>
<body>

    <%--该index.jsp主要用作无缝转向index链接--%>

</body>
</html>