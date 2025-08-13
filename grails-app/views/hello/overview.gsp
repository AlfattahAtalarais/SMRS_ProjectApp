<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="layout" content="main"/>
	<asset:stylesheet src="overview.css"/>
	<title>Overview Page</title>
</head>

<body>
<div class="container">
	<div class="title">
		<h1>Overview</h1>
	</div>
	
	<div class="content">
		<table>
			<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>URL</th>
				<th>Status</th>
				<th>Last Checked</th>
			</tr>
			</thead>
			<tbody>
			<g:each in="${urlList}" var="url">
				<tr>
					<td>${url.id}</td>
					<td>${url.name}</td>
					<td><a href="${url.url}" target="_blank">${url.url}</a></td>
					<td>Active</td>
					<td>Just now</td>
				</tr>
			</g:each>
			</tbody>
		</table>
	</div>
</div>

</body>
</html>