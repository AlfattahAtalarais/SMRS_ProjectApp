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
	<asset:stylesheet src="edit.css"/>
	<title>Edit Form</title>
</head>

<body>
<div class="container">
	<div class="form-edit">
		<g:form action="update" method="PUT">
			<g:hiddenField name="id" value="${url?.id}"/>
			<div class="form-title">
				<h2>Edit Form</h2>
			</div>

			<div class="require-form">
				<label for="name">URL Name</label>
				<g:textField name="name" id="name" value="${url?.name}" required="true"/>

				<label for="url">URL</label>
				<g:textField name="url" id="url" value="${url?.url}" required="true"/>

				<div class="button-area">
					<g:submitButton name="update" value="Save"/>
					<g:link controller="hello" action="monitored" class="btn-cancel">Cancel</g:link>
				</div>

			</div>
		</g:form>
	</div>

</div>

</body>
</html>