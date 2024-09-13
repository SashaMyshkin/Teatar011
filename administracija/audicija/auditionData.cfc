<cfcomponent>

    <cffunction name="getAllCandidates" access="public" returntype="query">

        <cfquery name="q_candidates" datasource="#application.datasource#">
            select c.id, 
            c.name, 
            c.surname, 
            DATE_FORMAT(c.dateOfBirth, '%d.%m.%Y') dateOfBirth, 
            h.way heardAboutUs, 
            c.whatYouWatched playsWatched,
            c.email
            from candidates c
            inner join howHeardAboutUs h on h.id = c.howHeardAboutUsId
            order by c.id desc
        </cfquery>

        <cfreturn q_candidates>
    </cffunction>

    <cffunction name="getAllShortlisted" access="public" returntype="query">

        <cfquery name="q_shortlisted" datasource="#application.datasource#">
            select 
            c.id, 
            c.name, 
            c.surname, 
            DATE_FORMAT(c.dateOfBirth, '%d.%m.%Y') dateOfBirth, 
            c.email, 
            c.uniqueKey
            from candidates c
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
</cfcomponent>