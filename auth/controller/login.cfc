<cfcomponent>
    <cfset RESPONSE = createObject('component', "../../utilis/Response")>
    <cfset MODEL = createObject('component', "../model/login")>
    <cfset VALIDIRANJE = createObject('component', "../validation/login")>

    <cffunction name="login" access="remote" returntype="struct" returnformat="JSON">
        
        <cfset var res = RESPONSE.create()>

        <cftry>

            <cfset var val = VALIDIRANJE.daLiSuKredencijaliValidni(form.username, form.password)>
            <cfif val.error>
                <cfreturn val>
            </cfif>

            <cfset var val = MODEL.daLiSuKredencijaliIspravni(form.username, form.password)>
            <cfif val.error>
                <cfreturn val>
            </cfif>

            <cfset var val = MODEL.ulogujKorisnika(val.korisnikId)>
            <cfif val.error>
                <cfreturn val>
            </cfif>

            <cfset res["clientMessage"] = "Uspešno ste se ulogovali u aplikaciju.">
        
            <cfcatch>
                <cfset var res["error"] = true>
                <cfset var res["clientMessage"] = "Greška prilikom prijavljivanja. Kontaktirajte sa administratorom sistema.">
                <cfset var res["consoleMessage"] = cfcatch.message & ' ' & cfcatch.detail>
                <cfset var res["cfcatch"] = cfcatch>
            </cfcatch>
        </cftry>

        <cfreturn res>
    </cffunction>

    <cffunction name="logout" access="remote" returntype="struct" returnformat="JSON">
        <cfset var res = RESPONSE.create()>

        <cftry>

            <cfset var val = MODEL.izlogujKorisnika()>
            <cfif val.error>
                <cfreturn val>
            </cfif>

            <cfset var res["clientMessage"] = "Uspešno ste se izlogovali iz aplikacije.">

            <cfcatch>
                <cfset var res["error"] = true>
                <cfset var res["clientMessage"] = "Greška prilikom prijavljivanja. Kontaktirajte sa administratorom sistema.">
                <cfset var res["consoleMessage"] = cfcatch.message & ' ' & cfcatch.detail>
                <cfset var res["cfcatch"] = cfcatch>
            </cfcatch>
        </cftry>

        <cfreturn res>
    </cffunction>
</cfcomponent>