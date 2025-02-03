<cfcomponent>

    <cffunction name="selectPresentationTypes" access="public" returntype="query">
        <cfquery name="q_presentationType" datasource="#application.datasource#">
            SELECT `id`, `type` FROM `auditionPresentationType`;
        </cfquery>
        <cfreturn q_presentationType>
    </cffunction>

</cfcomponent>