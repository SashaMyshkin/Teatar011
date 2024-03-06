<cfcomponent>
    <cfset this.name = "administrator">
    <cfset this.locale = "sr_RS">
    <cfset this.timezone = "Europe/Belgrade">
    <cfset this.applicationTimeout = createTimeSpan(0, 0, 30, 0)>
    <cfset this.sessionManagement = true>
    <cfset this.sessionTimeout = createTimeSpan(0, 0, 30, 0)>
    <cfset this.clientManagement = true>
    <cfset this.clientTimeout = createTimeSpan(0, 0, 30, 0)>
    <cfset this.clientStorage = "cookie">
    <cfset this.loginstorage = "session">
    <cfset this.requestTimeout = createTimeSpan(0, 0, 0, 50)>
    <cfset this.charset.web = "UTF-8">
    <cfset this.charset.resource = "UTF-8">

    <cffunction name="onRequest">
        <cfargument name = "targetPage" type="String" required=true/>

        <!-----cfsavecontent variable="content">
            <cfinclude template="#Arguments.targetPage#">
        </cfsavecontent------>

        <cfoutput>
            <cfset n = "33333">
            <cfdump var="#n#">
            <cfset n = "44444444">
            <cfdump var="#n#">
        </cfoutput>

    </cffunction>

    <cffunction name="onSessionStart">

        <cfset session.started = now()>
        
    </cffunction>

    <cffunction name="onApplicationStart">

        <cfset application.datasource = "teatar011">
        <cfset application.scripts = ["cyrillic", "latin", "english"]>
        <cfset application.defaultScript = "cyrillic">
        <cfset application.modes = ["development", "production"]>
        <cfset application.defaultMode = "development">
        
    </cffunction>

    <cffunction name="onMissingTemplate">
        <cfargument name="targetPage" type="string" required=true/>

        <cfinclude template="onMissingTemplate.cfm">

        <cfreturn true />
    </cffunction>

    
    <cffunction name="onError">
        <cfargument name="Exception" required=true/>
        <cfargument name="EventName" type="String"  required=true/>

        <cfoutput>
            <h2>An unexpected error occurred.</h2>
            <p>Please provide the following information to technical support:</p>
            <p>Error Event: #Arguments.EventName#</p>
            <p>Error details:<br>
        
        </cfoutput>
    </cffunction>
</cfcomponent>
