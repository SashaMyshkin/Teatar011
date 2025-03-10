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
            c.shortlisted,
            c.auditionTime,
            c.timeEmail
            from candidates c
            inner join howHeardAboutUs h on h.id = c.howHeardAboutUsId
            inner join sex s on s.id = c.sexId
            where 1=1
            <cfif structKeyExists(form, 'name') and form.name neq ''>
                and c.name like '%#form.name#%'
            </cfif>
            <cfif structKeyExists(form, 'auditionId') and form.auditionId neq ''>
                and auditionId = '#auditionId#'
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
            c.`theWay`,
            c.auditionTime,
            c.timeEmail
             FROM `candidates` c
             inner join howHeardAboutUs hhs on hhs.id = c.howHeardAboutUsId
             WHERE c.id = '#url.q#'
        </cfquery>

        <cfreturn q_CandidateById>
    </cffunction>

    <cffunction name="getCandidatesByAuditionId" access="public" returntype="query">

        <cfquery name="q_candidates_by_audition" datasource="#application.datasource#">
            select c.id, 
            c.name, 
            c.surname, 
            DATE_FORMAT(c.dateOfBirth, '%d.%m.%Y') dateOfBirth, 
            h.way heardAboutUs, 
            c.whatYouWatched playsWatched,
            c.email,
            confirmed,
            s.sex,
            c.shortlisted,
            c.auditionTime,
            c.timeEmail,
            c.accepted
            from candidates c
            inner join howHeardAboutUs h on h.id = c.howHeardAboutUsId
            inner join sex s on s.id = c.sexId
            where 1=1
            and auditionId = '#session.auditionId#'
            order by c.id desc
        </cfquery>

        <cfreturn q_candidates_by_audition>
    </cffunction>
</cfcomponent>