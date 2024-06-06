<cfcomponent>
    <cfinclude template="txt.cfm">
    <cfset QUERY = createObject('component', '../../utilis/Query')>

    <cffunction name="getAwards" access="public" returntype="array">
        <cfargument name="member" type="string" required="true">
        <cfargument name="performance" type="string" required="true">


        <cfquery name="q_awards" datasource="#application.datasource#">
            SELECT 
                case
                    when 'sr-Cyrl' = '#session.defaultScript#' then f.nameCyr
                    when 'sr-Latn' = '#session.defaultScript#' then f.name
                    else f.nameEn
                end as festivalName,
                YEAR(f.eventDate) AS year,
                case
                    when 'sr-Cyrl' = '#session.defaultScript#' then aw.nameCyr
                    when 'sr-Latn' = '#session.defaultScript#' then aw.name
                    else aw.nameEn
                end as award,
                case
                    when '#session.defaultScript#' = 'sr-Cyrl' then CONCAT(m.nameCyr, ' ', m.surnameCyr)
                    else CONCAT(m.name, ' ', m.surname)
                end memberFullName,
                case
                    when a.awardTypeId in (11, 12, 13, 14)
                        then
                            case
                                when 'sr-Cyrl' = '#session.defaultScript#' then a.noteCyr
                                when 'sr-Latn' = '#session.defaultScript#' then a.note
                                else a.noteEn
                            end
                    else ''   
                end as note,
                case
                    when 'sr-Cyrl' = '#session.defaultScript#' then p.nameCyr
                    when 'sr-Latn' = '#session.defaultScript#' then p.name
                    else p.nameEn
                end as performanceName,
                a.awardTypeId

            FROM 
                awards a
            INNER JOIN 
                festivals f ON f.id = a.festivalId
            INNER JOIN 
                members m ON m.id = a.memberId
            INNER JOIN 
                awardType aw ON aw.id = a.awardTypeId
            INNER JOIN 
                performances p ON p.id = a.performanceId
            WHERE 1 = 1
            <cfif member NEQ "">
                and m.identifier="#performance#"
            </cfif>

            <cfif performance NEQ "">
                and p.pathname="#performance#"
            </cfif>

        </cfquery>

        <cfreturn QUERY.toArray(q_awards)>
    </cffunction>
</cfcomponent>