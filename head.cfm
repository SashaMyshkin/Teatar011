<script async src="https://www.googletagmanager.com/gtag/js?id=G-JRD3V68RE9"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-JRD3V68RE9');
</script>

<cfset DATA = createObject('component', 'utilis/MetaTags')>
<cfset metaTags = DATA.getMetaTags("#cgi.SCRIPT_NAME#?#cgi.QUERY_STRING#")>

<cfif metaTags.id eq "" and cgi.HTTPS eq "on">
    <cfset DATA.insertURL("#cgi.SCRIPT_NAME#?#cgi.QUERY_STRING#", '#cgi.HTTPS#')>
</cfif>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="index, follow">
<meta name="author" content="Aleksandar Jovanović">
<meta name="google-site-verification" content="lrd-uRZol0NdMbnOlJ4djmoKIUh7qW8oKtRg79JdzkI" />







<cfoutput>
    <!-- Title -->
    <cfif structKeyExists(metaTags, "title")>
        <title>#metaTags.title#</title>
    </cfif>
    
    <!-- Description -->
    <cfif structKeyExists(metaTags, "description")>
        <meta name="description" content="#metaTags.description#">
    </cfif>
    
    <!-- Keywords -->
    <cfif structKeyExists(metaTags, "keywords")>
        <meta name="keywords" content="#metaTags.keywords#">
    </cfif>
    
    <!-- Open Graph Type -->
    <cfif structKeyExists(metaTags, "og_type")>
        <meta property="og:type" content="#metaTags.og_type#" />
    </cfif>
    
    <!-- Open Graph Site Name -->
    <meta property="og:site_name" content="Studio glume Teatar 011" />
    
    <!-- Open Graph Locale -->
    <meta property="og:locale" content="sr" />
    
    <!-- Open Graph Title -->
    <cfif structKeyExists(metaTags, "og_title")>
        <meta property="og:title" content="#metaTags.og_title#" />
    </cfif>
    
    <!-- Open Graph Description -->
    <cfif structKeyExists(metaTags, "og_description")>
        <meta property="og:description" content="#metaTags.og_description#" />
    </cfif>
    
    <!-- Open Graph URL -->
    <cfif structKeyExists(metaTags, "og_url")>
        <meta property="og:url" content="#metaTags.og_url#" />
    </cfif>
    
    <!-- Open Graph Image -->
    <cfif structKeyExists(metaTags, "og_image")>
        <meta property="og:image" content="#metaTags.og_image#" />
    </cfif>
    
    <!-- Open Graph Image Alt -->
    <cfif structKeyExists(metaTags, "og_image_alt")>
        <meta property="og:image:alt" content="#metaTags.og_image_alt#" />
    </cfif>
</cfoutput>




<link rel="icon" href="/assets/img/logo.png" type="image/png">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/css/alertify.min.css"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/7ea5a508bb.js" crossorigin="anonymous"></script>
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.14.0/build/alertify.min.js"></script>



<style>
    <cfinclude template="styles.css">
</style>
