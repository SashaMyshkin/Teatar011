<cfif cgi.request_url.listContainsNoCase('https') eq '0'>
    <cfset application["root"] = "https://teatar011.com/">
<cfelse>
    <cfset application["root"] = "http://localhost:8888/Teatar011/">
</cfif>

<cfset application.langs = ["sr-Cyrl", "sr-Latn", "en"]>
<cfset application.lang = "sr-Cyrl">
<cfset application.modes = ["development", "production"]>
<cfset application.defaultMode = "development">
<cfset application.datasource = "teatarc1_teatar011_production">