<cfcomponent>

    <cffunction name="isThereOpenAudition" access="public" returntype="query">

        <cfquery name="q_audition" datasource="#application.datasource#">
            SELECT `id`
            FROM `audition` 
            WHERE 1=1
            and isOpen = 1
        </cfquery>

        <cfreturn q_audition>

    </cffunction>

</cfcomponent>