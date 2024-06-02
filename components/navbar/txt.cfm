<cfswitch expression="#session.defaultScript#">
    <cfcase value="sr-Latn">
        <cfset txtAwards = "Nagrade">
        <cfset txtEnsemble = "Ansambl">
        <cfset txtRepertoire = "Repertoar">
        <cfset txtPlays = "Predstave">
        <cfset txtContact = "Kontakt">
        <cfset txtCyrillic = "Ćirilica">
        <cfset txtLatin = "Latinica">
        <cfset txtEnglish = "Engleski">
        <cfset txtHome = "Početna">
    </cfcase>
    <cfcase value="sr-Cyrl">
        <cfset txtAwards = "Награде">
        <cfset txtEnsemble = "Ансамбл">
        <cfset txtRepertoire = "Репертоар">
        <cfset txtPlays = "Представе">
        <cfset txtContact = "Контакт">
        <cfset txtCyrillic = "Ћирилица">
        <cfset txtLatin = "Латиница">
        <cfset txtEnglish = "Енглески">
        <cfset txtHome = "Почетна">
    </cfcase>
    <cfcase value="en">
        <cfset txtAwards = "Awards">
        <cfset txtEnsemble = "Artists">
        <cfset txtRepertoire = "Repertoire">
        <cfset txtPlays = "Performances">
        <cfset txtContact = "Contact">
        <cfset txtCyrillic = "Cyrillic">
        <cfset txtLatin = "Latin">
        <cfset txtEnglish = "English">
        <cfset txtHome = "Home">
    </cfcase>
</cfswitch>