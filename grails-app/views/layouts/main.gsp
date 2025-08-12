<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>

%{--    <asset:stylesheet src="application.css"/>--}%
    <asset:stylesheet src="index.css"/>

	<!-- Fonts -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

    <g:layoutHead/>
</head>

<body>
<div class = "header">
    <div class = "mid-area">
        <h1>Site Monitoring & Reporting System</h1>
    </div>
</div>
<nav class="nav-links">
    <div class="nav-item">
        <ul>
            <li>
                <a href="${createLink(controller: 'hello', action: 'overview')}">Overview</a>
            </li>
            <li>
                <a href="${createLink(controller: 'hello', action: 'monitored')}">Monitored Sites</a>
            </li>
            <li>
                <a href="${createLink(controller: 'hello', action: 'report')}">Report & Issues</a>
            </li>
        </ul>
    </div>
</nav>

<g:layoutBody/>



<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>

<asset:javascript src="application.js"/>

</body>
</html>
