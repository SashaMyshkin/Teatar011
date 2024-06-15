<cfcomponent>
    <cfinclude template="txt.cfm">
    <cfset QUERY = createObject('component', '../utilis/Query')>
    <cfset RESPONSE = createObject('component', '../utilis/Response')>

    <cffunction name="validateData" access="public" returntype="struct">
        <cfargument name="data" type="struct" required="true">

        <cfset var res = RESPONSE.ResponseNew()>

        <cftry>
            <cfif trim(data.name) eq "">
                <cfset var res["error"] = true>
                <cfset var res["clientMessage"] = "#txtNameRequired#">
                <cfreturn res>
            </cfif>
    
            <cfif trim(data.surname) eq "">
                <cfset var res["error"] = true>
                <cfset var res["clientMessage"] = "#txtSurnameRequired#">
                <cfreturn res>
            </cfif>
    
            <cfif trim(data.email) eq "">
                <cfset var res["error"] = true>
                <cfset var res["clientMessage"] = "#txtEmailRequired#">
                <cfreturn res>
            </cfif>
        
            <cfif not REFind("^[\w\.-]+@[\w\.-]+\.\w+$", data.email)>
                <cfset var res["error"] = true>
                <cfset var res["clientMessage"] = "#txtEmailNotValid#">
                <cfreturn res>
            </cfif>

            <cfquery name="q_unique_email" datasource="#application.datasource#">
                select id from candidates 
                where 1=1
                 and auditionId = "#trim(form.auditionId)#" 
                and email = "#trim(form.email)#"
            </cfquery>

            <cfif q_unique_email.recordCount gt 0>
                <cfset var res["error"] = true>
                <cfset var res["clientMessage"] = "#txtApplicationSubmitted#">
                <cfreturn res>
            </cfif>

            <cfif data.phone eq "">
                <cfset var res["error"] = true>
                <cfset var res["clientMessage"] = "#txtPhoneRequired#">
                <cfreturn res>
            </cfif>

            <cfif data.dateOfBirth eq "">
                <cfset var res["error"] = true>
                <cfset var res["clientMessage"] = "#txtDateOfBirthRequired#">
                <cfreturn res>
            </cfif>
    
            <cfif trim(data.biography) eq "">
                <cfset var res["error"] = true>
                <cfset var res["clientMessage"] = "#txtExperienceRequired#">
                <cfreturn res>
            </cfif>
    
            <!-----cfif Len(ListToArray(data.biography, " ")) lt 100>
                <cfset var res["error"] = true>
                <cfset var res["clientMessage"] = "#txt150wordsMin#">
                <cfreturn res>
            </cfif------->
    
            <cfif data.haveYouWatched eq 1 and trim(data.whatYouWatched) eq "">
                <cfset var res["error"] = true>
                <cfset var res["clientMessage"] = "#txtWhichOneRequired#">
                <cfreturn res>
            </cfif>
            <cfcatch>
               <cfset var res["error"] = true>
               <cfset var res["clientMessage"] = "#txtError#"> 
            </cfcatch>
        </cftry>
        
        

        <cfreturn res>


        <cfreturn QUERY.toArray(q_howHeardAboutUs)>
    </cffunction>
</cfcomponent>