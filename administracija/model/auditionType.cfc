<cfcomponent>

    <cffunction name="selectAuditionTypes" access="public" returntype="query">
        <cfquery name="q_auditionType" datasource="#application.datasource#">
            SELECT `id`, `type` FROM `auditionType`;
        </cfquery>
        <cfreturn q_auditionType>
    </cffunction>

</cfcomponent>
