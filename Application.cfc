<cfcomponent>
    <cfset this.name = "website">
    <cfset this.locale = "sr_RS">
    <cfset this.timezone = "Europe/Belgrade">
    <cfset this.applicationTimeout = createTimeSpan(2, 0, 0, 0)>
    <cfset this.sessionManagement = true>
    <cfset this.sessionTimeout = createTimeSpan(0, 0, 30, 0)>
    <cfset this.clientManagement = true>
    <cfset this.clientTimeout = createTimeSpan(90, 0, 0, 0)>
    <cfset this.clientStorage = "cookie">
    <cfset this.loginstorage = "session">
    <cfset this.requestTimeout = createTimeSpan(0, 0, 0, 50)>
    <cfset this.charset.web = "UTF-8">
    <cfset this.charset.resource = "UTF-8">
    <cfset this.enablenullsupport = true >

    <cffunction name="onRequest">
        <cfargument name = "targetPage" type="String" required=true/>

        <cfoutput>
            <cfif structKeyExists(url, "defaultScript") and ArrayFind(application.scripts, url.defaultScript) gt 0>
                <cfset session.defaultScript = url.defaultScript>
            </cfif>

            <cfsavecontent variable="content">
                <!doctype html>
                <html lang="#session.defaultScript#">
                    <head>
                        <cfmodule template="head.cfm" targetPage="#Arguments.targetPage#">
                        
                    </head>
                    <body>
                        <cfmodule template="components/navbar/index.cfm">
                        <cfmodule template="#arguments.targetPage#" targetPage="#Arguments.targetPage#">
                    </body>
                </html>   
            </cfsavecontent>

            #content#
        </cfoutput>        
    </cffunction>

    <cffunction name="onSessionStart">

        <cfset session.started = now()>
        <cfset session.defaultScript = application.defaultScript>
        
    </cffunction>

    <cffunction name="onApplicationStart">

        <cfset application.datasource = "teatar011">
        <cfset application.scripts = ["sr-Cyrl", "sr-Latn", "en"]>
        <cfset application.defaultScript = "sr-Cyrl">
        <cfset application.modes = ["development", "production"]>
        <cfset application.defaultMode = "development">
        
    </cffunction>

    <cffunction name="onMissingTemplate">
        <cfargument name="targetPage" type="string" required=true/>

        <cfheader statuscode="404" statustext="Page Not Found">
        <cfinclude template="onMissingTemplate.cfm">

        <cfreturn true />
    </cffunction>

    
    <cffunction name="onError">
        <cfargument name="Exception" required=true/>
        <cfargument name="EventName" type="String"  required=true/>

        <cfoutput>

            <cfif application.defaultMode eq "development">
                <cfdump var="#Arguments.EventName#">
                <cfdump var="#Arguments.Exception#">   
            </cfif>

            <h2>An unexpected error occurred.</h2>
            <p>Please provide the following information to technical support:</p>
            <p>Error Event: #Arguments.EventName#</p>
            <p>Error details:<br>
        
        </cfoutput>
    </cffunction>
</cfcomponent>
