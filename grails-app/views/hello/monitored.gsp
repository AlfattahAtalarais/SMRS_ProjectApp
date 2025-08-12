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
	<asset:stylesheet src="monitored.css"/>
	<title>Monitored Page</title>
</head>

<body>
<div class="container">
	<div class="title">
		<h1>Monitored Sites</h1>
	</div>
<div id="add-btn">

</div>
	<div class="content">
		<a href="${createLink(controller: 'hello', action: 'add')}">Add</a>
		<a href="${createLink(controller: 'hello', action: 'edit')}">Edit</a>
		<table border="1">
			<g:each in="${categoryLIst}" var="cat">
				<tr>
					<td>${cat.id}</td>
					<td>${cat.name}</td>
					<td>${cat.url}</td>
					<td>
						<g:link action="edit" id="${cat.id}" class="btn-edit">Edit</g:link>
						<g:form action="delete" method="DELETE" style="display:inline;">
							<input type="hidden" name="id" value="${cat.id}"/>
							<g:submitButton name="delete" value="Delete"/>
						</g:form>
					</td>
				</tr>
			</g:each>
		</table>
	</div>
</div>

</body>
</html>

