<cfcomponent>
    <cfset RESPONSE = createObject('component','../../utilis/Response')>

    <cffunction name="getData" returntype="query" access="remote">
        <cfargument name="screenHeight" type="string" required="true">
        <cfargument name="screenWidth" type="string" required="true">

        <cfset var res = RESPONSE.ResponseNew()>

        <cfquery name="announcement" username="#application.username#" password="#application.password#" datasource="#application.datasource#">
            select * from images
        </cfquery>

        <cfquery name="images" username="#application.username#" password="#application.password#" datasource="#application.datasource#">
            select * from images where #screenHeight# <= (height* #screenWidth#) / width
        </cfquery>

        <cfset var res["images"] = images>

       <cfreturn images>
    </cffunction>

</cfcomponent>