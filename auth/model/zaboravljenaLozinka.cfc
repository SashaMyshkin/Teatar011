<cfcomponent>

    <cffunction name="daLiJeImejlPostojeci" access="remote" returntype="struct">
        <cfargument name="email" type="string">
        
        <cfset var res = RESPONSE.create()>
    
        <cftry>
            
    
            <cfset var sigurnosniKljuc = STRINGS.generateRandomString(40)>
    
            <cfquery name="newSession"  datasource="#Application.datasource#" username="#Application.username#" password="#Application.password#">
                INSERT INTO `sesije`
                    (
                    `korisnikId`,
                    `datumPocetka`,
                    `datumOsvezenja`,
                    `datumZavrsetka`,
                    `sigurnosniKljuc`)
                VALUES
                    (
                    '#korisnikId#',
                    now(),
                    now(),
                    null,
                    '#sigurnosniKljuc#');
            </cfquery>
    
            <cfset session.korisnikId = korisnikId>
            <cfset session.sigurnosniKljuc = sigurnosniKljuc>
    
            <cfcatch>
                <cfset var res["error"] = true>
                <cfset var res["clientMessage"] = "Greška prilikom prijavljivanja. Kontaktirajte sa administratorom sistema.">
                <cfset var res["consoleMessage"] = "Greška prilikom kreiranja sesije. " & cfcatch.message & ' ' & cfcatch.detail>
                <cfset var res["cfcatch"] = cfcatch>
            </cfcatch>
        </cftry>
    
        <cfreturn res>
    </cffunction>

</cfcomponent>