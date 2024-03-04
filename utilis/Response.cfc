<cfcomponent>
    <cffunction name="ResponseNew" returntype="struct" access="remote">

        <cfset var response = structNew()>
        <cfset var response["error"] = false>
        <cfset var response["clientMessage"] = "">
        <cfset var response["consoleMessage"] = "">
        <cfset var response["cfcatch"] = structNew()>

       <cfreturn response>
    </cffunction>
</cfcomponent>