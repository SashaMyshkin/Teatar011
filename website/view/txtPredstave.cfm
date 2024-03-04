<cfif not structKeyExists(session, "script") or arrayFind(application.scripts, session.script) eq 0>
    <cfset session.script = application.script>
</cfif>

<cfswitch expression="#session.script#">
    <cfcase value="latin">
        <cfset txtAwards = "Nagrade">
    </cfcase>
    <cfcase value="cyrillic">
        <cfset txtAwards = "Награде">
    </cfcase>
    <cfcase value="english">
    </cfcase>
</cfswitch>