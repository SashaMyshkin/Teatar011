<cfcomponent>
    <cffunction name="getMetaTags" access="public" returntype="query">
        <cfargument name="identifier" type="string" required="true">

        <cfquery name="q_metaTags" datasource="#application.datasource#">
            SELECT `id`
            , `pathname`
            , `title`
            , `description`
            , `keywords`
            , `og_type`
            , `og_title`
            , `og_description`
            , `og_url`
            , `og_image`
            , `og_image_alt`
            , `https` 
            FROM `metaTags`
            where pathname = '#identifier#'
        </cfquery>

        <cfreturn q_metaTags>
    </cffunction>

    <cffunction name="insertURL" access="public" returntype="void">
        <cfargument name="identifier" type="string" required="true">
        <cfargument name="https" type="string" required="true">

        <cftry>
            <cfquery name="q_metaTags" datasource="#application.datasource#">
                insert into metaTags (pathname,https) values('#identifier#','#https#')
            </cfquery>
            <cfcatch>
            </cfcatch>
        </cftry>

        

    </cffunction>
</cfcomponent>