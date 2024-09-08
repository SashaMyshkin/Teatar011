<cfcomponent>
    <cfset QUERY = createObject('component', '../../utilis/Query')>
    <cffunction name="getRoles" access="public" returntype="array">
        <cfargument name="identifier" type="string" required="true">
        <cfargument name="pathname" type="string" required="true">

        <cfquery name="q_roles" datasource="#application.datasource#">
            select 
                case
                    when 'sr-Cyrl' = '#session.lang#' then p.nameCyr
                    when 'sr-Latn' = '#session.lang#' then p.name
                    else p.nameEn
                end as performanceName,
                case
                    when 'sr-Cyrl' = '#session.lang#' then r.roleCyr
                    else r.role
                end as roleName,
                case
                    when '#session.lang#' = 'sr-Cyrl' then CONCAT(m.nameCyr, ' ', m.surnameCyr)
                    else CONCAT(m.name, ' ', m.surname)
                end memberFullName,
                m.identifier,
                p.pathname,
                rm.img,
                rm.alt,
                p.pathname,
                m.identifier
            from rolesMembers rm
            inner join roles r on rm.roleId = r.id
            inner join performances p on p.id = r.performanceId
            inner join members m on rm.memberId = m.id
            where m.active = 1
            and p.active = 1
            /*and rm.img is not null*/

            <cfif identifier NEQ "">
                and m.identifier="#identifier#"
            </cfif>

            <cfif pathname NEQ "">
                and p.pathname="#pathname#"
            </cfif>

            order by r.id
        </cfquery>

        <cfreturn QUERY.toArray(q_roles)>
    </cffunction>
</cfcomponent>