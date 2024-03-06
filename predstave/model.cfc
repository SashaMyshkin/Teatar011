<cfcomponent>
    <cfset RESPONSE = createObject('component','../utilis/Response')>

    <cffunction name="getPlays" returntype="query" access="remote">

        <cfquery name="q_plays" datasource="#application.datasource#">
            SELECT [id]
                ,[name]
                ,[active]
                ,[poster]
                ,[alt]
                ,[typeOfPlay]
            FROM [dbo].[plays]
        </cfquery>

       <cfreturn q_plays>
    </cffunction>

</cfcomponent>