<cfif cgi.request_url.listContainsNoCase('https') eq '0'>
    <cfset application["root"] = "http://localhost:8888/Teatar011/administracija/">
<cfelse>
    <cfset application["root"] = "https://teatar011.com/administracija/">
</cfif>

<cfset application.langs = ["sr-Cyrl", "sr-Latn", "en"]>
<cfset application.lang = "sr-Latn">
<cfset application.modes = ["development", "production"]>
<cfset application.datasource = "teatarc1_teatar011_production">