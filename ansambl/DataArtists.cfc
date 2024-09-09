<cfcomponent>


    <cfset QUERY = createObject('component', '../utilis/Query')>

    <cffunction name="getArtists" access="public" returntype="array">

        <cfquery name="q_artists" datasource="#application.datasource#">
            select 
                case
                    when '#session.lang#' = 'sr-Cyrl' then CONCAT(nameCyr, ' ', surnameCyr)
                    else CONCAT(name, ' ', surname)
                end fullname,
                case
                    when '#session.lang#' = 'sr-Cyrl' then ms.statusCyr
                    when '#session.lang#' = 'sr-Latn' then ms.status
                    else ''
                end status,
                img,
                alt,
                identifier,
                dateOfJoining,
                m.membershipStatus
            from members m 
            inner join membershipStatus ms on ms.id = m.membershipStatus
            left join awards a on m.id = a.memberId
            where 1=1
            and m.active = 1
            and m.membershipStatus != 5
            group by img, alt, identifier, dateOfJoining, membershipStatus
            order by count(a.id) desc, dateOfJoining
        </cfquery>

        <cfreturn QUERY.toArray(q_artists)>
    </cffunction>

    <cffunction name="getArtist" access="public" returntype="struct">
        <cfargument name="identifier" type="string" required="true">

        <cfset data = structNew()>
        <cfset data["paragraphs"] = arrayNew()>
        <cfset data["motto"] = "">
        <cfset data["fullname"] = "">
        <cfset data["img"] = "">
        <cfset data["alt"] = "">

        <cfquery name="q_artist" datasource="#application.datasource#">
            select 
                id,
                case
                    when '#session.lang#' = 'sr-Cyrl' then CONCAT(nameCyr, ' ', surnameCyr)
                    else CONCAT(name, ' ', surname)
                end fullname,
                img,
                alt
            from members 
            where 1=1
            and identifier = '#arguments.identifier#'
            and active = 1
            and membershipStatus != 5
        </cfquery>

        <cfset data["fullname"] = q_artist.fullname>
        <cfset data["img"] = q_artist.img>
        <cfset data["alt"] = q_artist.alt>

        <cfquery name="q_motto" datasource="#application.datasource#">
            select 
                motto
            from mottos m
            inner join scripts s on s.id = m.scriptId 
            where 1 = 1
            and m.memberId = '#q_artist.id#'
            and s.script = '#session.lang#'
        </cfquery>

        <cfset data["motto"] = q_motto.motto>

        <cfquery name="q_biography" datasource="#application.datasource#">
            select 
                paragraph
            from biographies b
            inner join scripts s on s.id = b.scriptId 
            where 1 = 1
            and b.memberId = '#q_artist.id#'
            and s.script = '#session.lang#'
        </cfquery>

        <cfset data["paragraphs"] = QUERY.toArray(q_biography)>

        <cfreturn data>
    </cffunction>
</cfcomponent>