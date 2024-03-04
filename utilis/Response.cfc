<cfcomponent>
    <cffunction name="ResponseNew" returntype="struct" access="remote">

        <cfset var response = structNew()>
        <cfset var response["error"] = false>
        <cfset var response["clientMessage"] = false>
        <cfset var response["consoleMessage"] = false>
        <cfset var response["cfcatch"] = structNew()>

       <cfreturn structNew()>
    </cffunction>
</cfcomponent>