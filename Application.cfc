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
            <cfif structKeyExists(url, "lang") and ArrayFind(application.scripts, url.lang) gt 0>
                <cfset session.lang = url.lang>
            </cfif>

            <cfif not structKeyExists(url, "dv")>
                <cfset url.dv = "false">
            </cfif>

            <cfif not structKeyExists(url, "audicija")>
                <cfset url.audicija = "false">
            </cfif>

            <cfif not structKeyExists(url, "confirmation")>
                <cfset url.confirmation = "false">
            </cfif>

            <cfsavecontent variable="content">


                
                <cfif url.audicija eq "true">


                    <!doctype html>
                    <html lang="#session.lang#">
                        <head>
                            <cfmodule template="head.cfm" targetPage="#Arguments.targetPage#">
                
                        </head>
                        <body class="bg-dark">
                            <cfmodule template="audicija/index.cfm" metaTags="false">
                            <cfmodule template="components/footer/index.cfm">
                        </body>
                    </html>  
                    
                <cfelseif url.confirmation eq "true">
                    <cfinclude template="confirmation.cfm">
                <cfelseif url.dv eq "false">

                
                    <cfmodule template="comingSoon.cfm">
                <cfelse>
                    <!doctype html>
                    <html lang="#session.lang#">
                        <head>
                            <cfmodule template="head.cfm" targetPage="#Arguments.targetPage#">
                            <cfmodule template="#arguments.targetPage#" metaTags="true">
                        </head>
                        <body class="bg-dark">
                            
                            <cfmodule template="components/navbar/index.cfm">
                            <cfmodule template="#arguments.targetPage#" metaTags="false">
                                <cfdump var="#cgi.request_url.listContainsNoCase('https')#">
                            <cfmodule template="components/footer/index.cfm">
                        </body>
                    </html>   
                </cfif>
                
            </cfsavecontent>

            #content#
        </cfoutput>        
    </cffunction>

    <cffunction name="onSessionStart">
        <cfset session.lang = application.lang>  
    </cffunction>

    <cffunction name="onApplicationStart">
        <cfset application.scripts = ["sr-Cyrl", "sr-Latn", "en"]>
        <cfset application.lang = "sr-Cyrl">
        <cfset application.modes = ["development", "production"]>
        <cfset application.defaultMode = "development">
        <cfset application.datasource = "teatarc1_teatar011_production">
        <cfset application.root = "teatarc1_teatar011_production">
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
