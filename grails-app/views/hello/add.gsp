<%--
  Created by IntelliJ IDEA.
  User: fairtech
  Date: 12/08/25
  Time: 09.35
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<meta name="layout" content="main"/>
	<asset:stylesheet src="add.css"/>
	<title>Add Form</title>
</head>

<body>
<div class="container">
	<div class="form-add">
		<form action="${createLink(controller:'website', action:'save')}" method="POST">
			<div class="form-title">
				<h2>Add Site Form</h2>
			</div>

			<div class="require-form">
				<form action="${createLink(controller: 'hello', action: 'save')}" method="POST">
					<label for="urlName">URL Name</label>
					<input type="text" name="urlName" value="${Url?.urlName ?: ''}"/>

					<label for="url">URL</label>
					<input type="text" name="url" value="${Url?.url ?: ''}"/>

					<button type="submit" action="">Save</button>
					<a href="${createLink(controller: 'hello', action: 'monitored')}">Cancel</a>
				</form>
			</div>
		</form>
	</div>


</div>

</body>
</html>