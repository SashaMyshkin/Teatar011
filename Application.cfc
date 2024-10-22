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

        <cfinclude template="application.variables.cfm">

        <cfoutput>
            <cfset session.lang = "sr-Latn">

            <cfif not structKeyExists(url, "dv")>
                <cfset url.dv = "false">
            </cfif>

            <cfif not structKeyExists(url, "uq")>
                <cfset url.uq = "">
            </cfif>
            
            <cfif not structKeyExists(session, "defaultMode")>
                <cfset session.defaultMode ="production">
            </cfif>

            <cfif url.dv eq "true">
                <cfset session.defaultMode ="development">
            </cfif>

            <cfsavecontent variable="content">
                <!doctype html>
                <html lang="#session.lang#">
                    <head>
                        <cfmodule template="head.cfm" targetPage="#Arguments.targetPage#">
                    </head>
                    <body class="bg-dark">
                        <cfif url.uq eq "">
                            <cfmodule template="components/navbar/index.cfm">
                        </cfif>        
                        <cfmodule template="#arguments.targetPage#">
                        <cfmodule template="components/footer/index.cfm">
                    </body>
                </html>  
                
            </cfsavecontent>

            #content#
        </cfoutput>        
    </cffunction>

    <cffunction name="onSessionStart">
        <cfset session.lang = application.lang>  
    </cffunction>

    <cffunction name="onApplicationStart">
        <cfset application.scripts = ["sr-Latn"]>
        <cfset application.lang = "sr-Latn">
        <cfset application.modes = ["development", "production"]>
        <cfset application.defaultMode = "production">
        <cfset application.datasource = "teatarc1_teatar011_production">
        <cfset application.root = "teatarc1_teatar011_production">
    </cffunction>

    <cffunction name="onMissingTemplate">
        <cfargument name="targetPage" type="string" required=true/>

        <cfoutput>
            <!doctype html>
            <html lang="#session.lang#">
                <head>
                    <title>404 - Not found</title>
                    <cfmodule template="head.cfm" targetPage="#Arguments.targetPage#">
                </head>
                <body class="bg-dark">
                    
                    <cfmodule template="components/navbar/index.cfm">
                    <cfmodule template="404.cfm">
                    <cfmodule template="components/footer/index.cfm">
                </body>
            </html>  
        </cfoutput>

        <cfreturn true />
    </cffunction>

    
    <cffunction name="onError">
        <cfargument name="Exception" required=true/>
        <cfargument name="EventName" type="String"  required=true/>

        <cfoutput>

            <cfif session.defaultMode eq "development">
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
