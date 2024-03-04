<cfcomponent>
    <cfset RESPONSE = createObject('component','../../utilis/Response')>

    <cffunction name="getData" returntype="struct" access="remote">

        <cfset var res = RESPONSE.ResponseNew()>

        <cfquery name="announcement" username="#application.username#" password="#application.password#" datasource="#application.datasource#">
            select * from images
        </cfquery>

        <cfquery name="images" username="#application.username#" password="#application.password#" datasource="#application.datasource#">
            select * from images
        </cfquery>

        <cfset var res["images"] = images>

       <cfreturn res>
    </cffunction>

</cfcomponent>