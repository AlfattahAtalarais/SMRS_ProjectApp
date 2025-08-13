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
		<form action="${createLink(controller:'hello', action:'save')}" method="POST">
			<div class="form-title">
				<h2>Add Site Form</h2>
			</div>

			<div class="require-form">
				<label for="urlName">URL Name</label>
				<g:textField name="urlName" id="urlName" value="${url?.name}" required="true"/>


				<label for="url">URL</label>
				<g:textField name="url" id="url" value="${url?.url}" required="true"/>

				<g:submitButton name="save" value="Save"/>
				<g:link controller="hello" action="monitored">Cancel</g:link>

			</div>
		</form>
	</div>
</div>

</body>
</html>