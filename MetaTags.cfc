<cfcomponent>
    <cffunction name="getMetaTags" access="public" returntype="struct">
        <cfargument name="identifier" type="string" required="true">

        <cfset var data = structNew()>
        <cfset var data["title"] = "">
        <cfset var data["description"] = "">
        <cfset var data["keywords"] = "">

        <cfquery name="q_metaTags" datasource="#application.datasource#">
            select 
                title, description, keywords
            from metaTags
            where pathname = '#identifier#'
        </cfquery>

        <cfset var data["title"] = q_metaTags.title>
        <cfset var data["description"] = q_metaTags.description>
        <cfset var data["keywords"] = q_metaTags.keywords>

        <cfreturn data>

    </cffunction>
</cfcomponent>