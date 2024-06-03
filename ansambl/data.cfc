<cfcomponent>


    <cfset QUERY = createObject('component', '../utilis/Query')>

    <cffunction name="getArtists" access="public" returntype="array">

        <cfquery name="q_artists" datasource="#application.datasource#">
            select CONCAT(name, ' ', surname) as fullname,
                ms.status,
                img,
                pathname,
                dateOfJoining,
                m.membershipStatus
            from members m 
            inner join membershipStatus ms on ms.id = m.membershipStatus
            where 1=1
            and active = 1
            and dateOfJoining is not null
            order by dateOfJoining;
        </cfquery>

        <cfreturn QUERY.toArray(q_artists)>
    </cffunction>
</cfcomponent>