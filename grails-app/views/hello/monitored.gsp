<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<meta name="layout" content="main"/>
	<asset:stylesheet src="monitored.css"/>
	<title>Monitored Page</title>
</head>

<body>
<div class="container">
	<div class="title">
		<h1>Monitored Sites</h1>
	</div>
	
	<div class="content">
		<div class="table-header">
			<g:link controller="hello" action="add" class="add-btn">Add</g:link>
		</div>
		
		<table >
			<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>URL</th>
				<th>Actions</th>
			</tr>
			</thead>
			<tbody>
			<g:each in="${urlList}" var="url">
				<tr>
					<td>${url.id}</td>
					<td>${url.name}</td>
					<td><a href="${url.url}" target="_blank">${url.url}</a></td>
					<td class="action">
						<g:link action="edit" id="${url.id}" class="btn-edit">Edit</g:link>
						<g:form controller="hello" action="delete" id="${url.id}" method="DELETE"  style="display: inline;">
							<input type="submit" value="Delete" class="btn-delete"
								   onclick="return confirm('Yakin ingin menghapus website ${url.name}?')"/>
						</g:form>

					</td>
				</tr>
			</g:each>
			</tbody>
		</table>
	</div>
</div>

</body>
</html>
