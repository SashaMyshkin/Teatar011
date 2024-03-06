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