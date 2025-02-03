<cfcomponent>
    <cffunction name="validateData">
        <cfset var response = structNew()>
        <cfset var response["error"] = false>
        <cfset var response["message"] = "Podaci su validni.">

        <cfif form.startDate eq "">
            <cfset var response["error"] = true>
            <cfset var response["message"] = "Polje 'Datum početka' ne sme biti prazno.">
            <cfreturn response>
        </cfif>

        <cfif form.auditionTime eq "">
            <cfset var response["error"] = true>
            <cfset var response["message"] = "Polje 'Okvirno vreme' ne sme biti prazno.">
            <cfreturn response>
        </cfif>

        <cfif form.endDate neq "" and form.endDate <= form.startDate>
            <cfset var response["error"] = true>
            <cfset var response["message"] = "Datum završetka ne sme biti manji ili jednak datumu početka.">
            <cfreturn response>
        </cfif>

        <cfif form.enrollmentDateTime neq "">
            <cfif form.endDate neq "" and form.enrollmentDateTime <= form.endDate >
                <cfset var response["error"] = true>
                <cfset var response["message"] = "Datum upisa ne sme biti manji ili jednak datumu završetka audicije.">
                <cfreturn response>
            </cfif>

            <cfif form.enrollmentDateTime <= form.startDate >
                <cfset var response["error"] = true>
                <cfset var response["message"] = "Datum upisa ne sme biti manji ili jednak datumu početka audicije.">
                <cfreturn response>
            </cfif>  
        </cfif>

        <cfreturn response>

    </cffunction>
</cfcomponent>