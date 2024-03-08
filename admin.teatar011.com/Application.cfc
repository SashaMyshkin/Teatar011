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


    <cffunction name="onRequestStart">
        <cfargument name="targetPage" type="string" required="true">

        <cfif IsDefined("Form.logout")>
            <cflogout>
        </cfif>

        <cflogin applicationtoken="#this.name#">
            <cfif not isDefined("cflogin")>
                <cfinclude template="loginForm.cfm">
                <cfabort>
            <cfelse>
                <cfif cflogin.name is "" OR cflogin.password is "">
                    <cfoutput>
                        <h2>You must enter text in both the User Name and Password fields.
                        </h2>
                    </cfoutput>
                    <cfinclude template="loginform.cfm">
                <cfelse>
                    <cfquery name="loginQuery" datasource="#application.defaultDatasource#">

                    </cfquery>
                    <cfif loginQuery.Roles NEQ "">
                        <cfloginuser name="#cflogin.name#" Password = "#cflogin.password#" roles="#loginQuery.Roles#">
                    <cfelse>
                        <cfoutput>
                            <H2>Your login information is not valid.<br>Please Try again</H2>
                        </cfoutput>
                        <cfinclude template="loginform.cfm">
                        <cfabort>
                    </cfif> 
                </cfif>
            </cfif>
        </cflogin>

        <cfif GetAuthUser() NEQ "">
            <cfoutput>
                <form action="securitytest.cfm" method="Post">
                    <input type="submit" Name="Logout" value="Logout">
                </form>
            </cfoutput>
        </cfif> 

    </cffunction>

    <cffunction name="onRequest">
        <cfargument name="targetPage" type="string" required="true">

        <cfsavecontent variable="content" allowcon>
            <cfinclude template="#Arguments.targetPage#">
        </cfsavecontent>

        <cfoutput>
            #replace(content, "report", "MyCompany Quarterly Report", "all")#
        </cfoutput>
    </cffunction>



    <cffunction name="onSessionStart">

        <cfset session.started = now()>
        
    </cffunction>

    <cffunction name="onApplicationStart">

        <cfset application.modes = ["development", "production"]>
        <cfset application.defaultMode = "development">
        <cfset application.datasources = ["teatarc1_teatar011_development", "teatarc1_teatar011_production"]>
        <cfset application.defaultDatasource = "teatarc1_teatar011_development">
        <cfset application.scripts = ["cyrillic", "latin", "english"]>
        <cfset application.defaultScript = "cyrillic">
        <cfset application.domain = "admin.teatar011.com">
       
        
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
