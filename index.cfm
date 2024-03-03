<cfparam name="url.app" default="">
<cfparam name="url.page" default="">
<cfparam name="url.part" default="">
<cfparam name="url.script" default="">

<cfif arrayFind(application.scripts, url.script) neq 0>
	<cfset session.script = url.script>
</cfif>

<cfif not structKeyExists(session, "app")>
    <cfset session.app = application.app>
</cfif>

<cfif arrayFind(application.apps, url.app) neq 0>
	<cfset session.app = url.app>
</cfif>

<cfoutput>
	<!doctype html>
	<html lang="">
		<head>
			<title>Bootstrap demo</title>
			<meta charset="utf-8">
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<link rel="shortcut icon" href="assets/img/favicon.ico" type="image/x-icon">
			<link rel="icon" href="assets/img/favicon.ico" type="image/x-icon">

			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

  			<link href="global.css" rel="stylesheet">
		</head>
		<body>
			<cfif session.app eq "website">
				<cfinclude template="website/txtMain.cfm">
				<cfinclude template="website/boxMenu.cfm">
			</cfif>

			
		</body>
	</html>
</cfoutput>