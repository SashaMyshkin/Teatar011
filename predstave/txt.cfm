<cfswitch expression="#session.defaultScript#">
    <cfcase value="sr-Latn">
        <cfset txtPlays = "Predstave">
    </cfcase>
    <cfcase value="sr-Cyrl">
        <cfset txtPlays = "Представе">
    </cfcase>
    <cfcase value="en">
        <cfset txtPlays = "Plays">
    </cfcase>
</cfswitch>