<cfcomponent>

    <cfset RESPONSE = createObject('component', "../../utilis/Response")>

    <cffunction name="daLiSuKredencijaliValidni" access="remote" returntype="struct">
        <cfargument name="username" type="string">
        <cfargument name="password" type="string">
        
        <cfset var res = RESPONSE.create()>

        <cftry>

            <cfif trim(username) eq "">
                <cfset var res["error"] = true>
                <cfset var res["clientMessage"] = "Unesite korisničko ime.">
                <cfreturn res>
            </cfif>

            <cfif trim(password) eq "">
                <cfset var res["error"] = true>
                <cfset var res["clientMessage"] = "Unesite lozinku.">
                <cfreturn res>
            </cfif>

            <cfcatch>
                <cfset var res["error"] = true>
                <cfset var res["clientMessage"] = "Greška prilikom prijavljivanja. Kontaktirajte sa administratorom sistema.">
                <cfset var res["consoleMessage"] = "Greška prilikom validacije kredencijala. " & cfcatch.message & ' ' & cfcatch.detail>
                <cfset var res["cfcatch"] = cfcatch>
            </cfcatch>
        </cftry>

        <cfreturn res>
    </cffunction>
    
</cfcomponent>