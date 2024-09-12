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
</cfcomponent>