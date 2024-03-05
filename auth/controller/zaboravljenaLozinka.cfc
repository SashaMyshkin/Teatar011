<cfcomponent>
    <cfset RESPONSE = createObject('component', "../../utilis/Response")>
    <cfset MODEL = createObject('component', "../model/zaboravljenaLozinka")>
    <cfset VALIDIRANJE = createObject('component', "../validation/zaboravljenaLozinka")>

    <cffunction name="zaboravljenaLozinka" access="remote" returntype="struct" returnformat="JSON">
        
        <cfset var res = RESPONSE.create()>

        <cftry>

            <cfset var val = VALIDIRANJE.daLiJeInputValidan(form.email)>
            <cfif val.error>
                <cfreturn val>
            </cfif>

            <!-----cfset var val = MODEL.posaljiLinkZaOporavak(form.email)>
            <cfif val.error>
                <cfreturn val>
            </cfif------->

            <cfset res["clientMessage"] = "Link za oporavak lozinke je uspešno poslat. Proverite svoju poštu.">
            <cfset var res["val"] = val>
            <cfcatch>
                <cfset var res["error"] = true>
                <cfset var res["clientMessage"] = "Greška prilikom slanja imejla. Kontaktirajte sa administratorom sistema.">
                <cfset var res["consoleMessage"] = "Greška u kontroleru. " & cfcatch.message & ' ' & cfcatch.detail>
                <cfset var res["cfcatch"] = cfcatch>
            </cfcatch>
        </cftry>

        <cfreturn res>
    </cffunction>
</cfcomponent>