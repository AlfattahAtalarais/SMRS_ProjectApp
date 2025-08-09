<%--
  Created by IntelliJ IDEA.
  User: Windows 11
  Date: 09/08/2025
  Time: 14:57
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>


    <title>About Page</title>
</head>

<body>
<h1>About Page</h1>

<p>${msg}</p>
<nav>
    <a href="${createLink(controller: 'hello', action: 'index')}">Ke Halaman Index</a>
</nav>
</body>
</html>