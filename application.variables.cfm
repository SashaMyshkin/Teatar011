<cfif cgi.request_url.listContainsNoCase('https') eq '0'>
    <cfset application["root"] = "http://localhost:8888/Teatar011/">
    <cfset application["production"] = false>
<cfelse>
    <cfset application["root"] = "https://teatar011.com/">
    <cfset application["production"] = true>
</cfif>

<cfset application.langs = ["sr-Latn"]>
<cfset application.lang = "sr-Latn">
<cfset application.modes = ["development", "production"]>
<cfset application.datasource = "teatarc1_teatar011_production">