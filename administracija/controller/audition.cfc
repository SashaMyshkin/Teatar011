<cfcomponent>
    <cfset auditionValidation = createObject('component', '../validation/audition')>
    <cfset auditionModel = createObject('component', '../model/audition')>

    <cffunction name="mngAudition">

        <cfset var response = structNew()>

        <cfset var response = auditionValidation.validateData()>
        
        <cfif response.error>
            <cfreturn response>
        </cfif>

        <cfset var openAuditionId = auditionModel.getOpenAuditionId()>

        <cfif form.isOpen eq "1" and openAuditionId neq "" and openAuditionId neq url.auditionId>
            <cfset var response["error"] = true>
            <cfset var response["message"] = "Postoji otvorena audicija.">
            <cfreturn response>
        </cfif>

        <cfif auditionModel.getAuditionByDate(form.startDate) neq "">
            <cfset var response["error"] = true>
            <cfset var response["message"] = "Već postoji audicija sa ovim datumom početka ili datum početka upada u opseg postojeće audicije.">
            <cfreturn response>
        </cfif>

        <cftransaction action="begin">
            <cftry>
                <cfset auditionInstance = auditionModel.initFromForm()>
                <cfset auditionInstance.setUniqueKey(form.auditionType & month(form.startDate) & year(form.startDate))>
    
                <cfif url.auditionId eq "">
                    <cfset auditionInstance.insertAudition()>
                <cfelse>
                    <cfset auditionInstance.updateAudition()>
                </cfif>

                <cfset var response["error"] = false>
                <cfset var response["message"] = "Podaci su uspešno sačuvani.">
                <cfset var response["auditionId"] = auditionInstance.getAuditionId()>

                <cfcatch>
                    <cftransaction action="rollback">
                    <cfset var response["error"] = true>
                    <cfset var response["message"] = "Desila se greška. Podaci nisu sačuvani">
                    <cfdump var="#cfcatch#">
                </cfcatch>
            </cftry>
        </cftransaction>

        <cfreturn response>

    </cffunction>

    <cffunction name="endAudition">

        <cfset var response = structNew()>

        <cfset auditionData = auditionModel.selectAudition(url.auditionId)>

        <cfif auditionData.enrollmentDateTime eq "">
            <cfset var response.error = true>
            <cfset var response.message = "Nije moguće zatvoriti audiciju ako se ne popune datum i vreme upisa.">
            <cfreturn response>
        </cfif>

        <cfif auditionData.membershipFee eq "">
            <cfset var response.error = true>
            <cfset var response.message = "Nije moguće zatvoriti audiciju ako se ne popuni članarina.">
            <cfreturn response>
        </cfif>

        <cfset auditionModel.setFinished(url.auditionId, 1)>
        <cfset auditionModel.setIsOpen(url.auditionId, 0)>

        <cfset var response.error = false>

        <cfreturn response>

    </cffunction>
</cfcomponent>