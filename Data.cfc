<cfcomponent>

    <cfset QUERY = createObject('component', 'utilis/Query')>

    <cffunction name="getAnnouncements" access="public" returntype="array">
        <cfquery name="q_announcements" datasource="#application.datasource#">
            select 
                case
                    when 'sr-Cyrl' = '#session.lang#' then p.nameCyr
                    when 'sr-Latn' = '#session.lang#' then p.name
                    else p.nameEn
                end as performanceName,
                case
                    when 'sr-Cyrl' = '#session.lang#' then p.sloganCyr
                    when 'sr-Latn' = '#session.lang#' then p.slogan
                    else p.sloganEn
                end as slogan,
                DATE_FORMAT(a.dateAndTime, '%d.%m.%Y.') eventDate,
                DATE_FORMAT(a.dateAndTime, '%H.%i') eventTime,
                case
                    when 'sr-Cyrl' = '#session.lang#' then a.noteCyr
                    when 'sr-Latn' = '#session.lang#' then a.note
                    else a.noteEn
                end as note,
                case
                    when 'sr-Cyrl' = '#session.lang#' then pl.hallCyr
                    when 'sr-Latn' = '#session.lang#' then pl.hall
                    else pl.hallEn
                end as hall,
                case
                    when 'sr-Cyrl' = '#session.lang#' then pl.cityCyr
                    when 'sr-Latn' = '#session.lang#' then pl.city
                    else pl.cityEn
                end as hall,
                p.img,
                p.pathname
            from announcements a 
            inner join performances p on a.performanceId = p.id
            inner join places pl on a.placeId = pl.id
            where 
            cancelled = 0
            and a.dateAndTime >= CURDATE();
        </cfquery>

        <cfreturn QUERY.toArray(q_announcements)>
    </cffunction>
</cfcomponent>