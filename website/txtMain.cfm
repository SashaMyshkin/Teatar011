<cfif not structKeyExists(session, "script") or arrayFind(application.scripts, session.script) eq 0>
    <cfset session.script = application.script>
</cfif>

<cfswitch expression="#session.script#">
    <cfcase value="latin">
        <cfset txtAwards = "Nagrade">
        <cfset txtEnsemble = "Ansambl">
        <cfset txtRepertoire = "Repertoar">
        <cfset txtPlays = "Predstave">
        <cfset txtContact = "Kontakt">
    </cfcase>
    <cfcase value="cyrillic">
        <cfset txtAwards = "Награде">
        <cfset txtEnsemble = "Ансамбл">
        <cfset txtRepertoire = "Репертоар">
        <cfset txtPlays = "Представе">
        <cfset txtContact = "Контакт">
    </cfcase>
    <cfcase value="english">
        <cfset txtAwards = "Awards">
        <cfset txtEnsemble = "Ensemble">
        <cfset txtRepertoire = "Repertoire">
        <cfset txtPlays = "Plays">
        <cfset txtContact = "Contact">
    </cfcase>
</cfswitch>