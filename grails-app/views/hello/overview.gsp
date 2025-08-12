<%--
Created by IntelliJ IDEA.
User: Windows 11
Date: 09/08/2025
Time: 14:33
--%>

<%@ page contentType = "text/html;charset=UTF-8" %>
<html>
<head>
	<meta name = "viewport" content = "width=device-width, initial-scale=1.0">
	<meta name = "layout" content = "main"/>
	<asset:stylesheet src = "overview.css"/>


	<title>Overview Page</title>
</head>

<body>

<div class="container">
	<table class="overview">
		<g:each in="${urlList}" var="url">
			<tr>
				<td>${url.id}</td>
				<td>${url.name}</td>
				<td>${url.url}</td>
				<td>
					<g:link action="show" id="${url.id}">Show</g:link>
					<g:submitButton name="delete" value="Delete"/>
				</td>
			</tr>
		</g:each>
	</table>
</div>

</body>
</html>