<cfcomponent>

    <cfset RESPONSE = createObject('component', "../../utilis/Response")>

    <cffunction name="daLiJeInputValidan" access="remote" returntype="struct">
        <cfargument name="email" type="string">
        
        <cfset var res = RESPONSE.create()>

        <cftry>

            <cfif trim(email) eq "">
                <cfset var res["error"] = true>
                <cfset var res["clientMessage"] = "Unesite imejl adresu.">
                <cfreturn res>
            </cfif>

            <cfif not reFind("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$", email)>
                <cfset var res["error"] = true>
                <cfset var res["clientMessage"] = "Unesite imejl adrsu u ispravnom formatu.">
                <cfreturn res>
            </cfif>

            <cfquery name="selEmail" datasource="#Application.datasource#" username="#Application.username#" password="#Application.password#">
                select id from korisnici where imejl = '#email#'
            </cfquery>

            <cfif selEmail.recordCount eq 0>
                <cfset var res["error"] = true>
                <cfset var res["clientMessage"] = "Korisnik sa unetom imejl adresom ne postoji.">
                <cfreturn res>
            </cfif>

            <cfcatch>
                <cfset var res["error"] = true>
                <cfset var res["clientMessage"] = "Greška prilikom slanja imejla. Kontaktirajte sa administratorom sistema.">
                <cfset var res["consoleMessage"] = "Greška prilikom validacije imejla. " & cfcatch.message & ' ' & cfcatch.detail>
                <cfset var res["cfcatch"] = cfcatch>
                
            </cfcatch>
        </cftry>

        <cfreturn res>
    </cffunction>
    
</cfcomponent>