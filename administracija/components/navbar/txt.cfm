<cfswitch expression="#session.lang#">
    <cfcase value="sr-Latn">
        <cfset txtAnnoucements = "Najave">
        <cfset txtPerformances = "Ansambl">
        <cfset txtMembers = "Repertoar">
        <cfset txtAudition = "Predstave">
        <cfset txtAwards = "Kontakt">
        <cfset txtNews = "Ćirilica">
        <cfset txtLogout = "Izloguj se">
        
    </cfcase>
    <cfcase value="sr-Cyrl">
        <cfset txtAnnoucements = "Најаве">
        <cfset txtPerformances = "Представе">
        <cfset txtMembers = "Чланови">
        <cfset txtAudition = "Аудиција">
        <cfset txtAwards = "Награде">
        <cfset txtNews = "Вести">
        <cfset txtLogout = "Излогуј се">
    </cfcase>
    <cfcase value="en">
        <cfset txtAnnoucements = "Announcements">
        <cfset txtPerformances = "Performances">
        <cfset txtMembers = "Members">
        <cfset txtAudition = "Audition">
        <cfset txtAwards = "Awards">
        <cfset txtNews = "News">
        <cfset txtLogout = "Logout">
    </cfcase>
</cfswitch>