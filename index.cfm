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
			<cfif url.app eq "website">
				<cfinclude template="website/txtMain.cfm">
				<cfinclude template="website/boxMenu.cfm">
			</cfif>

			
		</body>
	</html>
</cfoutput>