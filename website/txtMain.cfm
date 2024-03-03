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
        <cfset txtCyrillic = "Ćirilica">
        <cfset txtLatin = "Latinica">
        <cfset txtEnglish = "Engleski">
    </cfcase>
    <cfcase value="cyrillic">
        <cfset txtAwards = "Награде">
        <cfset txtEnsemble = "Ансамбл">
        <cfset txtRepertoire = "Репертоар">
        <cfset txtPlays = "Представе">
        <cfset txtContact = "Контакт">
        <cfset txtCyrillic = "Ћирилица">
        <cfset txtLatin = "Латиница">
        <cfset txtEnglish = "Енглески">
    </cfcase>
    <cfcase value="english">
        <cfset txtAwards = "Awards">
        <cfset txtEnsemble = "Artists">
        <cfset txtRepertoire = "Repertoire">
        <cfset txtPlays = "Performances">
        <cfset txtContact = "Contact">
        <cfset txtCyrillic = "Cyrillic">
        <cfset txtLatin = "Latin">
        <cfset txtEnglish = "English">
    </cfcase>
</cfswitch>