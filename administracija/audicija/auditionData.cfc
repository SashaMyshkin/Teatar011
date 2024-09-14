<cfcomponent>

    <cffunction name="getAllCandidates" access="public" returntype="query">

        <cfquery name="q_candidates" datasource="#application.datasource#">
            select c.id, 
            c.name, 
            c.surname, 
            DATE_FORMAT(c.dateOfBirth, '%d.%m.%Y') dateOfBirth, 
            h.way heardAboutUs, 
            c.whatYouWatched playsWatched,
            c.email,
            confirmed,
            s.sex,
            c.shortlisted
            from candidates c
            inner join howHeardAboutUs h on h.id = c.howHeardAboutUsId
            inner join sex s on s.id = c.sexId
            where 1=1
            <cfif structKeyExists(form, 'name') and form.name neq ''>
                and c.name like '%#form.name#%'
            </cfif>
            <cfif structKeyExists(form, 'surname') and form.surname neq ''>
                and c.surname like '%#form.surname#%'
            </cfif>
            <cfif structKeyExists(form, 'sex') and form.sex neq ''>
                and s.id = '#form.sex#'
            </cfif>
            <cfif structKeyExists(form, 'confirmed') and form.confirmed neq ''>
                and c.confirmed = '#form.confirmed#'
            </cfif>
            order by c.id desc
        </cfquery>

        <cfreturn q_candidates>
    </cffunction>

    <cffunction name="getAllShortlisted" access="public" returntype="query">

        <cfquery name="q_shortlisted" datasource="#application.datasource#">
            select c.id, 
            c.name, 
            c.surname, 
            DATE_FORMAT(c.dateOfBirth, '%d.%m.%Y') dateOfBirth, 
            h.way heardAboutUs, 
            c.whatYouWatched playsWatched,
            c.email,
            confirmed,
            s.sex
            from candidates c
            inner join howHeardAboutUs h on h.id = c.howHeardAboutUsId
            inner join sex s on s.id = c.sexId
            where shortlisted = 1
            order by c.id desc
        </cfquery>

        <cfreturn q_shortlisted>
    </cffunction>

    <cffunction name="getShortlistedUnnotified" access="public" returntype="query">

        <cfquery name="q_shortlisted_unnotified" datasource="#application.datasource#">
            select 
            c.id, 
            c.name, 
            c.surname, 
            DATE_FORMAT(c.dateOfBirth, '%d.%m.%Y') dateOfBirth, 
            c.email, 
            c.uniqueKey
            from candidates c
            where 
            shortlisted = 1
            and confirmationEmail = 0
            order by c.id desc
        </cfquery>

        <cfreturn q_shortlisted_unnotified>
    </cffunction>

    <cffunction name="getCandidateById" access="public" returntype="query">

        <cfquery name="q_CandidateById" datasource="#application.datasource#">
            SELECT c.`id`, 
            `auditionId`, 
            `name`, 
            `surname`, 
            DATE_FORMAT(c.dateOfBirth, '%d. %m. %Y.') dateOfBirth,
            `email`, 
            hhs.way howHeardAboutUs, 
            `haveYouWatched`, 
            `whatYouWatched`, 
            `sexId`, 
            `biography`, 
            `phone`, 
            `shortlisted`, 
            `confirmationEmail`, 
            `accepted`, 
            `uniqueKey`, 
            `confirmed`, 
            c.`theWay`
             FROM `candidates` c
             inner join howHeardAboutUs hhs on hhs.id = c.howHeardAboutUsId
             WHERE c.id = '#url.q#'
        </cfquery>

        <cfreturn q_CandidateById>
    </cffunction>

    <cffunction name="shortlistTheCandidate" access="public" returntype="void">
        <cfquery name="q_shortlist_update" datasource="#application.datasource#">
            update candidates set shortlisted = <cfif structKeyExists(form, 'shortlisted')>1<cfelse>0</cfif> where id = '#url.q#'
        </cfquery>
    </cffunction>

    <cffunction name="getConfirmedCandidates" access="public" returntype="query">

        <cfquery name="q_candidates" datasource="#application.datasource#">
            select 
            c.id, 
            c.name, 
            c.surname, 
            c.email, 
            SUBSTRING(auditionTime, 1, 5) auditionTime
            
            from candidates c
            where 1=1
            and shortlisted = 1
            and confirmationEmail = 1
            and confirmed = 1
            and theWay is not null
            and auditionTime is not null
            and timeEmail = 0
           
            order by c.id desc
        </cfquery>

        <cfreturn q_candidates>
    </cffunction>
</cfcomponent>