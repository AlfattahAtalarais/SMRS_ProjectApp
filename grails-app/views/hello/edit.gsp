<%--
  Created by IntelliJ IDEA.
  User: fairtech
  Date: 12/08/25
  Time: 10.43
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<meta name="layout" content="main"/>
	<asset:stylesheet src="add.css"/>
	<title>Edit Form</title>
</head>

<body>
<div class="container">
	<div class="form-add">
		<form action="${createLink(controller:'website', action:'save')}" method="POST">
			<div class="form-title">
				<h2>Edit Form</h2>
			</div>

			<div class="require-form">
				<label for="name">Name Website</label>
				<input type="text" id="name" name="name" placeholder="Enter New Website Name" required>

				<label for="url">URL Site</label>
				<input type="url" id="url" name="url" placeholder="https://example.com" required>

				<button type="submit">Save</button>
			</div>
		</form>
	</div>


</div>

</body>
</html>