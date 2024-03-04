<cfoutput>
    <cfswitch expression="#url.page#">
        <cfcase value="pocetna">
            <cfinclude template="view/home.cfm">
        </cfcase>
        <cfcase value="repertoar">

        </cfcase>
        <cfcase value="predstave">

        </cfcase>
        <cfcase value="ansambl">

        </cfcase>
        <cfcase value="kontakt">

        </cfcase>
        <cfcase value="nagrade">

        </cfcase>
        <cfdefaultcase>
            <cfinclude template="view/home.cfm">
        </cfdefaultcase>

    </cfswitch>
</cfoutput>