<cfoutput>
    <div style="height:54px"></div> 
    
    <cfswitch expression="#url.page#">
        <cfcase value="pocetna">
            <cfinclude template="view/home.cfm">
        </cfcase>
        <cfcase value="repertoar">

        </cfcase>
        <cfcase value="predstave">
            <cfinclude template="view/predstave.cfm">
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