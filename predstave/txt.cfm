<cfswitch expression="#session.defaultScript#">
    <cfcase value="sr-Latn">
        <cfset txtPlays = "Predstave">
        <cfset txtTheEveningRose = "Večernja ruža">
        <cfset txtTheEveningRoseAlt = "Poster predstave Večernja ruža.">
    </cfcase>
    <cfcase value="sr-Cyrl">
        <cfset txtPlays = "Представе">
        <cfset txtTheEveningRose = "Вечерња ружа">
        <cfset txtTheEveningRoseAlt = "Постер представе Вечерња ружа.">
    </cfcase>
    <cfcase value="en">
        <cfset txtPlays = "Plays">
        <cfset txtTheEveningRose = "The Evening Rose">
        <cfset txtTheEveningRoseAlt = "Poster of the play Evening Rose.">
    </cfcase>
</cfswitch>