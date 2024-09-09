<cfcomponent>
    <cffunction name="getMetaTags" access="public" returntype="struct">
        <cfargument name="identifier" type="string" required="true">

        <cfset var data = structNew()>
        <cfset var data["id"] = "">
        <cfset var data["title"] = "">
        <cfset var data["description"] = "">
        <cfset var data["keywords"] = "">

        <cfquery name="q_metaTags" datasource="#application.datasource#">
            select 
                id, title, description, keywords
            from metaTags
            where pathname = '#identifier#'
        </cfquery>

        <cfset var data["id"] = q_metaTags.id>
        <cfset var data["title"] = q_metaTags.title>
        <cfset var data["description"] = q_metaTags.description>
        <cfset var data["keywords"] = q_metaTags.keywords>

        <cfreturn data>

    </cffunction>

    <cffunction name="insertURL" access="public" returntype="void">
        <cfargument name="identifier" type="string" required="true">
        <cfargument name="https" type="string" required="true">

        <cfquery name="q_metaTags" datasource="#application.datasource#">
            insert into metaTags (pathname,https) values('#identifier#','#https#')
        </cfquery>

    </cffunction>
</cfcomponent>