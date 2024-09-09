

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="index, follow">
<meta name="author" content="Aleksandar Jovanović">
<meta name="google-site-verification" content="lrd-uRZol0NdMbnOlJ4djmoKIUh7qW8oKtRg79JdzkI" />

<cfset DATA = createObject('component', 'utilis/MetaTags')>
<cfset metaTags = DATA.getMetaTags("#cgi.SCRIPT_NAME#?#cgi.QUERY_STRING#")>

<cfif metaTags.id eq "" and cgi.HTTPS eq "on">
    <cfset DATA.insertURL("#cgi.SCRIPT_NAME#?#cgi.QUERY_STRING#", '#cgi.HTTPS#')>
</cfif>

<link rel="shortcut icon" href="/assets/img/favicon.ico" type="image/x-icon">
<link rel="icon" href="/assets/img/favicon.ico" type="image/x-icon">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/alertify.min.css"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/7ea5a508bb.js" crossorigin="anonymous"></script>
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/alertify.min.js"></script>



<style>
    <cfinclude template="styles.css">
</style>
